`timescale 1ns / 1ps
module Register_File(clk, reg_read_addr_1, reg_read_addr_2, reg_write_dest, reg_write_data, write_data_en, reg_read_data_1, reg_read_data_2);
	input [4:0] reg_read_addr_1, reg_read_addr_2, reg_write_dest;
	input [31:0] reg_write_data;
	input clk, write_data_en;
	output reg [31:0] reg_read_data_1, reg_read_data_2;
	reg [31:0] reg_mem [31:0];
	integer i;
	
	initial begin
		for(i = 0; i <= 31; i = i + 1) begin
			reg_mem[i] <= 32'h0000000;
		end
		reg_mem[0] <= 32'h161;
		reg_mem[1] <= 32'h5;
		reg_mem[2] <= 32'h5;
		reg_mem[5] <= 32'h16;
	end
	
	always@(*) begin
		reg_read_data_1 <= reg_mem[reg_read_addr_1];
		reg_read_data_2 <= reg_mem[reg_read_addr_2];
	end

	always@(posedge clk) begin
		if(write_data_en) begin
			reg_mem[reg_write_dest] <= reg_write_data;
		end
	end
	
endmodule