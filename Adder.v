`timescale 1ns / 1ps
module Adder(data_one, data_two, out_data);
	input [31:0] data_one;
	input [31:0] data_two;
	output reg [31:0] out_data;
	
	always@(*) begin
		out_data <= data_one + data_two;
	end
endmodule