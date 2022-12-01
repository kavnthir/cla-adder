
module sqrt (radicand, root, clk, enable, reset, valid_bit);

	input [7:0] radicand;
	input clk, enable, reset;
	output [7:0] root;
	output valid_bit;
	
	reg [7:0] root;
	reg valid_bit;
	reg [7:0] value;
	reg [7:0] square;
	
	always @(clk or enable or reset)begin
	value = 0;
	square = 0;
	valid_bit = 1;
	if(reset)begin
	root = 0;
	end
	
	else if(enable)begin
	while(radicand != square)begin
	value = value + 1;
	square = value * value;
	
	if(square > radicand)begin
	valid_bit = 0;
	end
	
	end
	root = value;
	end
	
	else begin
	root[7:0] = 8'bx;
	end
	
	
	end
	

endmodule
