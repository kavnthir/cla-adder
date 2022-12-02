module sqrt_tb();
	reg enable;
	reg [7:0] radicand;
	reg [8:0] count;
	wire [7:0] root;
	wire valid;
	sqrt U1(radicand, root,enable, valid);
	
	
	
	
	initial begin
	enable = 0;
	#50;
	enable = 1;
	#50;
		for(count = 0; count < 9'b100000000; count = count + 1)begin
		radicand = count[7:0];
		#1000;
		enable = 0;
		#50;
		enable = 1;
		#50;
		end
	
	$stop;
	end

endmodule

