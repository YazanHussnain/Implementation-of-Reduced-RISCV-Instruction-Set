`timescale 1ns / 1ps
module Data_Memory(clk, access_mem_addr, write_mem_data, mem_write_en, read_mem_data, mem_read, OUT_DATA);
	input clk;
	input [31:0] access_mem_addr;
	input [31:0] write_mem_data;
	input mem_write_en;
	input mem_read;
	output [31:0] read_mem_data;
	output reg [31:0] OUT_DATA;
	/* Data is Stored and load from Data memory using instructions in instruction memory. */
	reg [7:0] memory [1023:0];
	integer i;
	initial	begin
		for(i = 0; i <= 1023; i = i + 1) begin
			memory[i] <= 32'h000000;
		end
		memory[3] <= 8'd9;
		memory[7] <= 8'd12;
	end
 
	always @(posedge clk) begin
		if (mem_write_en) begin	// Write data on poesdege clk
		   memory[access_mem_addr] <= write_mem_data[31:24];
		   memory[access_mem_addr+1] <= write_mem_data[23:16];
		   memory[access_mem_addr+2] <= write_mem_data[15:8];
		   memory[access_mem_addr+3] <= write_mem_data[7:0];
		end
	end
	assign read_mem_data = (mem_read == 1'b1) ? {memory[access_mem_addr],memory[access_mem_addr+1],memory[access_mem_addr+2],memory[access_mem_addr+3]}: 32'd0; 
			/* Asynchronus Data read */
	always@(*) OUT_DATA <= {memory[8], memory[9], memory[10], memory[11]};
endmodule
