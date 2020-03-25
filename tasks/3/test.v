module test;

	integer i, result;
	logic [2:0] a;
	wire y;

	localparam period = 10;

	MINORITY minority_inst(a[0], a[1], a[2], y);

	`define assert(signal, expected) \
        if (signal !== expected) begin \
            $display("ASSERTION FAILED"); \
            $finish; \
        end

	initial
		begin
			for(i=0; i<=7; i=i+1)
				begin
					a = i;
					result = a[0] ? (a[1] | a[2]) : (a[1] & a[2]);
					#period;
					`assert(result, y)
				end
			$display("SUCCESS");
		end

endmodule
