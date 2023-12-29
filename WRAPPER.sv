module WRAPPER(
	input 		     [3:0]		KEY,

	input 		     [9:0]		SW,

	output		     [9:0]		LEDR,

	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5
);

	logic [1087:0] shake256_data;
	logic [23:0] msb, lsb, disp;

	assign msb = shake256_data[1087:1064];
	assign lsb = shake256_data[23:0];
	assign disp = (SW[0]) ? lsb : msb;

	SHAKE256 keccak (
		.clock(KEY[0]),
		.reset(SW[9]),
		.message(1088'b0),
		.length(11'b0),
		.squeezed(LEDR[0]),
		.hash(shake256_data)
	);

	binto7seg disp0 (.bits(disp[3:0]),   .segs(HEX0));
	binto7seg disp1 (.bits(disp[7:4]),   .segs(HEX1));
	binto7seg disp2 (.bits(disp[11:8]),  .segs(HEX2));
	binto7seg disp3 (.bits(disp[15:12]), .segs(HEX3));
	binto7seg disp4 (.bits(disp[19:16]), .segs(HEX4));
	binto7seg disp5 (.bits(disp[23:20]), .segs(HEX5));

endmodule