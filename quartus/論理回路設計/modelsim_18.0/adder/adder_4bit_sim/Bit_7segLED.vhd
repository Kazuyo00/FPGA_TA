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
		
			when '0'		=> seg <= "1000000";				--0(7segLED) 0(ON) 1(OFF)
			when '1'		=> seg <= "1111001";				--1(7segLED)
			when others => seg <= "1111001";
			
		end case;
	end process;
end RTL;			
			