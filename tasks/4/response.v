module FLOP(input logic clk,
			input logic d,
			output logic q);

	always @ (posedge clk)
		q <= d;

endmodule