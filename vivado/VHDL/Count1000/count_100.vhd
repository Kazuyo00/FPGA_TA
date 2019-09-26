library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity count_100 is
	port (LCLK1 :in std_logic;
			RESET : in std_logic;
			cnt10_1 : out std_logic_vector(3 downto 0);
			cnt10_2 : out std_logic_vector(3 downto 0);
			cnt10_3 : out std_logic_vector(3 downto 0);
			cnt10_4 : out std_logic_vector(3 downto 0));
			
end count_100;

architecture Behaviorl of count_100 is
	signal cnt10_1_buf : std_logic_vector(3 downto 0);
	signal cnt10_2_buf : std_logic_vector(3 downto 0);
	signal cnt10_3_buf : std_logic_vector(3 downto 0);
	signal cnt10_4_buf : std_logic_vector(3 downto 0);
	
	signal kurai_10 : std_logic;
	signal kurai_100 : std_logic;
	signal kurai_1000 : std_logic;
	
begin


process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_1_buf <= "0000";
		elsif(cnt10_1_buf="1001")then
			cnt10_1_buf <= "0000";
			kurai_10 <= '1';
		else
			cnt10_1_buf <= cnt10_1_buf+'1';
			kurai_10 <= '0';
		end if;
	end if;
end process;


process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_2_buf <= "0000";
		elsif(kurai_10='1')then
			if(cnt10_2_buf="1001")then
				cnt10_2_buf <= "0000";
				kurai_100 <= '1';
			else
			cnt10_2_buf <= cnt10_2_buf+'1';
			kurai_100 <= '0';
			end if;
		end if;
	end if;
end process;



process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_3_buf <= "0000";
		elsif(kurai_100='1')then
			if(cnt10_3_buf="1001")then
				cnt10_3_buf <= "0000";
				kurai_1000 <= '1';
			else
			cnt10_3_buf <= cnt10_3_buf+'1';
			kurai_1000 <= '0';
			end if;
		end if;
	end if;
end process;



process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_4_buf <= "0000";
		elsif(kurai_1000='1')then
			if(cnt10_4_buf="1001")then
				cnt10_4_buf <= "0000";
			else
			cnt10_4_buf <= cnt10_4_buf+'1';
			end if;
		end if;
	end if;
end process;


cnt10_1 <= cnt10_1_buf;
cnt10_2 <= cnt10_2_buf;
cnt10_3 <= cnt10_3_buf;
cnt10_4 <= cnt10_4_buf;

end Behaviorl;