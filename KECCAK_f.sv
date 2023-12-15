module KECCAK_f (
	input  [63:0] A_in  [0:4][0:4],
	output [63:0] A_out [0:4][0:4]
);

    Rnd round_inst (.A_in(A_in), .A_out(A_out), .i_r(5'd0));

endmodule