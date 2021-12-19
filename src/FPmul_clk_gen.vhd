library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity FPmul_clk_gen is
  port (CLK: out std_logic);
end FPmul_clk_gen;

architecture behavior of FPmul_clk_gen is

	constant Ts : time := 18 ns; -- see with design compiler the correct value (Fmax/4)
	signal CLK_s : std_logic;
  
begin 

	process
	
	begin 
	
		if (CLK_s = 'U') then
			CLK_s <= '0';
			
		else
			CLK_s <= not(CLK_s);
			
		end if;
		
		wait for Ts/2;
		
	end process;
	
	CLK <= CLK_s;

end behavior;