my_name

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity my_name is 
  port(CLK, RESET, STOP: in std_logic;
       HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector (6 downto 0));
end my_name;


architecture RTL of my_name is

--------------------------call module------------------------------

  component divide_clock is 
    port(CLK     : in std_logic;
         div_clk : out std_logic);
  end component;

  component base_signal is 
    port(div_clk, reset, stop         : in std_logic;
         bs0, bs1, bs2, bs3, bs4, bs5 : out std_logic_vector(4 downto 0));
  end component;

  component BS_to_7segLED is 
    port(BS_in : in  std_logic_vector(4 downto 0);
         seg   : out std_logic_vector(6 downto 0));
  end component;

-------------------------define signal--------------------------------- 

  signal div_clk : std_logic;
  signal sig0,sig1,sig2,sig3,sig4,sig5: std_logic_vector(4 downto 0);

begin

-------------------------connection module---------------------------

  DIVID: divide_clock   port map (CLK, div_clk);
  BSGEN: base_signal    port map (div_clk,RESET,STOP,
                                  sig0, sig1, sig2, sig3, sig4, sig5);
  LED_0: BS_to_7segLED  port map (sig0, HEX0);
  LED_1: BS_to_7segLED  port map (sig1, HEX1);
  LED_2: BS_to_7segLED  port map (sig2, HEX2);
  LED_3: BS_to_7segLED  port map (sig3, HEX3);
  LED_4: BS_to_7segLED  port map (sig4, HEX4);
  LED_5: BS_to_7segLED  port map (sig5, HEX5);

end RTL;