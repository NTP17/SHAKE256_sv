module clamper (input [2:0] in, output [2:0] out);

    assign out = (in > 4) ? 4 : in;

endmodule