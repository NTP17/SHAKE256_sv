module Rnd (
	input  A_in  [0:4][0:4][0:63],
    input  [4:0] i_r,
	output A_out [0:4][0:4][0:63]
);

    logic A_theta [0:4][0:4][0:63];
    logic A_rho   [0:4][0:4][0:63];
    logic A_pi    [0:4][0:4][0:63];
    logic A_chi   [0:4][0:4][0:63];

    theta theta_inst (.A_in(A_in),    .A_out(A_theta));
    rho   rho_inst   (.A_in(A_theta), .A_out(A_rho));
    pi    pi_inst    (.A_in(A_rho),   .A_out(A_pi));
    chi   chi_inst   (.A_in(A_pi),    .A_out(A_chi));
    iota  iota_inst  (.A_in(A_chi),   .A_out(A_out), .i_r(i_r));

endmodule