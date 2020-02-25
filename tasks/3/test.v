module test;

	integer i;
	logic [2:0] a;
	wire y;

	localparam period = 10;

	MINORITY minority_inst(a[0], a[1], a[2], y);

	initial
		begin
			for(i=0; i<=7; i=i+1)
				begin
					a = i;
					#period;
				end
		end

	initial
		$monitor(a[0],, a[1],, a[2],, y);
endmodule
