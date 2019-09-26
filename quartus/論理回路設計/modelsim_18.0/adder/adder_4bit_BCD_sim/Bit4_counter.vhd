library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Bit4_Counter is
  port(count_in, reset : in std_logic;
       count_out       : out std_logic_vector(3 downto 0));
end Bit4_Counter;


architecture RTL of Bit4_Counter is
  signal counter : std_logic_vector(3 downto 0) :="0000";	--initialize "0000"


begin

process (count_in, reset)
  begin 
    if reset='0' then counter <= "0000";	
    elsif (count_in'event and count_in='0') then 
      counter <= counter + 1;			--counter 1111 => 0000 => 0001 ... , 4bit(0~15) counter	 
    end if;
  end process;
  count_out <= counter;		--locate port in process => error
end RTL;