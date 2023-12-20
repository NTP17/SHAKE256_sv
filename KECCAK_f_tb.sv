`timescale 1ps/1ps

module KECCAK_f_tb;

    logic [1599:0] S_in, S_out;
    logic clock, reset, done;
    
    KECCAK_f dut (.clock(clock), .reset(reset), .S_in(S_in), .S_out(S_out), .done(done));

    initial begin
        $dumpfile("KECCAKf_tb.vcd");
        $dumpvars;

        clock = 0;
        reset = 0;
        S_in = 'h1F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

        $display("S_in  = %h", S_in);
        $display("S_out = %h", S_out);
        $display("done  = %b", done);
        $display;

        #1; reset = 1;
    end

    initial forever #1 clock = ~clock;

    initial begin
        repeat (24) begin
            #2;
            $display("Round #%0d", $time/2);
            $display("S_out = %h", S_out);
            $display("done  = %b", done);
            $display;
        end

        $finish;
    end
    
endmodule