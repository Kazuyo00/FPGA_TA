tb_BS_to_7segLED

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_BS_to_7segLED is
end  tb_BS_to_7segLED;


architecture SIM of tb_BS_to_7segLED is

  component BS_to_7segLED
     port(BS_in : in  std_logic_vector(4 downto 0);
          seg   : out std_logic_vector(6 downto 0));
  end component;
  
  signal BS_in : std_logic_vector(4 downto 0) :="00000";
  signal seg : std_logic_vector(6 downto 0); 

begin
  DUT: BS_to_7segLED port map (BS_in, seg);

-------------------for loop------------------------
  
  process begin
    for I in 0 to 31 loop
      wait for 100 ns; BS_in <=BS_in + '1';
    end loop;
    assert false severity failure;
  end process;

end SIM;


configuration cfg_tb_BS_to_7segLED of tb_BS_to_7segLED is
  for SIM
  end for;
end cfg_tb_BS_to_7segLED;

