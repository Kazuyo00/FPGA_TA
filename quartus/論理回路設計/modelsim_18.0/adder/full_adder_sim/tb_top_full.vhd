library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_top_full is
end tb_top_full;


architecture SIM of tb_top_full is
  component top_full_adder
    port(INPUT 			  : in   std_logic_vector(2 downto 0);
         HEX0,HEX1,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0));
  end component;

  signal INPUT 			  : std_logic_vector(2 downto 0):="111";			--initialize 111
  signal HEX0,HEX1,HEX3,HEX4,HEX5 : std_logic_vector(6 downto 0);

  constant  STEP: time := 100 ns;


begin
  DUT: top_full_adder 
        port map (INPUT,HEX0,HEX1,HEX3,HEX4,HEX5);

--infinity roop
  process begin
    INPUT <= INPUT + '1'; wait for STEP;
  end process;

  process begin
    wait for STEP*8;
    assert false severity failure;		--end simulation
  end process;
end SIM;

--omazinai
configuration cfg_tb_top_full of tb_top_full is
  for SIM
  end for;
end cfg_tb_top_full;
