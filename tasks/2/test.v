module test;

	integer i, result;
	logic [3:0] a;
	wire y;

	localparam period = 10;

	XOR xor_inst(a, y);

	`define assert(signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $finish; \
        end

	initial
		begin
			for(i=0; i<=15; i=i+1)
				begin
					a = i;
					result = a[3] | a[2] | a[1] | a[0];
					#period;
					`assert(result, y)
				end
			$display("SUCCESS");
		end

endmodule
