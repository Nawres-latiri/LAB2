library ieee;
use ieee.std_logic_1164.all; 

entity FPmul_regS is									
	port (CLK: in	std_logic;	
			D: in std_logic;
			Q: out std_logic);				
end entity FPmul_regS;

architecture behavior of FPmul_regS is

	signal store : std_logic;
	
begin

	REG: process(CLK)
	
	begin
	
		if CLK'event and CLK = '1' then 
		
				store <= D; 
				
	    end if;
		 
	end process;
	
	Q <= store;
	
end behavior;