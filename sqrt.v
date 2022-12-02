
module sqrt (radicand, root, enable,valid_bit);

	input [7:0] radicand;
	
	input enable;
	output [7:0] root;
	output valid_bit;
	
	reg [7:0] root;
	reg valid_bit;
	reg [7:0] i;
	reg [7:0] square;
	
	
	always @(radicand or enable)begin
	if(enable)begin
	i = 0;
	
	repeat(17)begin
	square = i * i;
	
	if(square == radicand)begin
	root = i;
	valid_bit = 1;
	
	end
	

	i = i + 1;
	end
	
	end
	
	else begin
	root = 0;
	end
	
	end

endmodule
