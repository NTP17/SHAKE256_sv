`timescale 1ps/1ps

module SHAKE256_tb;

    logic clock, reset;
    logic [1087:0] message;
    logic [10:0] length;
    logic busy, full, squeezed;
    logic [1087:0] hash;

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

    initial forever #1 clock = ~clock;

    initial begin
        clock = 0;
        reset = 0;
        message = 0;
        length = 0;
        $dumpfile("SHAKE256.vcd");
        $dumpvars;
        #2;
        reset = 1;
        $display("message = %h", message);
        $display("length = %d", length);
        $display;
    end

    int i = 0;

    initial begin
        #2;
        repeat (26) begin
            #2;
            $display("Round %0d", i);
            $display("full = %b", full);
            $display("busy = %b", busy);
            $display("hash = %h", hash);
            $display("squeezed = %b", squeezed);
            i++;
        end

        $finish;
    end

endmodule