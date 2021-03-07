`timescale 1ns / 1ps
module mux_2x1(data1, data2, sel_bit, data_out);
	input [31:0] data1, data2;
	input sel_bit;
	output reg [31:0] data_out;
	
	always@(*) begin
		if(sel_bit)
			data_out <= data2;
		else
			data_out <= data1;
	end
endmodule