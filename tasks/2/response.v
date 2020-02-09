module XOR(input wire [3:0] a, output wire y);
assign y = a[3] | a[2] | a[1] | a[0];
endmodule
