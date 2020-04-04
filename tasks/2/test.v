module test;

	integer i, result;
	logic [3:0] a;
	wire y;

	localparam period = 10;

	XOR xor_inst(a, y);

	`define assert(v, signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $display("For input %0b %0b %0b %0b the result should be %0b", v[3], v[2], v[1], v[0], expected);\
            $finish; \
        end

	initial
		begin
			for(i=0; i<=15; i=i+1)
				begin
					a = i;
					result = a[3] | a[2] | a[1] | a[0];
					#period;
					`assert(a, result, y)
				end
			$display("SUCCESS");
		end

endmodule
