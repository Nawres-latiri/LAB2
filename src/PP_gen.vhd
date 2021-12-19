LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY PP_gen IS
   PORT(A : in std_logic_vector(31 DOWNTO 0);
		  B : in std_logic_vector(31 DOWNTO 0);
		  PP0 : out std_logic_vector(32 downto 0);
		  PP1 : out std_logic_vector(32 downto 0);
		  PP2 : out std_logic_vector(32 downto 0);
		  PP3 : out std_logic_vector(32 downto 0);
		  PP4 : out std_logic_vector(32 downto 0);
		  PP5 : out std_logic_vector(32 downto 0);
		  PP6 : out std_logic_vector(32 downto 0);
		  PP7 : out std_logic_vector(32 downto 0);
  		  PP8 : out std_logic_vector(32 downto 0);
		  PP9 : out std_logic_vector(32 downto 0);
		  PP10 : out std_logic_vector(32 downto 0);
		  PP11 : out std_logic_vector(32 downto 0);
		  PP12 : out std_logic_vector(32 downto 0);
		  PP13 : out std_logic_vector(32 downto 0);
		  PP14 : out std_logic_vector(32 downto 0);
		  PP15 : out std_logic_vector(32 downto 0);
		  PP16 : out std_logic_vector(31 downto 0));
END PP_gen;

architecture behavior of PP_gen is

signal shift : std_logic_vector(32 downto 0);
signal ext : std_logic_vector(32 downto 0);

		---- triplets ----
signal t0 : std_logic_vector(2 downto 0);
signal t1 : std_logic_vector(2 downto 0);
signal t2 : std_logic_vector(2 downto 0);
signal t3 : std_logic_vector(2 downto 0);
signal t4 : std_logic_vector(2 downto 0);
signal t5 : std_logic_vector(2 downto 0);
signal t6 : std_logic_vector(2 downto 0);
signal t7 : std_logic_vector(2 downto 0);
signal t8 : std_logic_vector(2 downto 0);
signal t9 : std_logic_vector(2 downto 0);
signal t10 : std_logic_vector(2 downto 0);
signal t11 : std_logic_vector(2 downto 0);
signal t12 : std_logic_vector(2 downto 0);
signal t13 : std_logic_vector(2 downto 0);
signal t14 : std_logic_vector(2 downto 0);
signal t15 : std_logic_vector(2 downto 0);
signal t16 : std_logic_vector(2 downto 0);

