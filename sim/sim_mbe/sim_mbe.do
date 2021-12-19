vcom -f compile_mbe.f
vlog -work -work ../tb/FPmul_tb_mbe.v
vsim FPmul_tb
