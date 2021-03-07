`timescale 1ns / 1ps
module ALU_Adder(data_in, data_out);
	input [31:0] data_in;
	output reg [31:0] data_out;
	
	always@(*) begin
		data_out <= data_in + 4;
	end
endmodule