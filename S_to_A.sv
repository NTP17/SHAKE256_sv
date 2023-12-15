module S_to_A (
	input  [1599:0] S,
	output A [0:4][0:4][0:63]
);

	genvar x, y, z;
	generate
		for (y = 0; y < 5; y = y + 1) begin : width
			for (x = 0; x < 5; x = x + 1) begin : height
				for (z = 0; z < 64; z = z + 1) begin : depth
					assign A[x][y][z] = S[(64*((5*y)+x))+z];
				end
			end
		end
	endgenerate

	// logic [63:0]  Lane  [0:4][0:4];
	// logic [319:0] Plane [0:4];
	
	// genvar i, j;
	// generate
	// 	for (j = 0; j < 5; j = j + 1) begin : Lane_i
	// 		for (i = 0; i < 5; i = i + 1) begin : Lane_j
	// 			assign Lane[i][j] = {A[i][j][0],  A[i][j][1],  A[i][j][2],  A[i][j][3],
	// 								 A[i][j][4],  A[i][j][5],  A[i][j][6],  A[i][j][7],
	// 								 A[i][j][8],  A[i][j][9],  A[i][j][10], A[i][j][11],
	// 								 A[i][j][12], A[i][j][13], A[i][j][14], A[i][j][15],
	// 								 A[i][j][16], A[i][j][17], A[i][j][18], A[i][j][19],
	// 								 A[i][j][20], A[i][j][21], A[i][j][22], A[i][j][23],
	// 								 A[i][j][24], A[i][j][25], A[i][j][26], A[i][j][27],
	// 								 A[i][j][28], A[i][j][29], A[i][j][30], A[i][j][31],
	// 								 A[i][j][32], A[i][j][33], A[i][j][34], A[i][j][35],
	// 								 A[i][j][36], A[i][j][37], A[i][j][38], A[i][j][39],
	// 								 A[i][j][40], A[i][j][41], A[i][j][42], A[i][j][43],
	// 								 A[i][j][44], A[i][j][45], A[i][j][46], A[i][j][47],
	// 								 A[i][j][48], A[i][j][49], A[i][j][50], A[i][j][51],
	// 								 A[i][j][52], A[i][j][53], A[i][j][54], A[i][j][55],
	// 								 A[i][j][56], A[i][j][57], A[i][j][58], A[i][j][59],
	// 								 A[i][j][60], A[i][j][61], A[i][j][62], A[i][j][63]};
	// 		end
	// 	end
	
	// 	for (j = 0; j < 5; j = j + 1) begin : Plane_j
	// 		assign Plane[j] = {Lane[0][j], Lane[1][j], Lane[2][j], Lane[3][j], Lane[4][j]};
	// 	end
	// endgenerate

	// assign {Plane[0], Plane[1], Plane[2], Plane[3], Plane[4]} = {S[]};

endmodule