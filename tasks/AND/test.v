module and_test;

	reg a, b, c;
	wire sum;

	localparam period = 10;

	AND and_inst(a, b, c, sum);


	initial
		begin
			a = 0;
			b = 0;
			c = 0;
			#period;
	
			c = 1;
			#period;
			
			b = 1;
			c = 0;
			#period;

			c = 1;
			#period;

			a = 1;
			b = 0;
			c = 0;
			#period;
			
			c = 1;
			#period;
			
			b = 1;
			c = 0;
			#period;
			
			c = 1;
			#period;
			
		end

	initial
		$monitor(a,, b,, c,, sum);
endmodule
