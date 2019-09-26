library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_Bit4_Counter is
end tb_Bit4_Counter;


architecture SIM of tb_Bit4_Counter is

  component Bit4_Counter is
    port(count_in, reset : in std_logic;
         count_out 	 : out std_logic_vector(3 downto 0));
  end component;

  signal count_in, reset : std_logic :='1';			--initialize 1(OFF)
  signal count_out	 : std_logic_vector(3 downto 0);

  constant  STEP: time := 100 ns;


begin
  DUT: Bit4_Counter 
        port map (count_in, reset, count_out);

--infinity Loop
  process begin
    count_in <= '1';  wait for STEP/2;
    count_in <= '0';  wait for STEP/2;
  end process;

  process begin
    reset <= '1'; wait for  370 ns;
    reset <= '0'; wait for   50 ns;
    reset <= '1'; wait for 2080 ns;
    assert false severity failure;		--end simulation
  end process;
end SIM;


configuration cfg_tb_Bit4_Counter of tb_Bit4_Counter is
  for SIM
  end for;
end cfg_tb_Bit4_Counter;

