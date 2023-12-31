module WRAPPER(
	input 		     [3:0]		KEY,

	input 		     [17:0]		SW,

	output		     [17:0]		LEDR,

	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7
);

	logic [1087:0] shake256_data;
	logic [31:0] msb, lsb, disp;

	assign msb = shake256_data[1087:1056];
	assign lsb = shake256_data[31:0];
	assign disp = (SW[0]) ? lsb : msb;

	SHAKE256 keccak (
		.clock(KEY[3]),
		.reset(SW[17]),
		.message(1088'b0),
		.length(11'b0),
		.squeezed(LEDR[17]),
		.hash(shake256_data)
	);

	binto7seg disp0 (.bits(disp[3:0]),   .segs(HEX0));
	binto7seg disp1 (.bits(disp[7:4]),   .segs(HEX1));
	binto7seg disp2 (.bits(disp[11:8]),  .segs(HEX2));
	binto7seg disp3 (.bits(disp[15:12]), .segs(HEX3));
	binto7seg disp4 (.bits(disp[19:16]), .segs(HEX4));
	binto7seg disp5 (.bits(disp[23:20]), .segs(HEX5));
	binto7seg disp6 (.bits(disp[27:24]), .segs(HEX6));
	binto7seg disp7 (.bits(disp[31:28]), .segs(HEX7));

endmodule