library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
--use ieee.numeric_std.all;

library std;
use std.textio.all;

entity FPmul_data_maker is
  port (
    CLK  : in  std_logic;
    DATA_A : out std_logic_vector(31 downto 0);
	DATA_B : out std_logic_vector(31 downto 0)); --needed to perform the test
end FPmul_data_maker;

architecture behavior of FPmul_data_maker is

	constant t: time := 0.5 ns;
	
begin  -- beh

  process (CLK)
    --file fp : text open read_mode is "../digital_arithmetic_part/fp_samples.hex";--was ok
    file fp : text open read_mode is "./fp_samples.hex";
    variable ptr : line;
    variable val : std_logic_vector(31 downto 0);
 
  begin  -- process

	if CLK'event and CLK = '1' then  -- rising clock edge
		
			if (not(endfile(fp))) then
				readline(fp, ptr);
				hread(ptr, val);--works while compiling but doesnt for synthesis
				--read(ptr,val);
			end if;
			
			DATA_A <= val after t; 	-- in our test we compute the square value
			DATA_B <= val after t; 	-- so same value both for DATA_A and DATA_B
			
	end if;
  end process;
  
end behavior;
