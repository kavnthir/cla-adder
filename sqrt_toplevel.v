
module sqrt_toplevel(CLOCK_40, SW, KEY, HEX0, HEX1, HEX2, HEX3);

   input        CLOCK_40;
   input [10:0]  SW;
   input [1:0]  KEY;
   output [6:0] HEX1, HEX0, HEX2, HEX3;
	
	
	wire enable;
	wire valid;
	wire carryIn;
	wire [7:0] root;
	wire [7:0] display_value;
	wire [5:0] out;
	wire [0:3] a, b;
	
	
	
	a = SW[8:5];
	b = SW[4:1];
	carryIn = SW[0];
	

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
	
	seven_seg_driver ssd0(.din(a),
                         .HEX(HEX0));

   seven_seg_driver ssd1(.din(b),
                         .HEX(HEX1));
								 
	seven_seg_driver ssd1(.din(out[3:0]),
                         .HEX(HEX2));
								
	seven_seg_driver ssd1(.din(out[5:4]),
                         .HEX(HEX3));

endmodule