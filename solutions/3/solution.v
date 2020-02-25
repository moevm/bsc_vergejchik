module MINORITY(input wire a, b, c, output wire y);
assign y = a ? (b | c) : (b & c);
endmodule
