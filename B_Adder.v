`timescale 1ns / 1ps
module B_Adder(data_a, data_b, out_data);
	input [31:0] data_a, data_b;
	output reg [31:0] out_data;
	always@(*) begin
		out_data <= data_a + data_b;
	end
endmodule