module and_test;

	reg a, b, c;
	wire sum;

	localparam period = 10;

	AND and_inst(a, b, c, sum);
	
	`define assert(v1, v2, v3, signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $display("For input %0b %0b %0b the result should be %0b", v1, v2, v3, expected); \
            $finish; \
        end

	initial

		begin
			a = 0;
			b = 0;
			c = 0;
			#period;
			`assert(a, b, c, sum, 0)
	
			c = 1;
			#period;
			`assert(a, b, c, sum, 0)
			
			b = 1;
			c = 0;
			#period;
			`assert(a, b, c, sum, 0)

			c = 1;
			#period;
			`assert(a, b, c, sum, 0)

			a = 1;
			b = 0;
			c = 0;
			#period;
			`assert(a, b, c, sum, 0)
			
			c = 1;
			#period;
			`assert(a, b, c, sum, 0)
			
			b = 1;
			c = 0;
			#period;
			`assert(a, b, c, sum, 0)
			
			c = 1;
			#period;
			`assert(a, b, c, sum, 1)
			
			$display("SUCCESS");
		end


endmodule
