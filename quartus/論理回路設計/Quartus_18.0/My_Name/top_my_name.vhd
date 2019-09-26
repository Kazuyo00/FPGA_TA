top_my_name

library IEEE;
use IEEE.std_logic_1164.all;


entity top_my_name is 
  port(CLK, RESET, STOP              : in std_logic;
       HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out std_logic_vector (6 downto 0));
end top_my_name ;


architecture RTL of top_my_name is
  
---------------------------call module----------------------------------  
  
  component my_name 
    port(CLK, RESET, STOP              : in std_logic;
         HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out std_logic_vector (6 downto 0));
  end component;
  
  component chattering
    port(CLK, SW_in : in  std_logic;
         SW_out     : out std_logic );
  end component;
  
---------------------------define signal------------------------------
  
  signal reset_chat, stop_chat: std_logic;

---------------------------connection module-------------------------  

begin

  CHAT_R:  chattering port map( CLK, RESET, reset_chat );
  CHAT_S:  chattering port map( CLK, STOP,  stop_chat );
  MYNAME:  my_name port map
                   ( CLK,reset_chat,stop_chat,HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 );

end RTL;
