module clamper #(parameter INPUT_BITS = 3) (input [INPUT_BITS:0] in, output [INPUT_BITS:0] out);

    assign out = (in > (1<<INPUT_BITS)) ? (1<<INPUT_BITS) : in;

endmodule