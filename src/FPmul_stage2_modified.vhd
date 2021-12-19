-- VHDL Entity HAVOC.FPmul_stage2.interface
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- 2003-2004. V1.0
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY FPmul_stage2_modified IS
   PORT( 
      A_EXP           : IN     std_logic_vector (7 DOWNTO 0);
      A_SIG           : IN     std_logic_vector (31 DOWNTO 0);
      B_EXP           : IN     std_logic_vector (7 DOWNTO 0);
      B_SIG           : IN     std_logic_vector (31 DOWNTO 0);
      SIGN_out_stage1 : IN     std_logic;
      clk             : IN     std_logic;
      isINF_stage1    : IN     std_logic;
      isNaN_stage1    : IN     std_logic;
      isZ_tab_stage1  : IN     std_logic;
      EXP_in          : OUT    std_logic_vector (7 DOWNTO 0);
      EXP_neg_stage2  : OUT    std_logic;
      EXP_pos_stage2  : OUT    std_logic;
      SIGN_out_stage2 : OUT    std_logic;
      SIG_in          : OUT    std_logic_vector (27 DOWNTO 0);
      isINF_stage2    : OUT    std_logic;
      isNaN_stage2    : OUT    std_logic;
      isZ_tab_stage2  : OUT    std_logic
   );

-- Declarations

END FPmul_stage2_modified ;

--
-- VHDL Architecture HAVOC.FPmul_stage2.struct
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- Copyright 2003-2004. V1.0
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF FPmul_stage2_modified IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL EXP_in_int  : std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_neg_int : std_logic;
   SIGNAL EXP_pos_int : std_logic;
   SIGNAL SIG_in_int  : std_logic_vector(27 DOWNTO 0);
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic_vector(7 DOWNTO 0);
   SIGNAL prod        : std_logic_vector(63 DOWNTO 0);

	------- added signals -------
	SIGNAL sig_prod : std_logic_vector(63 DOWNTO 0);
   SIGNAL sig_A_EXP : std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_B_EXP : std_logic_vector(7 DOWNTO 0);
   SIGNAL sig_SIGN_out_stage1 : std_logic;
   SIGNAL sig_isINF_stage1 : std_logic;
   SIGNAL sig_isNaN_stage1 : std_logic;
   SIGNAL sig_isZ_tab_stage1 : std_logic;
	-----------------------------
	
	--------- register ---------
	component FPmul_reg is
		generic (N: integer := 1 );
		port (D: in std_logic_vector(N-1 downto 0);
			   Q: out	std_logic_vector(N-1 downto 0);						
			   CLK: in std_logic);
			   
	end component FPmul_reg;
	
	component FPmul_regS is
		port (D: in std_logic;
			   Q: out	std_logic;						
			   CLK: in std_logic);
			   
	end component FPmul_regS;
	----------------------------
	
BEGIN

	-- add sufficient delays to carry each operations done in stage 1

	reg_prod	: FPmul_reg
		generic map(N => 64)
		port map(D => sig_prod, Q => prod, CLK => clk) ;
		
	reg_expA	: FPmul_reg
		generic map(N => 8)
		port map(D => A_exp, Q => sig_A_EXP, CLK => clk) ;

	reg_expB	: FPmul_reg
		generic map(N => 8)
		port map(D => B_exp, Q => sig_B_EXP, CLK => clk) ;

	reg1	: FPmul_regS
		port map(D => SIGN_out_stage1, Q => sig_SIGN_out_stage1, CLK => clk) ;

	reg2	: FPmul_regS
		port map(D => isINF_stage1, Q => sig_isINF_stage1, CLK => clk) ;
		
	reg3	: FPmul_regS
		port map(D => isNaN_stage1, Q => sig_isNaN_stage1, CLK => clk) ;
		
	reg4	: FPmul_regS
		port map(D => isZ_tab_stage1, Q => sig_isZ_tab_stage1, CLK => clk) ;
		
		

   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 sig
   -- eb1 1
   SIG_in_int <= prod(47 DOWNTO 20);

   -- HDL Embedded Text Block 2 inv
   -- eb5 5
   EXP_in_int <= (NOT dout1(7)) & dout1(6 DOWNTO 0);

   -- HDL Embedded Text Block 3 latch
   -- eb2 2
   
   PROCESS(clk)
   BEGIN
      IF RISING_EDGE(clk) THEN
         EXP_in <= EXP_in_int;
         SIG_in <= SIG_in_int;
         EXP_pos_stage2 <= EXP_pos_int;
         EXP_neg_stage2 <= EXP_neg_int;
      END IF;
   END PROCESS;

   -- HDL Embedded Text Block 4 latch2
   -- latch2 4
   PROCESS(clk)
   BEGIN
      IF RISING_EDGE(clk) THEN
         isINF_stage2 <= sig_isINF_stage1;
         isNaN_stage2 <= sig_isNaN_stage1;
         isZ_tab_stage2 <= sig_isZ_tab_stage1;
         SIGN_out_stage2 <= sig_SIGN_out_stage1;
      END IF;
   END PROCESS;

   -- HDL Embedded Text Block 5 eb1
   -- exp_pos 5
   EXP_pos_int <= sig_A_EXP(7) AND sig_B_EXP(7);
--   EXP_neg_int <= NOT(A_EXP(7) OR B_EXP(7));
   EXP_neg_int <= '1' WHEN ( (sig_A_EXP(7)='0' AND NOT (sig_A_EXP=X"7F")) AND (sig_B_EXP(7)='0' AND NOT (sig_B_EXP=X"7F")) ) ELSE '0';


   -- ModuleWare code(v1.1) for instance 'I4' of 'add'
   I4combo: PROCESS (sig_A_EXP, sig_B_EXP, dout)
   VARIABLE mw_I4t0 : std_logic_vector(8 DOWNTO 0);
   VARIABLE mw_I4t1 : std_logic_vector(8 DOWNTO 0);
   VARIABLE mw_I4sum : unsigned(8 DOWNTO 0);
   VARIABLE mw_I4carry : std_logic;
   BEGIN
      mw_I4t0 := '0' & sig_A_EXP;
      mw_I4t1 := '0' & sig_B_EXP;
      mw_I4carry := dout;
      mw_I4sum := unsigned(mw_I4t0) + unsigned(mw_I4t1) + mw_I4carry;
      dout1 <= conv_std_logic_vector(mw_I4sum(7 DOWNTO 0),8);
   END PROCESS I4combo;

   -- ModuleWare code(v1.1) for instance 'I2' of 'mult'
   I2combo : PROCESS (A_SIG, B_SIG)
   VARIABLE dtemp : unsigned(63 DOWNTO 0);
   BEGIN
      dtemp := (unsigned(A_SIG) * unsigned(B_SIG));
      sig_prod <= std_logic_vector(dtemp);
   END PROCESS I2combo;

   -- ModuleWare code(v1.1) for instance 'I6' of 'vdd'
   dout <= '1';

   -- Instance port mappings.

END struct;
