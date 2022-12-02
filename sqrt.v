
module sqrt (radicand, root, enable,valid_bit);

	input [7:0] radicand;
	input enable;
	output [7:0] root;
	output valid_bit;
	
	reg [7:0] root;
	reg valid_bit;
	reg [7:0] i;
	reg [7:0] square;
	
	
	always @(radicand)begin
	if(enable)begin
	
	for(i = 0; i <= 8'd16; i = i + 1)begin
	square = i * i;
	if(square == radicand)begin
	root = i;
	valid_bit = 1;
	end
	else if(square > radicand)begin
	root = i - 1;
	i = i + 16;
	valid_bit = 0;
	end
	end
	end
	
	else begin
	root = 0;
	end
	
	end

endmodule
