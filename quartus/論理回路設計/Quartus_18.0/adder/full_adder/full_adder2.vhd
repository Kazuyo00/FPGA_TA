library IEEE;
use IEEE.std_logic_1164.all;


entity full_adder2 is
	port(A,B,CIN : in std_logic;
		  S,CO    : out std_logic);
end full_adder2;


architecture RTL of full_adder2 is
	
	signal INPUT : std_logic_vector(2 downto 0);
	
begin

	INPUT <= CIN & B & A;
	
	process (INPUT) begin		--process (センシティビティ・リスト）　()内の信号に変化があったら実行
		case INPUT is
		
			when "000" => CO <= '0'; S <= '0';
			when "001" => CO <= '0'; S <= '1';
			when "010" => CO <= '0'; S <= '1';
			when "011" => CO <= '1'; S <= '0';
			when "100" => CO <= '0'; S <= '1';
			when "101" => CO <= '1'; S <= '0';
			when "110" => CO <= '1'; S <= '0';
			when "111" => CO <= '1'; S <= '1';
			
			when others => CO <='X'; S <= 'X';			--when others (例外処理) 'X' (不定値)

		end case;
	end process;
end RTL;
			
		
	
