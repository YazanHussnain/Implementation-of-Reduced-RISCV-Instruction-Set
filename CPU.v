`timescale 1ns / 1ps
module CPU(clk, reset, OUT_DATA);
	input clk, reset;
	output reg [31:0] OUT_DATA;
	wire sel_bit, reg_write_en, Load_mux1, mem_write_en, mem_read, write_mux_sel, Flag;
	wire [6:0] OPcode;
	wire [1:0] PC_sel_bit;
	wire [2:0] func3;
	wire [31:0] instruction, memory_addr, OUTPUT;
	Datapath DP(.clk(clk), .reset(reset), .instruction(instruction), .sel_bit(sel_bit), .reg_write_en(reg_write_en), .mux1_load_bit(Load_mux1), .mem_write_en(mem_write_en), .mem_read(mem_read), .sel_bit_PC(PC_sel_bit), .write_mux_sel(write_mux_sel), .OPcode(OPcode), .memory_address(memory_addr), .Flag(Flag), .func3(func3), .OUT_DATA1(OUTPUT));
	
	Instruction_Memory IM(.read_addr(memory_addr), .instruction(instruction));
	
	Control_Unit CU(.OPcode(OPcode), .Flag(Flag), .func3(func3), .sel_bit(sel_bit), .reg_write_en(reg_write_en), .mux1_load_bit(Load_mux1), .mem_write_en(mem_write_en), .mem_read(mem_read), .sel_bit_PC(PC_sel_bit), .write_mux_sel(write_mux_sel));
	
	always@(*) OUT_DATA <= OUTPUT;
endmodule