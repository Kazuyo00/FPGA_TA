library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity signal_gen is
  port ( clk, reset, stop, disp : in std_logic;
         RST, STP, DSP          : out std_logic);		--DSP : Display
end signal_gen;


architecture RTL of signal_gen is
  signal rst_sig: std_logic := '1';
  signal stp_sig, dsp_sig: std_logic := '0';


begin

--------------------------not sync reset------------------------

process (clk, reset) begin
  if (reset'event and reset='0') then  
    rst_sig <= NOT(rst_sig); 
  end if;
end process;

-------------------------------stop--------------------------

process (clk, stop) begin
  if (rst_sig='1') then 
    stp_sig <='0';
  elsif (stop'event and stop='0') then 
    stp_sig <= NOT(stp_sig);
  end if;
end process;

------------------------------disp---------------------------

process (clk, disp) begin
  if (rst_sig='1') then dsp_sig <='0';
  elsif (disp'event and disp='0') then dsp_sig <= NOT(dsp_sig);
 end if;
end process;

  RST <= rst_sig;
  STP <= stp_sig;
  DSP <= dsp_sig;

end RTL;


