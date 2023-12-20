module KECCAK_f (
	input clock, reset,
	input  [1599:0] S_in,
	output [1599:0] S_out,
	output done
);

	logic [63:0] A_in      [0:4][0:4];
	logic [63:0] A_in_mid  [0:4][0:4];
	logic [63:0] A_mid_out [0:4][0:4];
	logic [63:0] A_out     [0:4][0:4];
	logic  [4:0] round;

	S_to_A string_to_array (.S(S_in), .A(A_in));

	round_counter rndcnt (.clock(clock), .reset(reset), .round(round));

	assign A_in_mid = (round == 0) ? A_in : A_out;

	Rnd rnd_inst (.A_in(A_in_mid), .i_r(round), .A_out(A_mid_out));

	always_ff @(posedge clock, negedge reset)
		if (!reset)           A_out = 0;
		else if (round == 24) A_out = 0;
		else                  A_out = A_mid_out;

	A_to_S array_to_string (.A(A_out), .S(S_out));

	assign done = (round == 24);

endmodule