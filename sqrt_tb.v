module sqrt_tb();
	reg clk, enable, reset;
	reg [7:0] radicand;
	reg [8:0] count;
	wire [7:0] root;
	wire valid;
	sqrt U1(radicand, root, clk, enable, reset, valid);
	
	wire clock_out;
	clk #(20) M2 (enable, clock_out);
	always @(posedge clock_out or negedge clock_out)begin
	clk = clock_out;
	end
	
	initial begin
	reset = 0;
	enable = 0;
	#50;
	enable = 1;
	reset = 1;
	#50;
		for(count = 0; count < 9'b100000000; count = count + 1)begin
		radicand = count[7:0];
		#1000;
		end
	
	$stop;
	end

endmodule

module clk(enable, clk_out);
	parameter PERIOD = 50;		// The default period of the clock
	input enable;				// Allow clk_out to "run" when asserted
	output clk_out;				// Controlled clock out

	reg clk_out;					// Declare clk_out as a reg

	// Set initial value for clk_out on power-up
	initial clk_out = 0;

	// Produce controlled free-running clock
	always
	begin
		#(PERIOD/2) if (enable == 1) 
			clk_out = ~clk_out;
	end
endmodule