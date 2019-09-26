library IEEE;                                                                                                                           
use IEEE.std_logic_1164.all;                                                                                                            
use IEEE.std_logic_arith.all;                                                                                                           
use IEEE.std_logic_unsigned.all;                                                                                                        
                                                                                                                                        
entity count_100_top is                                                                                                                 
	port (CLK : in std_logic;                                                                                                              
			RESET : in std_logic;                                                                                                                
			DOUT1 : out std_logic_vector(7 downto 0);                                                                                            
			DOUT2 : out std_logic_vector(7 downto 0);                                                                                            
			DOUT3 : out std_logic_vector(7 downto 0);
			DOUT4 : out std_logic_vector(7 downto 0));                                                          
end count_100_top;                                                                                                                      
                                                                                                                                        
architecture  Behaviorl of count_100_top is                                                                                             
                                                                                                                                        
                                                                                                                                        
component bunsyuu_22                                                                                                                    
	port (CLK : in std_logic;                                                                                                              
			LCLK1 : out std_logic);                                                                                                              
end component;                                                                                                                          
                                                                                                                                        
                                                                                                                                        
component count_100_1                                                                                                                   
	port (LCLK1 :in std_logic;                                                                                                             
			RESET : in std_logic;                                                                                                                
			cnt10_1 : out std_logic_vector(3 downto 0);                                                                                          
			cnt10_2 : out std_logic_vector(3 downto 0);                                                                                          
			cnt10_3 : out std_logic_vector(3 downto 0);
			cnt10_4 : out std_logic_vector(3 downto 0));                                                                                         
			                                                                                                                                     
end component;                                                                                                                          
                                                                                                                                        
                                                                                                                                        
component decoder_7seg                                                                                                                  
	port (DIN : in std_logic_vector(3 downto 0);                                                                                           
			DOUT : out std_logic_vector(7 downto 0));                                                                                            
end component;                                                                                                                          
                                                                                                                                        
signal LCLK1_TMP : std_logic;                                                                                                           
signal cnt10_1_temp : std_logic_vector(3 downto 0);                                                                                     
signal cnt10_2_temp : std_logic_vector(3 downto 0);                                                                                     
signal cnt10_3_temp : std_logic_vector(3 downto 0);                                                                                     
signal cnt10_4_temp : std_logic_vector(3 downto 0);

                                                                                     
                                                                                                                                        
                                                                                                                                        
begin
	C1:bunsyuu_22                             
		port map(CLK => CLK,LCLK1 => LCLK1_TMP);                                                                                          
                                                                                                                                   	                                                                                                                                      
	C2:count_100_1                                                                                                                          
		port map(LCLK1 => LCLK1_TMP,RESET => RESET,cnt10_1 => cnt10_1_temp,cnt10_2 => cnt10_2_temp,cnt10_3 => cnt10_3_temp,cnt10_4 => cnt10_4_temp);                  
		                                                                                                                                      
	C3:decoder_7seg                                                                                                                        
		port map(DIN => cnt10_1_temp,DOUT => DOUT1);                                                                                          
		                                                                                                                                      
	C4:decoder_7seg                                                                                                                        
		port map(DIN => cnt10_2_temp,DOUT => DOUT2);                                                                                          
		                                                                                                                                      
	C5:decoder_7seg                                                                                                                        
		port map(DIN => cnt10_3_temp,DOUT => DOUT3);    
		
	C6:decoder_7seg                                                                                                                        
                port map(DIN => cnt10_4_temp,DOUT => DOUT4);    
                
            	                                                                                      
		                                                                                                                                      
		                                                                                                                                      
                                                                                                                                        
end Behaviorl;		                                                                                                                        
		                                                                                                                                      
                                                                                                                                        
		                                                                                                                                      
		                                                                                                                                      
		                                                                                                                                      