`timescale 1ns / 1ps
module Control_Unit(OPcode, Flag, func3, sel_bit, reg_write_en, mux1_load_bit, mem_write_en, mem_read, sel_bit_PC, write_mux_sel);
	input [6:0] OPcode;
	input Flag;
	input [2:0] func3;
	output reg sel_bit, reg_write_en, mux1_load_bit, mem_write_en, mem_read, write_mux_sel;
	output reg [1:0] sel_bit_PC;
	/* Control Unit controls all signal of Datapath. */
	always@(*) begin
		case(OPcode)
			7'b0110011: begin
							sel_bit <= 1'b0;
							reg_write_en <= 1'b1;
							mux1_load_bit <= 1'b0;
							mem_write_en <= 1'b0;
							mem_read <= 1'b0;		// R-Type Control Signals
							sel_bit_PC <= 2'b00;
							write_mux_sel <= 1'b1;
						end
			7'b0010011: begin
							sel_bit <= 1'b1;
							reg_write_en <= 1'b1;
							mux1_load_bit <= 1'b0;
							mem_write_en <= 1'b0;	// I-Type Control Signals
							mem_read <= 1'b0;
							sel_bit_PC <= 2'b00;
							write_mux_sel <= 1'b1;
						end
			7'b0100011: begin
							sel_bit <= 1'b1;
							reg_write_en <= 1'b0;
							mux1_load_bit <= 1'b1;
							mem_write_en <= 1'b1;	// SW Control Signals
							mem_read <= 1'b0;
							sel_bit_PC <= 2'b00;
							write_mux_sel <= 1'b1;
						end
			7'b0000011: begin
							sel_bit <= 1'b1;
							reg_write_en <= 1'b1;
							mux1_load_bit <= 1'b1; // LW Control Signals
							mem_write_en <= 1'b0;
							mem_read <= 1'b1;
							sel_bit_PC <= 2'b00;
							write_mux_sel <= 1'b1;
						end
			7'b1101111: begin
							reg_write_en <= 1'b1;
							sel_bit_PC <= 2'b01;	// J-Type Control Signals
							write_mux_sel <= 1'b0;
							mem_read <= 1'b0;
						end
			7'b1100011: begin
							case(func3)		// B-Type Control Signals
								3'b000: begin
											if(Flag == 1) begin
												sel_bit_PC <= 2'b10;
												reg_write_en <= 1'b0;
												sel_bit <= 1'b0;
												mem_read <= 1'b0;
											end else begin
												sel_bit_PC <= 2'b00;
												reg_write_en <= 1'b0;
											end
										end
								3'b001: begin
											if(Flag == 0) begin
												sel_bit_PC <= 2'b10;
												reg_write_en <= 1'b0;
												sel_bit <= 1'b0;
												mem_read <= 1'b0;
											end else begin
												sel_bit_PC <= 2'b00;
												reg_write_en <= 1'b0;
											end
										end
							endcase
						end
		endcase
	end
endmodule