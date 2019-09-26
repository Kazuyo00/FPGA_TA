library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity bunsyuu_22 is
	port (CLK : in std_logic :='0';
			LCLK1 : out std_logic :='0');
end bunsyuu_22;

architecture Behaviorl of bunsyuu_22 is
	signal cnt22 : std_logic_vector(22 downto 0);
begin

process(CLK)
begin
	if(CLK' event and CLK='1')then
		cnt22 <= cnt22+'1';
	end if;
end process;

process(CLK)
begin
	if(cnt22="11111111111111111111111")then
		LCLK1 <= '1';
	else
		LCLK1 <= '0';
	end if;
end process;

end Behaviorl;