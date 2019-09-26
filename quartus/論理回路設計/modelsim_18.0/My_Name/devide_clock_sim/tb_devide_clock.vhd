tb_divide_clock

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity tb_divide_clock is
end tb_divide_clock;


architecture SIM of tb_divide_clock is

  component  divide_clock
    port (CLK     :  in std_logic;
          div_clk : out std_logic);
  end component;

  signal CLK : std_logic    := '0' ;
  signal div_clk: std_logic := '0';
  constant  STEP: time      := 20 ns ;

begin
  U0: divide_clock port map(CLK, div_clk );

--------------------infinity loop-------------------------
 
  process begin 
    CLK <= '1'; wait for STEP/2;
    CLK <= '0'; wait for STEP/2;
  end process;
 
------------------simulate 5us (5000ns) => 250 STEP------------------------

  process begin 
      wait for 5 us ; assert false severity failure;
    end process;
  end SIM;


configuration cfg_tb_divide_clock of tb_divide_clock  is
  for SIM
  end for;
end cfg_tb_divide_clock;

