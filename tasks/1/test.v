module and_test;

	reg a, b, c;
	wire sum;

	localparam period = 10;

	AND and_inst(a, b, c, sum);
	
	`define assert(signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $finish; \
        end

	initial

		begin
			a = 0;
			b = 0;
			c = 0;
			#period;
			`assert(sum, 0)
	
			c = 1;
			#period;
			`assert(sum, 0)
			
			b = 1;
			c = 0;
			#period;
			`assert(sum, 0)

			c = 1;
			#period;
			`assert(sum, 0)

			a = 1;
			b = 0;
			c = 0;
			#period;
			`assert(sum, 0)
			
			c = 1;
			#period;
			`assert(sum, 0)
			
			b = 1;
			c = 0;
			#period;
			`assert(sum, 0)
			
			c = 1;
			#period;
			`assert(sum, 1)
			
		end
		
	initial
		$monitor(a,, b,, c,, sum);

endmodule
