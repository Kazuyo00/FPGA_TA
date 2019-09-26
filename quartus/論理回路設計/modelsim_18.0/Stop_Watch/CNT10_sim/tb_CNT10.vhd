library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity tb_CNT10 is
end    tb_CNT10;


architecture SIM of tb_CNT10 is

  component CNT10 
    port (div_clk,RST,STP,DSP: in std_logic;
          up_sig: out std_logic;
          count : out std_logic_vector(3 downto 0));
  end component;

  signal div_clk: std_logic :='1';
  signal RST: std_logic :='1';
  signal STP,DSP,up_sig: std_logic :='0';
  signal count:  std_logic_vector(3 downto 0);

begin
  DUT: CNT10 port map(div_clk,RST,STP,DSP,up_sig,count);

------------------div_clock 1000ns cycle----------------

process begin
    div_clk <= '1'; wait for 500 ns;
    div_clk <= '0'; wait for 500 ns;
end process;

-------------------reset,stop,display------------------

process begin 

  wait for 3.0 us; RST <= '0';
  wait for 6.0 us; STP <= '1'; 
  wait for 3.0 us; DSP <= '1'; wait for  3.5 us; DSP <= '0';
  wait for 5.5 us; STP <= '0';
  wait for 7.5 us; DSP <= '1'; wait for 10.0 us; RST <= '1';
  wait for 2.5 us;
  assert false severity failure;
  end process;

end SIM;


configuration cfg_tb_CNT10 of tb_CNT10 is
  for SIM
  end for;
end cfg_tb_CNT10;

