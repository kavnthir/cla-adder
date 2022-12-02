module cla_adder_tb();
	reg[3:0] a, b;
	reg[4:0] counta, countb;
	reg c_in;
	wire [4:0] sum;	
	
	
	cla_adder U1(a, b, c_in, sum);


	initial begin
	c_in = 0;
		for(counta = 0; counta < 5'b10000; counta = counta + 1)begin
			a = counta[3:0];
			#50;
			for(countb = 0; countb < 5'b10000; countb = countb + 1)begin
			b = countb[3:0];
			#50;
			end
		end
	c_in = 1;
		for(counta = 0; counta < 5'b10000; counta = counta + 1)begin
			a = counta[3:0];
			#50;
			for(countb = 0; countb < 5'b10000; countb = countb + 1)begin
			b = countb[3:0];
			#50;
			end
		end
	
	end
endmodule

//2 4 bit numbers 
//1 6 bit output