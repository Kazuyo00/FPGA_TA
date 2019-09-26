library IEEE;
use IEEE.std_logic_1164.all;


entity top_full_adder is
	port(CLK,A_in,B_in,C_in		   : in std_logic;
		  HEX0,HEX1,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0));
end top_full_adder;

--------------------モジュール呼び出し----------------------

architecture RTL of top_full_adder is
	
	component full_adder2
		port(A,B,CIN : in std_logic;
		     S,CO    : out std_logic);
	end component;
	
	component chattering
		port(clk, SW_in : in std_logic;
           SW_out     : out std_logic );
	end component;
	
	component Bit_7segLED
		port(sin : in std_logic;								--sin (sum input)
		     seg : out std_logic_vector(6 downto 0));
	end component;
	
----------------------信号線定義---------------------------

signal a_chat, b_chat, c_chat, s_sig, co_sig : std_logic;

-----------------------モジュール繋ぎ合わせ------------------------

---------------データの流れ : 入力信号(A,B,C)=>チャタリング防止回路=>全加算器(full_adder)=>7segデコーダ-------------------

begin

	CHATB : chattering
		port map(CLK,B_IN,b_chat);				--port map(clk => CLK, SW_in => A_in, SW_out => a_chat);　の省略版
	
	CHATA : chattering
		port map(CLK,A_IN,a_chat);				
	
	CHATC : chattering
		port map(CLK,C_IN,c_chat);
		

	ADDER : full_adder2
		port map(A => a_chat, B=> b_chat, CIN => c_chat, S => S_sig, CO => CO_sig);
		
		
	LED5  : Bit_7segLED
		port map(b_chat,HEX5);
		
	LED4  : Bit_7segLED
		port map(a_chat,HEX4);
		
	LED3  : Bit_7segLED
		port map(c_chat,HEX3);
		
	LED1  : Bit_7segLED
		port map(CO_sig,HEX1);
		
	LED0  : Bit_7segLED
		port map(S_sig,HEX0);
		
end RTL;
	
	
	
	
	
	
	
	
	