`timescale 1ns / 1ps
module Sign_Extender(data_in, data_out);
	input [11:0] data_in;
	output reg [31:0] data_out;
	always@(*) begin
		data_out <= {{20{data_in[11]}},data_in[11:0]};
		/* I-type instruction Sign extender */
	end
endmodule