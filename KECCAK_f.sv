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

	genvar x, y;
	always_ff @(posedge clock, negedge reset)
		if (!reset)
			generate
				for (x = 0; x < 5; x = x + 1) begin : reset_x
					for (y = 0; y < 5; y = y + 1) begin : reset_y
						assign A_out[x][y] = 0;
					end
				end
			endgenerate

		else if (round == 24)
		generate
			for (x = 0; x < 5; x = x + 1) begin : full_x
				for (y = 0; y < 5; y = y + 1) begin : full_y
					assign A_out[x][y] = 0;
				end
			end
		endgenerate

		else A_out = A_mid_out;

	A_to_S array_to_string (.A(A_out), .S(S_out));

	assign done = (round == 24);

endmodule