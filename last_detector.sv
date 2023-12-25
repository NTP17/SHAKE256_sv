module last_detector (input [10:0] length, output is_last);

    assign is_last = ((length >= 0) && (length <= 1088)) ? 1 : 0;

endmodule