
module sqrt_toplevel(CLOCK_40, SW, KEY, HEX1, HEX0);

   input        CLOCK_40;
   input [7:0]  SW;
   input [1:0]  KEY;
   output [6:0] HEX1, HEX0;
	
	wire enable;
	wire valid;
	wire [7:0] root;
	wire [7:0] display_value;

	keypressed U1 (.clock(CLOCK_40),			
						.reset(KEY[1]),				
						.enable_in(KEY[0]),			
						.enable_out(enable));	
	
	sqrt U2 (.radicand(SW),
				.clk(CLOCK_40),
				.enable(enable),
				.reset(KEY[1]),
				.root(root),
				.valid_bit(valid));
	
	reg [7:0] valid_mux;
	
	always @ (posedge CLOCK_40) begin
		if (!valid) begin
			valid_mux = 0;
		end else begin
			valid_mux = root;
		end
	end
	
	assign display_value = valid_mux;
	
	seven_seg_driver ssd0(.din(display_value[3:0]),
                         .HEX(HEX0));

   seven_seg_driver ssd1(.din(display_value[7:4]),
                         .HEX(HEX1));

endmodule