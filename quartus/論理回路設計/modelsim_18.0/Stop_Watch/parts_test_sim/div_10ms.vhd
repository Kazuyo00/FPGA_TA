library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity div_10ms is
 port(CLK     : in std_logic;
      div_clk : out std_logic);
end div_10ms ;


architecture RTL of div_10ms is
  signal clk_sig: std_logic := '0';
  signal   count: integer :=0;
  constant CYCLE: integer :=25;		--50MHz => devide => 1MHz

begin
  process(CLK) begin

    if rising_edge (CLK) then		--positive edge
      if (count = CYCLE) then
        clk_sig <= NOT(clk_sig);
        count <= 1;
      else
        count <= count + 1;
      end if; 
    end if;

  end process;
  div_clk <= clk_sig;
end RTL;
