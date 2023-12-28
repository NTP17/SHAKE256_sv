`timescale 1ps/1ps

module SHAKE256_tb;

    logic clock, reset;
    logic [1087:0] message;
    logic [10:0] length;
    logic busy, full, squeezed;
    logic [1087:0] hash;
	logic [9:0] clock_count;

    SHAKE256 dut (
        .clock(clock),
        .reset(reset),
        .message(message),
        .length(length),
        .busy(busy),
        .full(full),
        .squeezed(squeezed),
        .hash(hash)
    );
	 
	always @ (posedge clock) clock_count = clock_count + 1;
	 
    initial forever #1 clock = ~clock;
	 
    initial begin
        clock = 0;
        reset = 0;
        $dumpfile("SHAKE256.vcd");
        $dumpvars;

        #2;
        reset = 1;

        message = 0;
        length = 0;
		$display("input = (empty string)");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {5'b10011, 1083'b0};
        length = 5;
		$display("input = 5'b10011");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {30'b010100110101100001111011011001, 1058'b0};
        length = 30;
		$display("input = 30'b010100110101100001111011011001");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1600;
		$write("input = 1600'h");
        $write("%h", message);
		#2;
        message = {512'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 576'h0};
        length = 512;
        $display("%h", message[1087:576]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1605;
		$write("input = 1605'h");
        $write("%h", message);
		#2;
        message = {512'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 5'h3, 571'h0};
        length = 517;
        $display("%h", message[1087:571]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1630;
		$write("input = 1630'h");
        $write("%h", message);
		#2;
        message = {536'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 6'h23, 546'h0};
        length = 542;
        $display("%h", message[1087:546]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {1088{1'b1}};
        length = 1089;
        $write("input = 7616'h");
        $write("%h", message);
        #2;
        $write("%h", message);
        #2;
        $write("%h", message);
        #2;
        $write("%h", message);
        #2;
        $write("%h", message);
        #2;
        $write("%h", message);
        #2;
        #2;
        message = 0;
        length = 1088;
        $display("%h", message);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = "the quick brown fox jumps over the lazy dog";
        length = 344;
        message = {message, 744'b0};
		$display("input = \"the quick brown fox jumps over the lazy dog\"");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        $write("output = ");
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $write("%h", hash);
        @(posedge squeezed);
        $display("%h", hash);
        $display;

        #1;
		$finish;
    end

endmodule