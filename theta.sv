module theta (
	input  A_in  [0:4][0:4][0:63],
	output A_out [0:4][0:4][0:63]
);

	logic C [0:4][0:63];
	logic D [0:4][0:63];

	genvar x, y, z;
	generate
		for (x = 0; x < 5; x = x + 1) begin : theta_x
			for (z = 0; z < 64; z = z + 1) begin : theta_z
				assign C[x][z] = A_in[x][0][z] ^ A_in[x][1][z] ^ A_in[x][2][z] ^ A_in[x][3][z] ^ A_in[x][4][z];
			end
		end
		
		for (x = 0; x < 5; x = x + 1) begin : theta_xxx
			for (z = 0; z < 64; z = z + 1) begin : theta_zzz
				assign D[x][z] = C[(x-1+5)%5][z] ^ C[(x+1)%5][(z-1+64)%64];
			end
		end

		for (x = 0; x < 5; x = x + 1) begin : theta_xx
			for (y = 0; y < 5; y = y + 1) begin : theta_y
				for (z = 0; z < 64; z = z + 1) begin : theta_zz
					assign A_out[x][y][z] = A_in[x][y][z] ^ D[x][z];
				end
			end
		end
	endgenerate

endmodule