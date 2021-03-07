`timescale 1ns / 1ps
module Datapath(clk, reset, instruction, sel_bit, reg_write_en, mux1_load_bit, mem_write_en, mem_read, sel_bit_PC, write_mux_sel, OPcode, memory_address, Flag, func3, OUT_DATA1);
	input clk, reset, sel_bit, reg_write_en, mux1_load_bit, mem_write_en, mem_read, write_mux_sel;
	input [31:0] instruction;
	input [1:0] sel_bit_PC;
	output reg [6:0] OPcode;
	output reg [31:0] memory_address;
	output reg Flag;
	output reg [2:0] func3;
	output [31:0] OUT_DATA1;
	wire [31:0] reg_data_1, reg_data_2, SE_out, mux_out, reg_write_data, DM_extender, ALU_out, DM_out, JSE_out, ADD_out, PC_mux_out, write_mux_out, B_Adder_out, BSE_out;
	wire [31:0] memory_addr, PCPlus4;
	wire [2:0] ALU_Control;
	wire flag;
	reg [4:0] reg_addr_1, reg_addr_2, dest_reg;
	reg [11:0] IMM, B_IMM;
	reg [19:0] J_IMM;
	
	Program_Counter PC(.clk(clk), .reset(reset), .PC_Next(PC_mux_out), .PC_Out(memory_addr));
	
	ALU_Adder AA(.data_in(memory_addr), .data_out(PCPlus4));
	
	always@(*) begin
		OPcode <= instruction[6:0];
		memory_address <= memory_addr;
		func3 <= instruction[14:12];
		Flag <= flag;
		case(instruction[6:0])
		7'b0110011: begin
						reg_addr_2 <= instruction[24:20];
						dest_reg <= instruction[11:7];
						reg_addr_1 <= instruction[19:15];
					end 
		7'b0010011: begin
						IMM <= instruction[31:20];
						dest_reg <= instruction[11:7];
						reg_addr_1 <= instruction[19:15];
					end 
		7'b0100011: begin
						reg_addr_2 <= instruction[24:20];
						reg_addr_1 <= instruction[19:15];
						IMM <= {instruction[31:25], instruction[11:7]};
					end
		7'b0000011: begin
						IMM <= instruction[31:20];
						dest_reg <= instruction[11:7];
						reg_addr_1 <= instruction[19:15];
					end
		7'b1101111: begin
						dest_reg <= instruction[11:7];
						J_IMM <= instruction[31:12];
					end
		7'b1100011: begin
						reg_addr_2 <= instruction[24:20];
						reg_addr_1 <= instruction[19:15];
						B_IMM <= {instruction[31:25], instruction[11:7]};
					end
		endcase
	end

	J_Sign_Extender JSE(.data_in(J_IMM), .data_out(JSE_out));
	
	Adder ADD(.data_one(memory_addr), .data_two(JSE_out), .out_data(ADD_out));
	
	mux_3x1 mux2(.data1(PCPlus4), .data2(ADD_out), .data3(B_Adder_out), .sel_bit(sel_bit_PC), .data_out(PC_mux_out));
	
	mux_2x1 mux3(.data1(PCPlus4), .data2(reg_write_data), .sel_bit(write_mux_sel), .data_out(write_mux_out));
	
	Register_File RF(.clk(clk), .reg_read_addr_1(reg_addr_1), .reg_read_addr_2(reg_addr_2), .reg_write_dest(dest_reg), .reg_write_data(write_mux_out), .write_data_en(reg_write_en), .reg_read_data_1(reg_data_1), .reg_read_data_2(reg_data_2));
	
	Sign_Extender SE(.data_in(IMM), .data_out(SE_out));
	
	B_Sign_Extender BSE(.data_in(B_IMM), .data_out(BSE_out));
	
	B_Adder BA(.data_a(memory_addr), .data_b(BSE_out), .out_data(B_Adder_out));
	
	AL_Unit_Control ALUC(.instruction(instruction), .ALU_Control_signal(ALU_Control));
	
	mux_2x1 mux(.data1(reg_data_2), .data2(SE_out), .sel_bit(sel_bit), .data_out(mux_out));
	
	AL_Unit ALU(.data_1(reg_data_1), .data_2(mux_out), .ALU_Control_signal(ALU_Control), .AL_Unit_out(ALU_out), .Flag(flag));
	
	Data_Memory DM(.clk(clk), .access_mem_addr(ALU_out), .write_mem_data(reg_data_2), .mem_write_en(mem_write_en), .read_mem_data(DM_out), .mem_read(mem_read), .OUT_DATA(OUT_DATA1));

	mux_2x1 mux1(.data1(ALU_out), .data2(DM_out), .sel_bit(mux1_load_bit), .data_out(reg_write_data));
	
endmodule