library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity Bit_7segLED is
	port(sin : in std_logic;								--sin (sum input)
		  seg : out std_logic_vector(6 downto 0));
end Bit_7segLED;


architecture RTL of Bit_7segLED is

begin

	process (sin) begin
		case sin is
		
			when '0'		=> seg <= "1000000";				--0 DE0-CVの7segLEDは負論理、つまり0(点灯)、1(消灯)
			when '1'		=> seg <= "1111001";				--1
			when others => seg <= "1111001";				--例外処理(全消灯)
			
		end case;
	end process;
end RTL;			
			