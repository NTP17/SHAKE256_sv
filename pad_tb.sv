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
        $dumpfile("pad.vcd");
        $dumpvars;
        //data_in = {5'b10011, 1083'b0};
        //data_length = 5;
        //data_in = {30'b010100110101100001111011011001, 1058'b0};
        //data_length = 30;
        data_in = 0;
        data_length = 1087;
        #1;
        $display("data_in = %b", data_in);
        $display("data_length = %d", data_length);
        $display("data_out  = %h", data_out);
        $display("data_next = %h", data_next);
        #1;
        $finish;
    end

endmodule