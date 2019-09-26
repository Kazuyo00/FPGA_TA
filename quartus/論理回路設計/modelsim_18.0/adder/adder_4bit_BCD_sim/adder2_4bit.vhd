library IEEE;
use IEEE.std_logic_1164.all;


entity adder2_4bit is
       port(A, A_reset, B, B_reset             : in  std_logic;
            HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0));
end adder2_4bit;


architecture RTL of adder2_4bit is

---------------------call module--------------------------
  
  component full_adder2 
    port(A, B, CIN : in  std_logic;
         S, CO     :  out std_logic);
  end component;

  component Bit4_Counter 
    port(count_in, reset : in std_logic;
         count_out       : out std_logic_vector(3 downto 0));
  end component;

  component Bit4_to_7segLED
    port(in4 : in  std_logic_vector(3 downto 0);
         seg : out std_logic_vector(6 downto 0));
  end component;
  
  component Binary_to_BCD
    port(bin_in: in  std_logic_vector(4 downto 0);
	      bcd_d1: out std_logic_vector(3 downto 0);
	      bcd_d2: out std_logic_vector(3 downto 0));
  end component;

-------------------------define signal--------------------------
  
  signal A_sig,B_sig,C_sig   : std_logic_vector(3 downto 0);
  signal ADD                 : std_logic_vector(4 downto 0);					--why 5bit => result(0 ~ 30)
  signal CO_0, CO_1, CO_2    : std_logic;
  
  signal A_01,A_10,B_01,B_10 : std_logic_vector(3 downto 0);
  signal ADD_01,ADD_10       : std_logic_vector(3 downto 0);
  signal A_tmp,B_tmp			  : std_logic_vector(4 downto 0);

begin

--------------------------connection module---------------------------

  CNT_A : Bit4_Counter port map(A,A_reset,A_sig);
  CNT_B : Bit4_Counter port map(B,B_reset,B_sig);
  
  ADD_0 : full_adder2 port map(A_sig(0),B_sig(0),'0', ADD(0),CO_0);		--ADD(Summation result) , CO(Carry Over)
  ADD_1 : full_adder2 port map(A_sig(1),B_sig(1),CO_0,ADD(1),CO_1);
  ADD_2 : full_adder2 port map(A_sig(2),B_sig(2),CO_1,ADD(2),CO_2);
  ADD_3 : full_adder2 port map(A_sig(3),B_sig(3),CO_2,ADD(3),ADD(4));		--ADD(4)(Carry Over(0x)) , over 16 => ADD(4) => 1 , under 15 => ADD(4) => 0

  A_tmp <= '0'&A_sig; B_tmp <= '0'&B_sig;											--input signal(4bit) => (5bit)
  BCD_B  : Binary_to_BCD port map (B_tmp,B_01,B_10);
  BCD_A  : Binary_to_BCD port map (A_tmp,A_01,A_10);
  BCD_AD : Binary_to_BCD port map (ADD,ADD_01,ADD_10);
  
  LED5 :  Bit4_to_7segLED port map (B_10,HEX5);
  LED4 :  Bit4_to_7segLED port map (B_01,HEX4);
  LED3 :  Bit4_to_7segLED port map (A_10,HEX3);
  LED2 :  Bit4_to_7segLED port map (A_01,HEX2);
  LED1 :  Bit4_to_7segLED port map (ADD_10,HEX1); 
  LED0 :  Bit4_to_7segLED port map (ADD_01,HEX0); 
  
    
  --LED5:  Bit4_to_7segLED port map (A_sig,HEX5);
  --LED3:  Bit4_to_7segLED port map (B_sig,HEX3);

  --C_sig <= "000" & ADD(4);  
  --LED1:  Bit4_to_7segLED port map (C_sig,HEX1); 
  --LED0:  Bit4_to_7segLED port map (ADD(3 downto 0),HEX0); 

end RTL;
