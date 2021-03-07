`timescale 1ns / 1ps
module J_Sign_Extender(data_in, data_out);
	input [19:0] data_in;
	output reg [31:0] data_out;
	always@(*) begin
		data_out <= {{11{data_in[19]}},{data_in[19:0],1'b0}};
	end
endmodule