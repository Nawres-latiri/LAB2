library ieee; 
use ieee.std_logic_1164.all; 

entity FA is 
       
	Port (A : in	std_logic;
		   B : in	std_logic;
		   Cin : in	std_logic;
		   S : out	std_logic;
		   Cout : out	std_logic);
end FA; 

architecture behavior of FA is

begin

  S <= A xor B xor Cin ;
  Cout <= (A and B) or (B and Cin) or (Cin and A) ;
  
end behavior;