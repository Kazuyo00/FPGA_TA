library IEEE;
use IEEE.std_logic_1164.all;


entity top_adder_4bit is
  port(CLK, A, A_reset, B, B_reset        : in  std_logic;
       LED0, LED1, LED2, LED3, LED4, LED5 : out std_logic_vector(6 downto 0));
end top_adder_4bit;

-----------------------------call module-------------------------------

architecture RTL of top_adder_4bit is
  component adder2_4bit
    port( A, A_reset, B, B_reset             : in  std_logic;
          HEX0, HEX1, HEX2, HEX3, HEX4, HEX5 : out std_logic_vector(6 downto 0));
  end component;
  
  component chattering
    port(CLK, SW_in: in  std_logic;
         SW_out:     out std_logic );
  end component;
  
-----------------------------define signal-------------------------------

  signal a_chat, a_rst_chat, b_chat, b_rst_chat: std_logic;

---------------------------connection module-------------------------
  
begin

  CHAT_A:  chattering port map( CLK, A, a_chat);
  CHAT_AR: chattering port map( CLK, A_reset, a_rst_chat);
  CHAT_B:  chattering port map( CLK, B, B_chat);
  CHAT_BR: chattering port map( CLK, B_reset, b_rst_chat);
  
  ADDER4:  adder2_4bit port map
  (A => a_chat, A_reset => a_rst_chat,
   B => b_chat, B_reset => b_rst_chat,
	HEX0 => LED0, HEX1 => LED1, HEX2 => LED2, HEX3 => LED3, HEX4 => LED4, HEX5 => LED5);
		  
end RTL;
