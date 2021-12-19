//`timescale 1 ns

module FPmul_tb ();

	wire [31:0] FP_A;
	wire [31:0] FP_B;
	wire clk;
	wire [31:0] FP_Z;
	
	FPmul_pipelined DUT(
		.FP_A(FP_A),
		.FP_B(FP_B),
		.CLK(clk),
		.FP_Z(FP_Z)
		);

	FPmul_data_maker FPmul_data_maker_inst(
		.CLK(clk),
		.DATA(FP_A),
		.DATA_B(FP_B)
		);
	
	FPmul_data_sink FPmul_data_sink_inst(
		.CLK(clk),
		.DATA_Z(FP_Z)
		);
	
	FPmul_clk_gen FPmul_clk_gen_inst(
		.CLK(clk)
		);

endmodule
