module pi (
	input  [63:0] A_in  [0:4][0:4],
	output [63:0] A_out [0:4][0:4]
);

	genvar x, y, z;
	generate
		for (x = 0; x < 5; x = x + 1) begin : pi_x
			for (y = 0; y < 5; y = y + 1) begin : pi_y
				for (z = 0; z < 64; z = z + 1) begin : pi_z
					assign A_out[x][y][z] = A_in[(x+(3*y))%5][x][z];
				end
			end
		end
	endgenerate

endmodule