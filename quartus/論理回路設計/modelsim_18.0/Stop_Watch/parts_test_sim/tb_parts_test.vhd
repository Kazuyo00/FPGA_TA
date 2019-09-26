library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_parts_test is
end    tb_parts_test;


architecture SIM of tb_parts_test is
  
  component parts_test
    port (CLK, reset, stop, disp: in  std_logic;
          up_sig: out std_logic;
          count : out std_logic_vector(3 downto 0) );
  end component;

  signal CLK, reset, stop, disp: std_logic :='1';
  signal up_sig: std_logic :='0';
  signal count:  std_logic_vector(3 downto 0);

begin
  DUT: parts_test port map (CLK,reset,stop,disp,up_sig,count);

--------------------clock 20ns cycle------------------------

process begin
    CLK <= '1'; wait for 10 ns;
    CLK <= '0'; wait for 10 ns;
end process;

-------------------reset------------------

process begin 
  wait for  3.0 us; reset <= '0'; wait for 2.0 us; reset <= '1';
  wait for 33.5 us; reset <= '0'; wait for 1.0 us; reset <= '1';
  wait for  1.5 us;
  assert false severity failure;
end process;

--------------------stop------------------

process begin 
  wait for  9.0 us; stop  <= '0'; wait for 1.0 us; stop  <= '1';
  wait for 11.0 us; stop  <= '0'; wait for 1.5 us; stop  <= '1';
  wait for 19.5 us;
end process;

-------------------display---------------------

process begin 
  wait for 12.0 us; disp  <= '0'; wait for 1.0 us; disp  <= '1';
  wait for  2.5 us; disp  <= '0'; wait for 1.5 us; disp  <= '1';
  wait for 11.5 us; disp  <= '0'; wait for 2.0 us; disp  <= '1';
  wait for 10.5 us;
end process;

end SIM;


configuration cfg_tb_parts_test of tb_parts_test is
  for SIM
  end for;
end cfg_tb_parts_test;

