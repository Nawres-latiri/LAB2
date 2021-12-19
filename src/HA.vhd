library ieee; 
use ieee.std_logic_1164.all; 

entity HA is 
       
	Port (A : in	std_logic;
		   B : in	std_logic;
		   S : out std_logic;
		   Cout : out std_logic);
end HA; 

architecture behavior of HA is

begin

  S <= A xor B ;
  Cout <= A and B ;
  
end behavior;