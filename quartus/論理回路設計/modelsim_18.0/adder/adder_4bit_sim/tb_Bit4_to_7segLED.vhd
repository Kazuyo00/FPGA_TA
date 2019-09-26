library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_Bit4_to_7segLED is
end    tb_Bit4_to_7segLED;


architecture SIM of tb_Bit4_to_7segLED is

  component Bit4_to_7segLED
     port( in4 : in  std_logic_vector(3 downto 0);
           seg : out std_logic_vector(6 downto 0));
  end component;

  signal in4 : std_logic_vector(3 downto 0) :="0000";
  signal seg : std_logic_vector(6 downto 0); 


begin
  DUT: Bit4_to_7segLED port map (in4, seg);

  process begin
    for I in 0 to 15 loop			--for Loop
      wait for 100 ns; in4 <= in4 + '1';
    end loop;
    assert false severity failure;		--when I=15 , end simulation
  end process;
end SIM;


configuration cfg_tb_Bit4_to_7segLED of tb_Bit4_to_7segLED is
  for SIM
  end for;
end cfg_tb_Bit4_to_7segLED;

