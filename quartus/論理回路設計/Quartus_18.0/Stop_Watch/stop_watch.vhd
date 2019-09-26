--stop_watch.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity stop_watch is
  port (CLK, RESET, STOP, DISP: in  std_logic;
        HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector(6 downto 0));
end stop_watch;

--------------------call module----------------------------

architecture RTL of stop_watch is
  component chattering port (clk, SW_in : in  std_logic;
                             SW_out    : out std_logic ); 
  end component;
  component div_10ms  port (CLK: in  std_logic;
                            div_clk: out std_logic);
  end component;
  component signal_gen port (clk, reset, stop, disp: in std_logic;
                               RST, STP, DSP: out std_logic);
  end component;
  component CNT10 port (div_clk,RST,STP,DSP: in  std_logic;
                        up_sig: out std_logic;
                        count : out std_logic_vector(3 downto 0)); 
  end component;
  component CNT06 port (div_clk,RST,STP,DSP: in  std_logic;
                        up_sig: out std_logic;
                        count : out std_logic_vector(3 downto 0));
  end component;
  component Bit4_to_7segLED port (in4 : in  std_logic_vector(3 downto 0);
                                  seg : out std_logic_vector(6 downto 0));
  end component;
  component HEX5_7segLED port (sin: in  std_logic;
                               seg: out std_logic_vector(6 downto 0));
  end component;
  
--------------------define signal----------------------------  
  
  signal chat_rst,chat_stp,chat_disp: std_logic;
  signal rst_sig,stp_sig,dsp_sig: std_logic;
  signal clk_10ms,clk_100ms: std_logic;
  signal clk_01s,clk_10s,clk_60s,clk_100: std_logic;
  signal led0_sig,led1_sig,led2_sig,led3_sig,led4_sig: std_logic_vector(3 downto 0);
  
  
  begin
  
--------------------connection module--------------------------
  
 CHTRST: chattering port map (CLK, RESET, chat_rst);
 CHTSTP: chattering port map (CLK, STOP,  chat_stp);
 CHTDSP: chattering port map (CLK, DISP,  chat_disp);
 
 DIVIDE: div_10ms port map (CLK, clk_10ms);
 
 SLCT: signal_gen
  port map (CLK,chat_rst,chat_stp,chat_disp,rst_sig,stp_sig,dsp_sig);
 
 LED5:   HEX5_7segLED port map (dsp_sig, HEX5); 

 PLC10M: CNT10 port map (clk_10ms,rst_sig,stp_sig,dsp_sig,clk_100ms, led0_sig);
 LED0:   Bit4_to_7segLED port map (led0_sig, HEX0);

 PLC100: CNT10  port map (clk_100ms,rst_sig,stp_sig,dsp_sig,clk_01s, led1_sig);
 LED1:   Bit4_to_7segLED port map (led1_sig, HEX1);

 PLC1S:  CNT10  port map (clk_01s,  rst_sig,stp_sig,dsp_sig,clk_10s, led2_sig);
 LED2:   Bit4_to_7segLED port map (led2_sig, HEX2);

 PLC10S: CNT06  port map (clk_10s, rst_sig,stp_sig,dsp_sig,clk_60s, led3_sig);
 LED3:   Bit4_to_7segLED port map (led3_sig, HEX3);

 PLC60S: CNT10  port map (clk_60s, rst_sig,stp_sig,dsp_sig,clk_100, led4_sig);
 LED4:   Bit4_to_7segLED port map (led4_sig, HEX4);

end RTL;

