library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity BS_to_7segLED is					--Base to 7segLED
port (BS_in: in  std_logic_vector(4 downto 0);
      seg :  out std_logic_vector(6 downto 0));
end BS_to_7segLED;


architecture RTL of BS_to_7segLED is
  
  signal temp: std_logic_vector(7 downto 0) := X"FF";		--hexadecimal * 2 => 8bit

begin
  
  seg  <=  temp(6 downto 0);

----------------------display name--------------------------

  process(BS_in)  begin  case BS_in is
    when "00000" =>  temp  <= X"4F";  -- 0: I
    when "00001" =>  temp  <= X"77";  -- 1: _
    when "00010" =>  temp  <= X"08";  -- 2: A
    when "00011" =>  temp  <= X"2A";  -- 3: M
    when "00100" =>  temp  <= X"77";  -- 4: _
    when "00101" =>  temp  <= X"4F";  -- 5: I
    when "00110" =>  temp  <= X"46";  -- 6: C
    when "00111" =>  temp  <= X"09";  -- 7: H
    when "01000" =>  temp  <= X"4F";  -- 8: I
    when "01001" =>  temp  <= X"2F";  -- 9: R
    when "01010" =>  temp  <= X"23";  --10: O
    when "01011" =>  temp  <= X"77";  --11: _
    when "01100" =>  temp  <= X"12";  --12: S
    when "01101" =>  temp  <= X"41";  --13: U
    when "01110" =>  temp  <= X"36";  --14: Z
    when "01111" =>  temp  <= X"41";  --15: U
    when "10000" =>  temp  <= X"0A";  --16: K
    when "10001" =>  temp  <= X"4F";  --17: I
    when "10010" =>  temp  <= X"77";  --18: _
    when "10011" =>  temp  <= X"79";  --19: 1
    when "10100" =>  temp  <= X"10";  --20: 9
    when "10101" =>  temp  <= X"58";  --21: 7
    when "10110" =>  temp  <= X"30";  --22: 3
    when "10111" =>  temp  <= X"79";  --23: 1
    when "11000" =>  temp  <= X"40";  --24: 0
    when "11001" =>  temp  <= X"24";  --25: 2
    when "11010" =>  temp  <= X"24";  --26: 2
    when others  =>  temp  <= X"FF";  --(blank) "1111111" => 7F
  end case;
end process;

end RTL;

