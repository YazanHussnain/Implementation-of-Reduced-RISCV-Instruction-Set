module Program_Counter(clk, reset, PC_Next, PC_Out);
	input clk, reset;
	input [31:0] PC_Next;
	output reg [31:0] PC_Out;
	
	always@(posedge clk or posedge reset) begin
		if(reset) begin
			PC_Out <= 32'h0000000;
		end else begin
			PC_Out <= PC_Next;
		end
	end
endmodule