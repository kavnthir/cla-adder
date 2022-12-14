
module toplevel(SW, HEX0, HEX1, HEX2, HEX3);

   input [8:0]  SW;
   output [6:0] HEX1, HEX0, HEX2, HEX3;
	
	wire [5:0] sum;
				
	cla_adder(SW[8:5], SW[4:1], SW[0], sum);
	
	seven_seg_driver ssd0(.din(SW[4:1]),
                         .HEX(HEX0));

   seven_seg_driver ssd1(.din(SW[8:5]),
                         .HEX(HEX1));
								 
	seven_seg_driver ssd2(.din(sum[3:0]),
                         .HEX(HEX2));
								
	seven_seg_driver ssd3(.din({4'b0,sum[4]}),
                         .HEX(HEX3));

endmodule