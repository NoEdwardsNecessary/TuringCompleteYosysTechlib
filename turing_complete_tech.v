module BUF(A, Y);
input A;
output Y = A;
endmodule

module NOT(A, Y);
input A;
output Y = ~A;
endmodule

module NAND(A, B, Y);
input A, B;
output Y = ~(A & B);
endmodule

module AND(A, B, Y);
input A, B;
output Y = A & B;
endmodule

module AND3(A, B, C, Y);
input A, B, C;
output Y = A & B & C;
endmodule

module NOR(A, B, Y);
input A, B;
output Y = ~(A | B);
endmodule

module OR(A, B, Y);
input A, B;
output Y = A | B;
endmodule

module OR3(A, B, C, Y);
input A, B, C;
output Y = A | B | C;
endmodule

module XOR(A, B, Y);
input A, B;
output Y = A ^ B;
endmodule

module XNOR(A, B, Y);
input A, B;
output Y = ~(A ^ B);
endmodule

module FA(A, B, CI, CO, Y);
input A, B, CI;
output CO = (A & B)|(B & CI)|(CI & A);
output Y = A^B^CI;
endmodule

module DFF(C, D, Q);
input C, E, D;
output reg Q;
always @(posedge C)
	Q <= D;
endmodule

module DFFE(C, E, D, Q);
input C, E, D;
output reg Q;
always @(posedge C)
	Q <= E? D : Q;
endmodule
