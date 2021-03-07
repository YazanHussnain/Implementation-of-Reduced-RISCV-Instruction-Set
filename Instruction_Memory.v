`timescale 1ns / 1ps
module Instruction_Memory(read_addr, instruction);
	input [31:0] read_addr;
	output reg [31:0] instruction;
	reg [7:0] memory[1023:0];

	initial begin
		memory[32'h0] <= 8'b00000000;  
		memory[32'h1] <= 8'b00000010;
		memory[32'h2] <= 8'b00000100;//addi x9, x4 0
		memory[32'h3] <= 8'b10010011;
		
		memory[32'h4] <= 8'b00000000;
		memory[32'h5] <= 8'b00010010;//addi x10, x4, 1
		memory[32'h6] <= 8'b00000101;
		memory[32'h7] <= 8'b00010011;
		
		memory[32'h8] <= 8'b00000000;
		memory[32'h9] <= 8'b00000010;//LW x11, x4, 0
		memory[32'ha] <= 8'b00100101;
		memory[32'hb] <= 8'b10000011;
		
		memory[32'hc] <= 8'b00000000;
		memory[32'hd] <= 8'b01000010;//LW x12 x4 , 4
		memory[32'he] <= 8'b00100110;
		memory[32'hf] <= 8'b00000011;
		
		memory[32'h10] <= 8'b00000000;
		memory[32'h11] <= 8'b10100100;//beq x9, x10, +26
		memory[32'h12] <= 8'b10001101;
		memory[32'h13] <= 8'b01100011;
		
		memory[32'h14] <= 8'b00000000;
		memory[32'h15] <= 8'b11000101;//slt x13, x11, x12
		memory[32'h16] <= 8'b10100110;
		memory[32'h17] <= 8'b10110011;
		
		memory[32'h18] <= 8'b00000000;
		memory[32'h19] <= 8'b10100110;
		memory[32'h1a] <= 8'b10010101;//bne x13, x10, +10
		memory[32'h1b] <= 8'b01100011;
		
		memory[32'h1c] <= 8'b00000000;
		memory[32'h1d] <= 8'b00000101;
		memory[32'h1e] <= 8'b10000111;//addi x14 , x11, 0
		memory[32'h1f] <= 8'b00010011;
		
		memory[32'h20] <= 8'b00000000;
		memory[32'h21] <= 8'b00000110;
		memory[32'h22] <= 8'b00000101;//addi x11, x12, 0
		memory[32'h23] <= 8'b10010011;
		
		memory[32'h24] <= 8'b00000000;
		memory[32'h25] <= 8'b00000111;
		memory[32'h26] <= 8'b00000110;//addi x12, x14, 0
		memory[32'h27] <= 8'b00010011;
		
		memory[32'h28] <= 8'b11111111;
		memory[32'h29] <= 8'b11111111;
		memory[32'h2a] <= 8'b01000111;// jal x15, -12
		memory[32'h2b] <= 8'b11101111;
		
		memory[32'h2c] <= 8'b00000000;
		memory[32'h2d] <= 8'b01000110;
		memory[32'h2e] <= 8'b00000011;// beq x12, x4, +6
		memory[32'h2f] <= 8'b01100011;
		
		memory[32'h30] <= 8'b01000000;
		memory[32'h31] <= 8'b11000101;//sub x11, x11, x12
		memory[32'h32] <= 8'b10000101;
		memory[32'h33] <= 8'b10110011;
		
		memory[32'h34] <= 8'b11111111;//jal x16, -18
		memory[32'h35] <= 8'b11111110;
		memory[32'h36] <= 8'b11101000;
		memory[32'h37] <= 8'b01101111;
		
		memory[32'h38] <= 8'b00000000;
		memory[32'h39] <= 8'b00010010;//addi x9, x4, 1
		memory[32'h3a] <= 8'b00000100;
		memory[32'h3b] <= 8'b10010011;
		
		memory[32'h3c] <= 8'b00000000;
		memory[32'h3d] <= 8'b00000101;
		memory[32'h3e] <= 8'b10001000;//addi x17, x11, 0
		memory[32'h3f] <= 8'b10010011;
		
		memory[32'h40] <= 8'b11111111;
		memory[32'h41] <= 8'b11111110;
		memory[32'h42] <= 8'b10001001;//jal x18, -18
		memory[32'h43] <= 8'b01101111;
		
		memory[32'h44] <= 8'b00000000;
		memory[32'h45] <= 8'b00000101;
		memory[32'h46] <= 8'b10001000;//addi x17, x11, 0
		memory[32'h47] <= 8'b10010011;
		
		memory[32'h48] <= 8'b00000001;
		memory[32'h49] <= 8'b00010010;
		memory[32'h4a] <= 8'b00100100;//SW x18, x4, 8
		memory[32'h4b] <= 8'b00100011;
	end
	always @(read_addr)begin
		instruction = {memory[read_addr],memory[read_addr + 1],memory[read_addr + 2],memory[read_addr + 3]};
	end
endmodule