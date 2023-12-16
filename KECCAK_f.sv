module KECCAK_f (
	input  [1599:0] S_in,
	output [1599:0] S_out
);

	logic [63:0] A_in  [0:4][0:4];
	logic [63:0] A0    [0:4][0:4];
	logic [63:0] A1    [0:4][0:4];
	logic [63:0] A2    [0:4][0:4];
	logic [63:0] A3    [0:4][0:4];
	logic [63:0] A4    [0:4][0:4];
	logic [63:0] A5    [0:4][0:4];
	logic [63:0] A6    [0:4][0:4];
	logic [63:0] A7    [0:4][0:4];
	logic [63:0] A8    [0:4][0:4];
	logic [63:0] A9    [0:4][0:4];
	logic [63:0] A10   [0:4][0:4];
	logic [63:0] A11   [0:4][0:4];
	logic [63:0] A12   [0:4][0:4];
	logic [63:0] A13   [0:4][0:4];
	logic [63:0] A14   [0:4][0:4];
	logic [63:0] A15   [0:4][0:4];
	logic [63:0] A16   [0:4][0:4];
	logic [63:0] A17   [0:4][0:4];
	logic [63:0] A18   [0:4][0:4];
	logic [63:0] A19   [0:4][0:4];
	logic [63:0] A20   [0:4][0:4];
	logic [63:0] A21   [0:4][0:4];
	logic [63:0] A22   [0:4][0:4];
	logic [63:0] A_out [0:4][0:4];

	S_to_A string_to_array (.S(S_in), .A(A_in));

    Rnd round0  (.A_in(A_in), .A_out(A0),    .i_r(5'd0));
	Rnd round1  (.A_in(A0),   .A_out(A1),    .i_r(5'd1));
	Rnd round2  (.A_in(A1),   .A_out(A2),    .i_r(5'd2));
	Rnd round3  (.A_in(A2),   .A_out(A3),    .i_r(5'd3));
	Rnd round4  (.A_in(A3),   .A_out(A4),    .i_r(5'd4));
	Rnd round5  (.A_in(A4),   .A_out(A5),    .i_r(5'd5));
	Rnd round6  (.A_in(A5),   .A_out(A6),    .i_r(5'd6));
	Rnd round7  (.A_in(A6),   .A_out(A7),    .i_r(5'd7));
	Rnd round8  (.A_in(A7),   .A_out(A8),    .i_r(5'd8));
	Rnd round9  (.A_in(A8),   .A_out(A9),    .i_r(5'd9));
	Rnd round10 (.A_in(A9),   .A_out(A10),   .i_r(5'd10));
	Rnd round11 (.A_in(A10),  .A_out(A11),   .i_r(5'd11));
	Rnd round12 (.A_in(A11),  .A_out(A12),   .i_r(5'd12));
	Rnd round13 (.A_in(A12),  .A_out(A13),   .i_r(5'd13));
	Rnd round14 (.A_in(A13),  .A_out(A14),   .i_r(5'd14));
	Rnd round15 (.A_in(A14),  .A_out(A15),   .i_r(5'd15));
	Rnd round16 (.A_in(A15),  .A_out(A16),   .i_r(5'd16));
	Rnd round17 (.A_in(A16),  .A_out(A17),   .i_r(5'd17));
	Rnd round18 (.A_in(A17),  .A_out(A18),   .i_r(5'd18));
	Rnd round19 (.A_in(A18),  .A_out(A19),   .i_r(5'd19));
	Rnd round20 (.A_in(A19),  .A_out(A20),   .i_r(5'd20));
	Rnd round21 (.A_in(A20),  .A_out(A21),   .i_r(5'd21));
	Rnd round22 (.A_in(A21),  .A_out(A22),   .i_r(5'd22));
	Rnd round23 (.A_in(A22),  .A_out(A_out), .i_r(5'd23));

	A_to_S array_to_string (.A(A_out), .S(S_out));

endmodule