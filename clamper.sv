module clamper (input [3:0] in, output [3:0] out);

    assign out = (in > 8) ? 8 : in;

endmodule