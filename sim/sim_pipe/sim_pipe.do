vcom -f compile_pipe.f
vlog -work -work ../tb/FPmul_tb_pipe.v
vsim FPmul_tb
