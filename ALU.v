`timescale 1ns / 1ps
module AL_Unit(data_1, data_2, ALU_Control_signal, AL_Unit_out, Flag);
	input [31:0] data_1, data_2;
	input [2:0] ALU_Control_signal;
	output reg [31:0] AL_Unit_out;
	output reg Flag;
	
	always@(*) begin
		case(ALU_Control_signal)
			3'b000:begin
						AL_Unit_out <= data_1 + data_2;
					end
			3'b001:begin
						AL_Unit_out <= data_1 - data_2;
						if(AL_Unit_out == 32'h0000000)
							Flag <= 1'b1;
						else				//Check Equality of two registers
							Flag <= 1'b0;
					end
			3'b010:begin
						AL_Unit_out <= data_1 | data_2;
					end
			3'b011:begin
						AL_Unit_out <= data_1 ^ data_2;
					end
			3'b100:begin
						AL_Unit_out <= data_1 & data_2;
					end
			3'b101:begin
						AL_Unit_out <= (data_1 < data_2) ? 1 : 0;
					end
			3'b110:begin
						AL_Unit_out <= (data_2 != 32'h0000000) ? 1 : 0;
					end
		endcase
	end
endmodule