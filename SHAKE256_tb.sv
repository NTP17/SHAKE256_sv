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
        $display;
        clock = 0;
        reset = 0;
        $dumpfile("SHAKE256.vcd");
        $dumpvars;

        #2;
        reset = 1;

        message = 0;
        length = 0;
        $display("NIST Test Case: Empty String");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h46b9dd2b0ba88d13233b3feb743eeb243fcd52ea62b81b82b50c27646ed5762fd75dc4ddd8c0f200cb05019d67b592f6fc821c49479ab48640292eacb3b7c4be141e96616fb13957692cc7edd0b45ae3dc07223c8e92937bef84bc0eab862853349ec75546f58fb7c2775c38462c5010d846c185c15111e595522a6bcd16cf86f3d122109e3b1fdd)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {5'b10011, 1083'b0};
        length = 5;
        $display("NIST Test Case: 5-bit String");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h48a5c11abaeeff092f3646ef0d6b3d3ff76c2f55f9c732ac6470c03764008212e21b1467778b181989f88858211b45df8799cf961f800dfac99e644039e2979a4016f5456ff421c5b385da2b855da7e31c8c2e8e4ba41eb4095cb999d9759cb40358da8562a2e61349e05a2e13f1b74ec9e69f5b426dc74138ffcdc571c32b39b9f55563e1a99dc4)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {30'b010100110101100001111011011001, 1058'b0};
        length = 30;
        $display("NIST Test Case: 30-bit String");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h465d081dff875e396200e4481a3e9dcd88d079aa6d66226cb6ba454107cb81a7841ab02960de279ccbe34b42c36585ad86964db0db52b6e7b4369ece8f7248589ba78ab1828ffc335cb12397119bfd2b87eb7898aeb956b6f23ddf0bd4004386a8e526554ef4e483facee30dd32e204fff8c36bbd602a576d139089c75a8050266fcbf721e4443de)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1600;
        $display("NIST Test Case: 1600-bit String");
        //$write("%h", message);
        #2;
        message = {512'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 576'h0};
        length = 512;
        //$display("%h", message[1087:576]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'hcd8a920ed141aa0407a22d59288652e9d9f1a7ee0c1e7c1ca699424da84a904d2d700caae7396ece96604440577da4f3aa22aeb8857f961c4cd8e06f0ae6610b1048a7f64e1074cd629e85ad7566048efc4fb500b486a3309a8f26724c0ed628001a1099422468de726f1061d99eb9e93604d5aa7467d4b1bd6484582a384317d7f47d750b8f5499)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1605;
        $display("NIST Test Case: 1605-bit String");
        //$write("%h", message);
        #2;
        message = {512'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 5'h3, 571'h0};
        length = 517;
        //$display("%h", message[1087:571]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h98d093b067475760124ffb9204a5b327c6bb05c54ff234f0b43fac7240415166a8c705ea0d739f0808b06576d996662c1f376694d98f515719b66407720dcf781c51cd56ef8b610c668ddc1ac1c2c429ea4d6f274aa7a773bf8b0cab306f1eee2a171b91334ea0facd2aac1f51d4d5eb0e63a4e6754ecafeec246b7aaf58d0e0a974c7ff4058bdbd)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = 'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3;
        length = 1630;
        $display("NIST Test Case: 1630-bit String");
        //$write("%h", message);
        #2;
        message = {536'ha3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3, 6'h23, 546'h0};
        length = 542;
        //$display("%h", message[1087:546]);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h8a8325079b0fc3265d52f59855cafe655df438aa639f6fec991f2494330ce32fa37f7db90f6966d8e4a46e50c5ede57b9b8f082a96627f730475029a619229d84f432ed69fd059234d4d7dd358e8393f6a36a45ccf041f90fc0a4e5802d73063d36531336a0090ecfe1a4d4d29aa824ba42b4937b4bb98f4f33a0e3bd8b511e69528d59537110d75)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = {1088{1'b1}};
        length = 1089;
        $display("User Test Case: Full Flag");
        //$write("%h", message);
        #2;
        //$write("%h", message);
        #2;
        //$write("%h", message);
        #2;
        //$write("%h", message);
        #2;
        //$write("%h", message);
        #2;
        //$write("%h", message);
        #2;
        #2;
        message = 0;
        length = 1088;
        //$display("%h", message);
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h2567f171ae9768bbcf9016e16975c3abbca743608da261328b66fa73698df2a72c1b80a59f5df6f52cf2f534df8852680152b23b624da3f22cdf873197a75c4b36ce8070178d20c5626e8f2989c7a364693ddcc1c01e7e69f4b0ddc8037e7bed2c0247be8258a25b99a885c0676d63b08636954ddb32f952aa0960e6d118d4647ebfd05cccc92791)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        reset = 0;
        #2;
        reset = 1;

        message = "the quick brown fox jumps over the lazy dog";
        length = 344;
        message = {message, 744'b0};
        $display("User Test Case: \"the quick brown fox jumps over the lazy dog\"");
        clock_count = 0;
        @(posedge squeezed);
        $display("Absorb phase took %0d cycles", clock_count);
        assert (hash == 1088'h1b41776f076bf55c0c70a45f5adaee1eeb1ebe25065f217d354a4cc2d1b9051f6e59f9c3767ffb694ca31399cd5cd98aaf22053e0fc1dac04a36a82a7a93913d4b7fc916dbae2db4732cf25cc8b35c734ae832fb0fdcce35e641cd3df72a56d7b373d92a17811463246e20244cc721049ce13aaa25062beafb57ea54a3ccda28bac92706532ac4fb)
            $display("PASSED");
        else 
            $error("FAILED");
        // $write("output = ");
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $write("%h", hash);
        // @(posedge squeezed);
        // $display("%h", hash);
        $display;

        #1;
        $finish;
    end

endmodule
