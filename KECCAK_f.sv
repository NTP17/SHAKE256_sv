module KECCAK_f (
	input  [1599:0] S_in,
	output [1599:0] S_out
);

	logic [63:0] A_in      [0:4][0:4];
	logic [63:0] A_in_mid  [0:4][0:4];
	logic [63:0] A_out_mid [0:4][0:4];
	logic [63:0] A_out     [0:4][0:4];

	S_to_A string_to_array (.S(S_in), .A(A_in));



	A_to_S array_to_string (.A(A_out), .S(S_out));

endmodule