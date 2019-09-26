library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder_7seg is
	port (DIN : in std_logic_vector(3 downto 0) :="0000";
			DOUT : out std_logic_vector(7 downto 0) :="00000000");
end decoder_7seg;

architecture Behavioral of decoder_7seg is

begin
process(DIN)
begin
	case DIN is 
		when "0000" => DOUT <= "00000011";
		when "0001" => DOUT <= "10011111";
		when "0010" => DOUT <= "00100101";
		when "0011" => DOUT <= "00001101";
		when "0100" => DOUT <= "10011001";
		when "0101" => DOUT <= "01001001";
		when "0110" => DOUT <= "01000001";
		when "0111" => DOUT <= "00011011";
		when "1000" => DOUT <= "00000001";
		when "1001" => DOUT <= "00001001";
		when others => null;
	end case;
end process;

end Behavioral;
		