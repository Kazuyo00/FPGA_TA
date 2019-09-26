--Top module for half_adder
library IEEE;
use IEEE.std_logic_1164.all;


entity half_adder_top is
	port(CLK, A_in, B_in        : in std_logic;
		  HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0));		--HEX(Hexadecimal number : 16進数)
end half_adder_top;

----------------------モジュール呼び出し---------------------------

architecture RTL of half_adder_top is

	component peripheral_half
		port(CLK, A, B              : in  std_logic;
           S_in, CO_in            : in  std_logic;
	        A_out, B_out           : out std_logic;
	        LED0, LED1, LED2, LED3 : out std_logic_vector(6 downto 0));
	end component;
	
	component half_adder is
		port(A,B  : in std_logic;
		     S,CO : out std_logic);
	end component;
		
-------------------------信号線定義---------------------------
		
	signal a_sig, b_sig, S_sig, CO_sig : std_logic;
	
------------------------モジュール繋ぎ合わせ--------------------

-------------------データの流れ : 入力信号=>peripheral内チャタリング=>half_adder=>peripheral内デコーダ--------------------

begin

	INST1 : peripheral_half
		port map(CLK => CLK, A=>A_in, B=>B_in,						--モジュールの信号 => topの信号
					A_out => a_sig, B_out => b_sig,
					S_in => S_sig, CO_in => CO_sig,
					LED0 => HEX0, LED1 => HEX1, LED2 => HEX2, LED3 => HEX3);
					
	INST2 : half_adder
		port map(A => a_sig, B => b_sig, S => S_sig, CO => CO_sig);
	
end RTL;
	