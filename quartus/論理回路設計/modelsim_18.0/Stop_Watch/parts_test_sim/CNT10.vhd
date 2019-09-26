library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity CNT10 is port (div_clk,RST,STP,DSP: in  std_logic;
                      up_sig: out std_logic;
                      count : out std_logic_vector(3 downto 0));
end CNT10;


architecture RTL of CNT10 is

  signal c_counter, s_counter: std_logic_vector(3 downto 0) := "0000";
  signal count_sig: std_logic := '0';

begin

process(div_clk) begin

  if (RST = '1') then 
    c_counter <="0000";

-----counter = '9' => counter = '0' , up_sig ='1'-----

  elsif (div_clk'event and div_clk='1') then
    if (c_counter="1001") then 
      count_sig <='1'; c_counter <= "0000";
    else
      count_sig <='0';  c_counter <= c_counter + '1';
    end if;
  end if;

---------------stop------------------------

  if (STP = '1') then 
    s_counter <= s_counter;
  else
    s_counter <= c_counter;
  end if;

---------------DSP(Display)----------------

  if (DSP = '1') then 
    count <= s_counter;
  else count <= c_counter;
  end if;

end process;
  up_sig <= count_sig;

end RTL;

