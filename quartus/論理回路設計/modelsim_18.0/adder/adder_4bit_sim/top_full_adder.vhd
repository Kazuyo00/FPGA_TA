library IEEE;
use IEEE.std_logic_1164.all;


entity top_full_adder is
	port(INPUT		      : in std_logic_vector(2 downto 0);
	     HEX0,HEX1,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0));
end top_full_adder;

--------------------call module----------------------

architecture RTL of top_full_adder is
	
	component full_adder2
		port(A,B,CIN : in std_logic;
		     S,CO    : out std_logic);
	end component;
	
	component Bit_7segLED
		port(sin : in std_logic;					--sin (sum input)
		     seg : out std_logic_vector(6 downto 0));
	end component;
	
----------------------define signal--------------------------

signal s_sig, co_sig : std_logic;

-----------------------connection-----------------------

begin
		
	ADDER : full_adder2
		port map(A => INPUT(0), B=> INPUT(1), CIN => INPUT(2), S => S_sig, CO => CO_sig);
		
	LED5  : Bit_7segLED
		port map(INPUT(1),HEX5);
		
	LED4  : Bit_7segLED
		port map(INPUT(0),HEX4);
		
	LED3  : Bit_7segLED
		port map(INPUT(2),HEX3);
		
	LED1  : Bit_7segLED
		port map(CO_sig,HEX1);
		
	LED0  : Bit_7segLED
		port map(S_sig,HEX0);
	
end RTL;
	
	
	
	
	
	
	
	
	