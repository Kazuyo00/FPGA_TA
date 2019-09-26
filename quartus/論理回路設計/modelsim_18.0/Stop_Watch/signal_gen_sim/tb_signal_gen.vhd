library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_signal_gen is
end    tb_signal_gen;

architecture SIM of tb_signal_gen is

  component signal_gen  
    port (clk, reset, stop, disp : in std_logic;
          RST, STP, DSP          : out std_logic);
  end component;

  signal clk, reset, stop, disp: std_logic :='1';
  signal RST, STP, DSP: std_logic :='0';

begin
  DUT: signal_gen port map (clk,reset,stop,disp,RST,STP,DSP);

------------------clock 20ns cycle------------------------

process begin
    clk <= '1'; wait for 10 ns;  clk <= '0'; wait for 10 ns;
end process;

-----------------------------reset-----------------------------

process begin 
  wait for  8.0 us; reset <= '0'; wait for 2.0 us; reset <= '1';
  wait for 18.0 us; reset <= '0'; wait for 1.5 us; reset <= '1';
  wait for  5.8 us;
  assert false severity failure;
end process;

-----------------------------stop------------------------------

process begin 
  wait for  2.5 us; stop  <= '0'; wait for 1.0 us; stop  <= '1';
  wait for  7.5 us; stop  <= '0'; wait for 1.5 us; stop  <= '1';
  wait for  5.0 us; stop  <= '0'; wait for 1.0 us; stop  <= '1';
  wait for 16.5 us;
end process;

-----------------------------disp------------------------------

process begin 
  wait for  5.0 us; disp  <= '0'; wait for 1.0 us; disp  <= '1';
  wait for 15.0 us; disp  <= '0'; wait for 1.5 us; disp  <= '1';
  wait for  8.0 us; disp  <= '0'; wait for 1.0 us; disp  <= '1';
  wait for  3.5 us;
end process;

end SIM;


configuration cfg_tb_signal_gen of tb_signal_gen is
  for SIM
  end for;
end cfg_tb_signal_gen;

