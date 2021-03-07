module bin2bcd(bin, thousand, hundreds, tens, ones);
	input [31:0] bin;
	output reg [3:0] thousand;
	output reg [3:0] hundreds;
	output reg [3:0] tens;
	output reg [3:0] ones;
	reg [15:0] bcd;
	   
	integer i;
		
	always@(bin) begin
		bcd=0;		 	
		for (i=0;i<32;i=i+1) begin	
			if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;	
			if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
			if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
			if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
			bcd = {bcd[14:0],bin[31-i]};			
		end
		thousand = bcd[15:12];
		hundreds = bcd[11:8];
		tens = bcd[7:4];
		ones = bcd[3:0];
	end
endmodule