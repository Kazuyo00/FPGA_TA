library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;	

entity tb_Binary_to_BCD is
end tb_Binary_to_BCD;


architecture SIM of tb_Binary_to_BCD is

  component Binary_to_BCD
    port(bin_in: in  std_logic_vector(4 downto 0);	--why 5bit? => adapt result(0 ~ 30)
         bcd_d1: out std_logic_vector(3 downto 0);
         bcd_d2: out std_logic_vector(3 downto 0));
  end component;

signal bin_in         : std_logic_vector(4 downto 0):="00000";
signal bcd_d1, bcd_d2 : std_logic_vector(3 downto 0);


begin
  DUT: Binary_to_BCD
    port map (bin_in, bcd_d1, bcd_d2);

--for roop
  process begin

    for I in 0 to 31 loop
      wait for 100 ns; 
      bin_in <= bin_in + '1';
    end loop;
    assert false severity failure;		--end simulation
  
  end process;
end SIM;

--omazinai
configuration cfg_tb_Binary_to_BCD of tb_Binary_to_BCD is
  for SIM
  end for;
end cfg_tb_Binary_to_BCD;