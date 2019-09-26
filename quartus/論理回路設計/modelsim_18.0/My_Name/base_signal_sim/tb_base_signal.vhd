tb_base_signal

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity tb_base_signal is
end tb_base_signal;


architecture SIM of tb_base_signal is

  component base_signal
     port( div_clk, reset, stop         : in std_logic;
           bs0, bs1, bs2, bs3, bs4, bs5 : out std_logic_vector(4 downto 0) );
  end component;

  signal div_clk : std_logic          := '0' ;
  signal reset, stop: std_logic       := '1' ;
  signal bs0, bs1, bs2, bs3, bs4, bs5 : std_logic_vector (4 downto 0);
  constant  STEP: time := 1 us ;

begin
  
  DUT: base_signal
    port map(div_clk, reset, stop, bs0, bs1, bs2, bs3, bs4, bs5);

---------------------Infinity clock loop--------------------------

  process begin 
    div_clk <= '0'; wait for STEP/2; div_clk <= '1'; wait for STEP/2;
  end process;

-----------------------reset and stop--------------------------

  process begin 
    wait for  5.3 us ;  reset <= '0'; wait for  2.5 us ;  reset <= '1';
    wait for 30.7 us ;  stop  <= '0'; wait for  2.0 us ;  stop  <= '1';
    wait for  8.2 us ;  stop  <= '0'; wait for  3.8 us ;  stop  <= '1';
    wait for 67.5 us ;  
    assert false severity failure;
  end process;

end SIM;


configuration cfg_tb_base_signal of tb_base_signal is
  for SIM
  end for;
end cfg_tb_base_signal;

