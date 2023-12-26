`timescale 1ps/1ps

module pad_tb;

    logic [1087:0] data_in;
    logic [10:0] data_length;
    logic [1087:0] data_out;
    logic [1087:0] data_next;

    pad dut (
        .data_in(data_in),
        .data_length(data_length),
        .data_out(data_out),
        .data_next(data_next)
    );

    initial begin
        $dumpfile("pad_tb.vcd");
        $dumpvars;
        data_in = {5'b10011, 1083'b0};
        data_length = 5;
        #1;
        $display("data_in = %b", data_in);
        $display("data_length = %d", data_length);
        $display("data_out = %h", data_out);
    end

endmodule