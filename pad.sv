module pad (
    input [1087:0] data_in,
    input [10:0] data_length,
    output [1087:0] data_out,
    output [1087:0] data_next
);

    always_comb begin
        if ((data_length >= 0) && (data_length <= 1088)) begin

        end else begin
            data_out = data_in;
            data_next = 1088'b0;            
        end
    end

endmodule