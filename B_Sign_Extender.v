`timescale 1ns / 1ps
module B_Sign_Extender(data_in, data_out);
	input [11:0] data_in;
	output reg [31:0] data_out;
	always@(*) begin
		data_out <= {{19{data_in[11]}},{data_in[11:0],1'b0}};
		/* Extend 13-bit of immediate value of B-type instruction. to 32-bit */
	end
endmodule