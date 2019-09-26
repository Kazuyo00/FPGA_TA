library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity count_100_1 is
	port (LCLK1 :in std_logic :='0';
			RESET : in std_logic :='0';
			cnt10_1,cnt10_2,cnt10_3,cnt10_4 : out std_logic_vector(3 downto 0) :="0000");
			
end count_100_1;

architecture Behaviorl of count_100_1 is
	signal cnt10_1_buf : std_logic_vector(3 downto 0) :="0000";
	signal cnt10_2_buf : std_logic_vector(3 downto 0) :="0000";
	signal cnt10_3_buf : std_logic_vector(3 downto 0) :="0000";
	signal cnt10_4_buf : std_logic_vector(3 downto 0) :="0000";
        
	
	
	signal kurai_10 : std_logic :='0';
	signal kurai_100 : std_logic :='0';
	signal kurai_1000 : std_logic :='0';
        
	
begin


process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_1_buf <= "0000";
		elsif(cnt10_1_buf="1001")then
			cnt10_1_buf <= "0000";
		else
			cnt10_1_buf <= cnt10_1_buf+'1';
		end if;
	end if;
end process;


process(cnt10_1_buf)
begin
	if(cnt10_1_buf="1001")then
		kurai_10 <= '1';
	else
		kurai_10 <= '0';
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
			else
			cnt10_2_buf <= cnt10_2_buf+'1';
			end if;
		end if;
	end if;
end process;


process(cnt10_2_buf)
begin
	if(cnt10_2_buf="1001")then
		kurai_100 <= '1';
	else
		kurai_100 <= '0';
	end if;
end process;


process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_3_buf <= "0000";
		elsif(kurai_10='1' and kurai_100='1')then
			if(cnt10_3_buf="1001")then
				cnt10_3_buf <= "0000";
			else
			cnt10_3_buf <= cnt10_3_buf+'1';
			end if;
		end if;
	end if;
end process;


process(cnt10_3_buf)
begin
	if(cnt10_3_buf="1001")then
		kurai_1000 <= '1';
	else
		kurai_1000 <= '0';
	end if;
end process;


process(LCLK1)
begin
	if(LCLK1' event and LCLK1='1')then
		if(RESET='0')then
			cnt10_4_buf <= "0000";
		elsif(kurai_10='1' and kurai_100='1' and kurai_1000='1')then
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