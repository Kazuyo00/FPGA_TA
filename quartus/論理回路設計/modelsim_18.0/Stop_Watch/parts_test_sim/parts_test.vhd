library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity parts_test is port (CLK, reset, stop, disp: in  std_logic;
                           up_sig: out std_logic;
                           count : out std_logic_vector(3 downto 0) );
end parts_test;


architecture RTL of parts_test is

-----------------------call modulle---------------------

  component div_10ms  port (CLK    : in  std_logic;
                            div_clk: out std_logic);
  end component;

  component signal_gen  port (clk, reset, stop, disp: in std_logic;
                              RST,STP,DSP: out std_logic);
  end component;

  component CNT10  port (div_clk,RST,STP,DSP: in  std_logic;
                         up_sig: out std_logic;
                         count : out std_logic_vector(3 downto 0));
  end component;

---------------------define signal---------------------

  signal div_sig, rst_sig, stp_sig, dsp_sig : std_logic;

begin

-------------------connection module-----------------
  
  DIV: div_10ms 
    port map (clk, div_sig);
 
  SCT: signal_gen 
    port map (clk,reset,stop,disp,rst_sig,stp_sig,dsp_sig); 

  CNT: CNT10 
    port map (div_sig,rst_sig,stp_sig,dsp_sig,up_sig,count);

end RTL;
