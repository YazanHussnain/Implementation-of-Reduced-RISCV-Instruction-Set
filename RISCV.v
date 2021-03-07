module RISCV(clk, reset, anode, cathode, sel, wr);
	input clk, reset, wr;
	input [1:0] sel;
	output [3:0] anode;
	output [6:0] cathode;
	wire [31:0] MP_to_BTB;
	wire [3:0] thousand, hundreds, tens, ones;
	reg [3:0] NUM;
	CPU MicroProcessor(.clk(clk), .reset(reset), .OUT_DATA(MP_to_BTB));
	
	bin2bcd Binary_to_BCD(.bin(MP_to_BTB), .thousand(thousand), .hundreds(hundreds), .tens(tens), .ones(ones));
	
	Seven_Segment_Display SSD(.clk(clk), .reset(reset), .num(NUM), .sel(sel), .wr(wr), .anode(anode), .cathode(cathode));
	
	always@(*) begin
		case(sel)
			2'b00:	begin
						NUM <= thousand;
					end
			2'b01:	begin
						NUM <= hundreds;
					end
			2'b10:	begin
						NUM <= tens;
					end
			2'b11:	begin
						NUM <= ones;
					end
		endcase
	end
endmodule