analyze -f vhdl -lib WORK ./common/fpnormalize_fpnormalize.vhd
analyze -f vhdl -lib WORK ./common/fpround_fpround.vhd
analyze -f vhdl -lib WORK ./common/packfp_packfp.vhd
analyze -f vhdl -lib WORK ./common/unpackfp_unpackfp.vhd
analyze -f vhdl -lib WORK ./src/fpmul_single_cycle.vhd
analyze -f vhdl -lib WORK ./src/fpmul_stage1_struct.vhd
analyze -f vhdl -lib WORK ./src/fpmul_stage2_struct.vhd
analyze -f vhdl -lib WORK ./src/fpmul_stage3_struct.vhd
analyze -f vhdl -lib WORK ./src/fpmul_stage4_struct.vhd
analyze -f vhdl -lib WORK ./src/FPmul_reg.vhd
analyze -f vhdl -lib WORK ./src/FPmul_with_reg_IN.vhd

set power_preserve_rtl_hier_names true
elaborate FPmul_with_reg_IN -arch pipeline -lib WORK > ./elaborate_pparch.txt
create_clock -name MY_CLK -period  1.7 clk
set_dont_touch_network MY_CLK
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
ungroup -all -flatten
set_implementation DW02_mult/pparch [find cell *mult*]
compile
report_resources > recources_pparch.txt
report_timing > timing_pparch.txt
report_area > area_pparch.txt

