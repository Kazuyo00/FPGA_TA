library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LEDCUBE is
	port (CLK : in std_logic;
		 RST : in std_logic;
		 SW1 : in std_logic;
		 SW2 : in std_logic;
		 LED : out std_logic_vector(11 downto 0));
end LEDCUBE;

architecture Behavioral of LEDCUBE is
	signal cnt23 : std_logic_vector(22 downto 0);
	signal cnt5 : std_logic_vector(4	downto 0);
	signal cnt4 : std_logic_vector(3 downto 0);
	signal cnt2 : std_logic_vector(1 downto 0);
	
begin

process(CLK)
begin
	if(CLK'event and CLK='1')then
		if(RST='0')then
			cnt23 <= "00000000000000000000000";
		else
			cnt23 <= cnt23 + '1';
		end if;
	end if;
end process;

process(CLK)
begin
	if(CLK' event and CLK='1')then
		if(RST='0')then
			cnt5 <= "11111";
			cnt4 <= "1111";
			cnt2 <= "11";
		elsif(cnt23="11111111111111111111111")then
			if(cnt5="11001")then
				cnt5 <= "00000";
			elsif(cnt4="0111")then
				cnt4 <= "0000";
			elsif(cnt2="10")then
				cnt2 <= "00";
			else
				cnt5 <= cnt5 + '1';
				cnt4 <= cnt4 + '1';
				cnt2 <= cnt2 + '1';
			end if;
		end if;
	end if;
end process;

process(cnt5,cnt4,cnt2,SW1,SW2)
begin
	if(SW1='1' and SW2='0')then
		case cnt5 is
			when "00000" => LED <= "000000010011";
			when "00001" => LED <= "000000100011";
			when "00010" => LED <= "000001000011";
			when "00011" => LED <= "000010000011";
			when "00100" => LED <= "000100000011";
			when "00101" => LED <= "001000000011";
			when "00110" => LED <= "010000000011";
			when "00111" => LED <= "100000000011";
			when "01000" => LED <= "000000010011";
			
			when "01001" => LED <= "000000010101";
			when "01010" => LED <= "000000100101";
			when "01011" => LED <= "000001000101";
			when "01100" => LED <= "000010000101";
			when "01101" => LED <= "000100000101";
			when "01110" => LED <= "001000000101";
			when "01111" => LED <= "010000000101";
			when "10000" => LED <= "100000000101";
			when "10001" => LED <= "000000010101";
                        
			when "10010" => LED <= "000000010110";
			when "10011" => LED <= "000000100110";
			when "10100" => LED <= "000001000110";
			when "10101" => LED <= "000010000110";
			when "10110" => LED <= "000100000110";
			when "10111" => LED <= "001000000110";
			when "11000" => LED <= "010000000110";
			when "11001" => LED <= "100000000110";
			
			when "11111" => LED <= "000000000000";
			when others => null;
		end case;
	
	elsif(SW1='0' and SW2='1')then
		case cnt2 is
			when "00" => LED <= "111111111011";
			when "01" => LED <= "111111111101";
			when "10" => LED <= "111111111110";
			when "11" => LED <= "000000000000";
			when others => null;
		end case;
	
	else
		case cnt4 is
			when "0000" => LED <= "000000010000";
			when "0001" => LED <= "000000100000";
			when "0010" => LED <= "000001000000";
			when "0011" => LED <= "000010000000";
			when "0100" => LED <= "000100000000";
			when "0101" => LED <= "001000000000";
			when "0110" => LED <= "010000000000";
			when "0111" => LED <= "100000000000";
			when "1111" => LED <= "000000000000";
			when others => null;
		end case;
	end if;
end process;

end Behavioral;