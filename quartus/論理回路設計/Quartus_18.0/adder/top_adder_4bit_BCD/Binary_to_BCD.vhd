library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;				--when convert integer , be required 
use ieee.std_logic_arith.all;					--same reason


entity Binary_to_BCD is port(							--BCD(Binary Coded Decimal) ex) 64 => 6_4 => 0110_0100
	 bin_in: in  std_logic_vector(4 downto 0);	--why 5bit? => adapt result(0 ~ 30)
	 bcd_d1: out std_logic_vector(3 downto 0);
	 bcd_d2: out std_logic_vector(3 downto 0));
end Binary_to_BCD;


architecture RTL of Binary_to_BCD is
   signal Num, D1, D2: integer range 0 to 31;

	
begin   

    Num   <= CONV_INTEGER ( bin_in );			--convert integer
    D1    <= Num - (Num/10)*10;					--1  no kurai
    D2    <= Num /10;								--10 no kurai
    bcd_d1<= CONV_std_logic_vector(D1,4);		--convert std_logic_vector 4bit 
    bcd_d2<= CONV_std_logic_vector(D2,4);

end RTL;
