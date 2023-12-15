module rho (
	input  [63:0] A_in  [0:4][0:4],
	output logic [63:0] A_out [0:4][0:4]
);

	genvar z;
	generate
		for (z = 0; z < 64; z = z + 1) begin : rho_z
			assign A_out[0][0][z] = A_in[0][0][z];
			assign A_out[1][0][z] = A_in[1][0][(z-1+64)%64];
			assign A_out[2][0][z] = A_in[2][0][(z-62+64)%64];
			assign A_out[3][0][z] = A_in[3][0][(z-28+64)%64];
			assign A_out[4][0][z] = A_in[4][0][(z-27+64)%64];
			
			assign A_out[0][1][z] = A_in[0][1][(z-36+64)%64];
			assign A_out[1][1][z] = A_in[1][1][(z-44+64)%64];
			assign A_out[2][1][z] = A_in[2][1][(z-6+64)%64];
			assign A_out[3][1][z] = A_in[3][1][(z-55+64)%64];
			assign A_out[4][1][z] = A_in[4][1][(z-20+64)%64];
			
			assign A_out[0][2][z] = A_in[0][2][(z-3+64)%64];
			assign A_out[1][2][z] = A_in[1][2][(z-10+64)%64];
			assign A_out[2][2][z] = A_in[2][2][(z-43+64)%64];
			assign A_out[3][2][z] = A_in[3][2][(z-25+64)%64];
			assign A_out[4][2][z] = A_in[4][2][(z-39+64)%64];
			
			assign A_out[0][3][z] = A_in[0][3][(z-41+64)%64];
			assign A_out[1][3][z] = A_in[1][3][(z-45+64)%64];
			assign A_out[2][3][z] = A_in[2][3][(z-15+64)%64];
			assign A_out[3][3][z] = A_in[3][3][(z-21+64)%64];
			assign A_out[4][3][z] = A_in[4][3][(z-8+64)%64];
			
			assign A_out[0][4][z] = A_in[0][4][(z-18+64)%64];
			assign A_out[1][4][z] = A_in[1][4][(z-2+64)%64];
			assign A_out[2][4][z] = A_in[2][4][(z-61+64)%64];
			assign A_out[3][4][z] = A_in[3][4][(z-56+64)%64];
			assign A_out[4][4][z] = A_in[4][4][(z-14+64)%64];
		end
	endgenerate

endmodule