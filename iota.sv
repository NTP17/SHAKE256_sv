module iota (
	input  [63:0] A_in  [0:4][0:4],
    input  [4:0] i_r,
	output [63:0] A_out [0:4][0:4]
);

    logic [63:0] round_constant;

    rc rc_inst (.t(i_r), .rct(round_constant));

    genvar x, y, z;
    generate
        for (x = 0; x < 5; x = x + 1) begin : iota_x
            for (y = 0; y < 5; y = y + 1) begin : iota_y
                for (z = 0; z < 64; z = z + 1) begin : iota_z
                    assign A_out[x][y][z] = (x==0 && y==0) ? (A_in[x][y][z] ^ round_constant[z]) : A_in[x][y][z];
                end
            end
        end
    endgenerate

endmodule