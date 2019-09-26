library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity blink is
	port (CLK : in std_logic;
        RST : in std_logic;
        LED : out std_logic_vector(3 downto 0));
end blink;

architecture Behavioral of blink is
	signal cnt23 : std_logic_vector(22 downto 0);
	signal cnt3 : std_logic_vector(2 downto 0);

begin

process(CLK)
begin
	if(CLK'event and CLK='1')then
		if(RST='1')then
			cnt23 <= "00000000000000000000000";
		else
			cnt23 <= cnt23 + '1';
		end if;
	end if;
end process;

process(CLK)
begin
	if(CLK' event and CLK='1')then
		if(RST='1')then
			cnt3 <= "000";
		elsif(cnt23="11111111111111111111111")then
			if(cnt3="101")then
				cnt3 <= "000";
			else
				cnt3 <= cnt3 + '1';
			end if;
		end if;
	end if;
end process;

process(cnt3)
begin
	case cnt3 is
		when "000" => LED <= "0001";
		when "001" => LED <= "0010";
		when "010" => LED <= "0100";
		when "011" => LED <= "1000";
		when "100" => LED <= "0100";
		when "101" => LED <= "0010";
		when others => LED <= "0000";
	end case;
end process;

end Behavioral;