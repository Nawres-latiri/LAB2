vcom -f compile_new_pipe.f
vlog -work -work ../tb/FPmul_tb_pipe.v
vsim FPmul_tb
