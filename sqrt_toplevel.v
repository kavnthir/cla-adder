
module sqrt_toplevel(SW, LED);

	input [7:0] SW;
	output [7:0] LED;
	
	sqrt U1 (SW, LED);
	

endmodule