begin

 shift(32 downto 1) <= A(31 downto 0);
 shift(0) <= '0';

 ext <= '0' & A;
 
 t0 <= B(1) & B(0) & '0';
 t1 <= B(3) & B(2) & B(1);
 t2 <= B(5) & B(4) & B(3);
 t3 <= B(7) & B(6) & B(5);
 t4 <= B(9) & B(8) & B(7);
 t5 <= B(11) & B(10) & B(9);
 t6 <= B(13) & B(12) & B(11);
 t7 <= B(15) & B(14) & B(13);
 t8 <= B(17) & B(16) & B(15);
 t9 <= B(19) & B(18) & B(17);
 t10 <= B(21) & B(20) & B(19);
 t11 <= B(23) & B(22) & B(21);
 t12 <= B(25) & B(24) & B(23);
 t13 <= B(27) & B(26) & B(25);
 t14 <= B(29) & B(28) & B(27);
 t15 <= B(31) & B(30) & B(29);
 t16 <= '0' & '0' & B(31);
 
 PP0 <= (others =>'0') when t0(2 downto 0) = "000" else
		  ext when t0(2 downto 0) = "010" else
		  not shift when t0(2 downto 0) = "100" else
		  not ext when t0(2 downto 0) = "110";

 PP1 <= (others =>'0') when t1 = "000" else
		  ext when t1 = "001" else
		  shift when t1 = "011" else
		  not shift when t1 = "100" else
		  not ext when t1 = "110" else
		  (others =>'0') when t1 = "010" else
		  (others =>'0') when t1 = "101" else
		  (others =>'0') when t1 = "111";

 PP2 <= (others =>'0') when t2 = "000" else
		  ext when t2 = "001" else
		  shift when t2 = "011" else
		  not shift when t2 = "100" else
		  not(ext) when t2 = "110" else
		  (others =>'0') when t2 = "010" else
		  (others =>'0') when t2 = "101" else
		  (others =>'0') when t2 = "111";

 
 PP3 <= (others =>'0') when t3 = "000" else
		  ext when t3 = "001" else
		  shift when t3 = "011" else
		  not shift when t3 = "100" else
		  not ext when t3 = "110" else
		  (others =>'0') when t3 = "010" else
		  (others =>'0') when t3 = "101" else
		  (others =>'0') when t3 = "111";

		  
 PP4 <= (others =>'0') when t4 = "000" else
		  ext when t4 = "001" else
		  shift when t4 = "011" else
		  not shift when t4 = "100" else
		  not ext when t4 = "110" else
		  (others =>'0') when t4 = "010" else
		  (others =>'0') when t4 = "101" else
		  (others =>'0') when t4 = "111";

		  
 PP5 <= (others =>'0') when t5 = "000" else
		  ext when t5 = "001" else
		  shift when t5 = "011" else
		  not shift when t5 = "100" else
		  not ext when t5 = "110" else
		  (others =>'0') when t5 = "010" else
		  (others =>'0') when t5 = "101" else
		  (others =>'0') when t5 = "111";

 		  
 PP6 <= (others =>'0') when t6 = "000" else
		  ext when t6 = "001" else
		  shift when t6 = "011" else
		  not shift when t6 = "100" else
		  not ext when t6 = "110" else
		  (others =>'0') when t6 = "010" else
		  (others =>'0') when t6 = "101" else
		  (others =>'0') when t6 = "111";

 
  		  
 PP7 <= (others =>'0') when t7 = "000" else
		  ext when t7 = "001" else
		  shift when t7 = "011" else
		  not shift when t7 = "100" else
		  not ext when t7 = "110" else
		  (others =>'0') when t7 = "010" else
		  (others =>'0') when t7 = "101" else
		  (others =>'0') when t7 = "111";

		  
 PP8 <= (others =>'0') when t8 = "000" else
		  ext when t8 = "001" else
		  shift when t8 = "011" else
		  not shift when t8 = "100" else
		  not ext when t8 = "110" else
		  (others =>'0') when t8 = "010" else
		  (others =>'0') when t8 = "101" else
		  (others =>'0') when t8 = "111";

 
 PP9 <= (others =>'0') when t9 = "000" else
		  ext when t9 = "001" else
		  shift when t9 = "011" else
		  not shift when t9 = "100" else
		  not ext when t9 = "110" else
		  (others =>'0') when t9 = "010" else
		  (others =>'0') when t9 = "101" else
		  (others =>'0') when t9 = "111";

 
 PP10 <= (others =>'0') when t10 = "000" else
		  ext when t10 = "001" else
		  shift when t10 = "011" else
		  not shift when t10 = "100" else
		  not ext when t10 = "110" else
		  (others =>'0') when t10 = "010" else
		  (others =>'0') when t10 = "101" else
		  (others =>'0') when t10 = "111";

 
 PP11 <= (others =>'0') when t11 = "000" else
		  ext when t11 = "001" else
		  shift when t11 = "011" else
		  not shift when t11 = "100" else
		  not ext when t11 = "110" else
		  (others =>'0') when t11 = "010" else
		  (others =>'0') when t11 = "101" else
		  (others =>'0') when t11 = "111";

 
 PP12 <= (others =>'0') when t12 = "000" else
		  ext when t12 = "001" else
		  shift when t12 = "011" else
		  not shift when t12 = "100" else
		  not ext when t12 = "110" else
		  (others =>'0') when t12 = "010" else
		  (others =>'0') when t12 = "101" else
		  (others =>'0') when t12 = "111";

 
 PP13 <= (others =>'0') when t13 = "000" else
		  ext when t13 = "001" else
		  shift when t13 = "011" else
		  not shift when t13 = "100" else
		  not ext when t13 = "110" else
		  (others =>'0') when t13 = "010" else
		  (others =>'0') when t13 = "101" else
		  (others =>'0') when t13 = "111";

 
 PP14 <= (others =>'0') when t14 = "000" else
		  ext when t14 = "001" else
		  shift when t14 = "011" else
		  not shift when t14 = "100" else
		  not ext when t14 = "110" else
		  (others =>'0') when t14 = "010" else
		  (others =>'0') when t14 = "101" else
		  (others =>'0') when t14 = "111";

 
 PP15 <= (others =>'0') when t15 = "000" else
		  ext when t15 = "001" else
		  shift when t15 = "011" else
		  not shift when t15 = "100" else
		  not ext when t15 = "110" else
		  (others =>'0') when t15 = "010" else
		  (others =>'0') when t15 = "101" else
		  (others =>'0') when t15 = "111";

 
 PP16 <= (others =>'0') when t16(0) = '0' else
 		  A when t16(0) = '1';
 
 end architecture;
