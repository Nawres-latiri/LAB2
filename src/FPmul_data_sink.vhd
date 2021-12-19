library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity FPmul_data_sink is
  port (CLK: in std_logic;
		DATA_Z: in std_logic_vector(31 downto 0));
end FPmul_data_sink;

architecture behavior of FPmul_data_sink is

begin

	process (CLK)
	
		--file results_file : text open WRITE_MODE is "../digital_arithmetic_part/fp_results.txt";
        file results_file : text open WRITE_MODE is "./fp_results.txt";
		variable line_out : line;    
		
	begin  
			
		if CLK'event and CLK = '1' then
				hwrite(line_out, DATA_Z);
				writeline(results_file, line_out);
		end if;
	end process;
	
end behavior;
