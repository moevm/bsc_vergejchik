module test;

	integer i;
	logic [3:0] a;
	wire y;

	localparam period = 10;

	XOR xor_inst(a, y);

	initial
		begin
			for(i=0; i<=15; i=i+1)
				begin
					a = i;
					#period;
				end
		end

	initial
		$monitor(a[0],, a[1],, a[2],, a[3],, y);
endmodule
