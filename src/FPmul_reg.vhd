library ieee;
use ieee.std_logic_1164.all; 

entity FPmul_reg is
	generic (N: integer := 32 );									
	port (CLK: in	std_logic;	
			D: in std_logic_vector(N-1 downto 0);
			Q: out std_logic_vector(N-1 downto 0));				
end entity FPmul_reg;

architecture behavior of FPmul_reg is

	signal store : std_logic_vector(31 downto 0);
	
begin

	REG: process(CLK)
	
	begin
	
		if CLK'event and CLK = '1' then 
		
				store <= D; 
				
	    end if;
		 
	end process;
	
	Q <= store;
	
end behavior;
