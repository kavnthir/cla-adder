
module sqrt_toplevel(SW, KEY, HEX1, HEX0);

   input [7:0]  SW;
   input [1:0]  KEY;
   output [6:0] HEX1, HEX0;
	
	wire enable;
	wire valid;
	wire [7:0] root;

	
	seven_seg_driver ssd0(.din(root[3:0]),
                         .HEX(HEX0));

   seven_seg_driver ssd1(.din(root[7:4]),
                         .HEX(HEX1));

endmodule