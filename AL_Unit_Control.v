`timescale 1ns / 1ps
module AL_Unit_Control(instruction, ALU_Control_signal);
	input [31:0] instruction;
	output reg [2:0] ALU_Control_signal;
	
	always@(*) begin
		case(instruction[6:0])
			7'b0110011: begin
							case(instruction[31:25])
								7'b0000000: begin
												case(instruction[14:12])
													3'b000: begin
																ALU_Control_signal <= 3'b000;
															end
													3'b110: begin
																ALU_Control_signal <= 3'b010;
															end
													3'b100: begin
																ALU_Control_signal <= 3'b011;
															end
													3'b111: begin
																ALU_Control_signal <= 3'b100;
															end
													3'b010: begin
																ALU_Control_signal <= 3'b101;
															end
													3'b011: begin
																ALU_Control_signal <= 3'b110;
															end
												endcase
											end
								7'b0100000: begin
												case(instruction[14:12])
													3'b000: begin
																ALU_Control_signal <= 3'b001;
															end
												endcase
											end
							endcase
						end
			7'b0010011: begin
							case(instruction[14:12])
								3'b000: begin
											ALU_Control_signal <= 3'b000;
										end
								3'b110: begin
											ALU_Control_signal <= 3'b010;
										end
								3'b111: begin
											ALU_Control_signal <= 3'b100;
										end
								3'b010: begin
											ALU_Control_signal <= 3'b101;
										end
								
							endcase
						end
			7'b0100011: begin
							case(instruction[14:12])
								3'b010: begin
											ALU_Control_signal <= 3'b000;
										end
							endcase
						end
			7'b0000011: begin
							case(instruction[14:12])
								3'b010: begin
											ALU_Control_signal <= 3'b000;
										end
							endcase
						end
			7'b1100011: begin
							case(instruction[14:12])
								3'b000: begin
											ALU_Control_signal <= 3'b001;
										end
								3'b001: begin
											ALU_Control_signal <= 3'b001;
										end
							endcase
						end
		endcase
	end
endmodule