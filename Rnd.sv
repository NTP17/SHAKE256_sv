module Rnd (
	input  [63:0] A_in  [0:4][0:4],
    input  [4:0] i_r,
	output [63:0] A_out [0:4][0:4]
);

    logic [63:0] A_theta [0:4][0:4];
    logic [63:0] A_rho   [0:4][0:4];
    logic [63:0] A_pi    [0:4][0:4];
    logic [63:0] A_chi   [0:4][0:4];

    theta theta_inst (.A_in(A_in),    .A_out(A_theta));
    rho   rho_inst   (.A_in(A_theta), .A_out(A_rho));
    pi    pi_inst    (.A_in(A_rho),   .A_out(A_pi));
    chi   chi_inst   (.A_in(A_pi),    .A_out(A_chi));
    iota  iota_inst  (.A_in(A_chi),   .A_out(A_out), .i_r(i_r));

endmodule