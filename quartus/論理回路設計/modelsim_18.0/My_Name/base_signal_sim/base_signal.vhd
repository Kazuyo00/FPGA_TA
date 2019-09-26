library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity base_signal is
  port(div_clk, reset, stop : in std_logic;
       bs0, bs1, bs2, bs3, bs4, bs5 : out std_logic_vector(4 downto 0));	--number of 7segLED
end base_signal ;

architecture RTL of base_signal is
  signal counter : std_logic_vector(4 downto 0) :="00100";
  signal STP : std_logic :='1';

begin 

--------------------------stop-----------------------------

process (stop) begin
  if (stop'event and stop='0') then STP <= NOT(STP);		--Stop (Negative logic) ENABLE = '0' , DISABLE = '1'
  end if;
end process;

-------------------not Sync reset and add-------------------------- 

process (div_clk, reset, STP) begin

  if (reset='0') then					--not Sync reset
    counter <= "00101";

  elsif (div_clk'event and div_clk = '1') then		--positive edge
    if (STP = '0') then 
      counter <= counter;				--if STOP is ENABLE
    else 
      counter <= counter + '1';
    end if;
  end if;

end process;

---------------------delay 7segLED display----------------------------
  
  bs0 <= counter(4 downto 0);
  bs1 <= counter(4 downto 0)-"00001";
  bs2 <= counter(4 downto 0)-"00010";
  bs3 <= counter(4 downto 0)-"00011";
  bs4 <= counter(4 downto 0)-"00100";
  bs5 <= counter(4 downto 0)-"00101";

end RTL;

