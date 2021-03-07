`timescale 1 ns/1 ps

module testbench_RISCV();
reg clk, reset, wr;
reg [1:0] sel;
wire [3:0] anode;
wire [6:0] cathode;
RISCV UUT(clk, reset, anode, cathode, sel, wr);
parameter T = 20;	// clk period
// Clock generator
initial	
begin
	clk = 0;
	forever	#(T/2)	clk=~clk;
end
// Test vector generator
initial
begin
reset_dut;
#1400  sel = 2'b00; wr = 1;
#100  sel = 2'b01; wr = 1;
#100  sel = 2'b10; wr = 1;
#100  sel = 2'b11; wr = 1;
#25000000  wr = 0;
#62500000 $stop;
end
task reset_dut;
begin
	reset <= 1;
	#(T/4); reset <= 0;
end
endtask
endmodule