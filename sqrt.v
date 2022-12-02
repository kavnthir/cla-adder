
module sqrt (radicand, root, clk, enable, reset, valid_bit);

	input [7:0] radicand;
	input clk, enable, reset;
	output [7:0] root;
	output valid_bit;
	
	reg [7:0] root;
	reg valid_bit;
	integer value;
	reg [7:0] square;
	
	always @(clk or enable or reset)begin
	
	if(!reset)begin
	root = 0;
	valid_bit = 1;
	end
	
	else if(enable)begin
	for(value = 0; value <= 16; value = value + 1)begin
	square = value * value;
	
	if(square == radicand)begin
	root = value;
	value = 16;
	valid_bit = 1;
	end
	
	if(square > radicand)begin
	root = value;
	value = 16;
	valid_bit = 0;
	end
	end	
	end
	
	else begin
	root[7:0] = 8'bx;
	end
	
	
	end
	

endmodule
