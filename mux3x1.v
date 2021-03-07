`timescale 1ns / 1ps
module mux_3x1(data1, data2, data3, sel_bit, data_out);
	input [31:0] data1, data2, data3;
	input [1:0] sel_bit;
	output reg [31:0] data_out;
	
	always@(*) begin
		if(sel_bit == 2'b01)
			data_out <= data2;
		else if (sel_bit == 2'b00)
			data_out <= data1;
		else if (sel_bit == 2'b10)
			data_out <= data3;
	end
endmodule