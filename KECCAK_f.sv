module KECCAK_f (
    input [1599:0] S_in,
    output [1599:0] S_out
);

    logic A_in [0:4][0:4][0:63];
    logic A_out [0:4][0:4][0:63];

    S_to_A string_to_array (.S(S_in), .A(A_in));

    theta theta_inst (.A_in(A_in), .A_out(A_out));
    //Rnd round_inst (.A_in(A_in), .A_out(A_out), .i_r(5'd0));

    A_to_S array_to_string (.A(A_out), .S(S_out));

endmodule