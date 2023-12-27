module pad (
    input [1087:0] data_in,
    input [10:0] data_length,
    output logic [1087:0] data_out,
    output logic [1087:0] data_next
);

    always_comb begin
        if ((data_length >= 0) && (data_length <= 1088)) begin
            if (data_length == 0) begin
                data_out = 1088'h1f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
                data_next = 1088'b0;
            end else if (data_length == 1088) begin
                data_out = data_in;
                data_next = 1088'h1f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1087) begin
                data_out = {data_in[1087:8], 1'h1, data_in[7:1]};
                data_next = 1088'h0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1086) begin
                data_out = {data_in[1087:8], 2'h3, data_in[7:2]};
                data_next = 1088'h07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1085) begin
                data_out = {data_in[1087:8], 3'h7, data_in[7:3]};
                data_next = 1088'h03000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1084) begin
                data_out = {data_in[1087:8], 4'hf, data_in[7:4]};
                data_next = 1088'h01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1083) begin
                data_out = {data_in[1087:8], 5'h1f, data_in[7:5]};
                data_next = 1088'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080;
            end else if (data_length == 1082) begin
                data_out = {data_in[1087:8], 6'h3f, data_in[7:6]};
                data_next = 1088'b0;
            end else if (data_length == 1081) begin
                data_out = {data_in[1087:8], 7'b101_1111, data_in[7]};
                data_next = 1088'b0;
            end else if (data_length == 1080) begin
                data_out = {data_in[1087:8], 8'b1001_1111};
                data_next = 1088'b0;
            end else if (data_length == 1079) begin
                data_out = {data_in[1087:16], 1'h1, data_in[15:9], 8'b1000_1111};
                data_next = 1088'b0;
            end else if (data_length == 1078) begin
                data_out = {data_in[1087:16], 2'h3, data_in[15:10], 8'b1000_0111};
                data_next = 1088'b0;
            end else if (data_length == 1077) begin
                data_out = {data_in[1087:16], 3'h7, data_in[15:11], 8'b1000_0011};
                data_next = 1088'b0;
            end else if (data_length == 1076) begin
                data_out = {data_in[1087:16], 4'hf, data_in[15:12], 8'b1000_0001};
                data_next = 1088'b0;
            end else if (data_length == 1075) begin
                data_out = {data_in[1087:16], 5'h1f, data_in[15:13], 8'h80};
                data_next = 1088'b0;
            end else if (data_length == 1074) begin
                data_out = {data_in[1087:16], 6'h1f, data_in[15:14], 8'h80};
                data_next = 1088'b0;
            end else if (data_length == 1073) begin
                data_out = {data_in[1087:16], 7'h1f, data_in[15], 8'h80};
                data_next = 1088'b0;
            end else if (data_length == 1072) begin
                data_out = {data_in[1087:16], 8'h1f, 8'h80};
                data_next = 1088'b0;
            end else begin
                case (data_length % 8)
                    0: data_out =                      {       data_in[1087:(1088-data_length)],                                                            8'h1f, {(1088-data_length-16){1'b0}}, 8'h80};
                    1: data_out = (data_length == 1) ? {7'h1f, data_in[1088-data_length],                                                                          {(1088-data_length-15){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+1)], 7'h1f, data_in[1088-data_length],                               {(1088-data_length-15){1'b0}}, 8'h80};
                    2: data_out = (data_length == 2) ? {6'h1f, data_in[1087:(1088-data_length)],                                                                   {(1088-data_length-14){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+2)], 6'h1f, data_in[(1088-data_length+1):(1088-data_length)],        {(1088-data_length-14){1'b0}}, 8'h80};
                    3: data_out = (data_length == 3) ? {5'h1f, data_in[1087:(1088-data_length)],                                                                   {(1088-data_length-13){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+3)], 5'h1f, data_in[(1088-data_length+2):(1088-data_length)],        {(1088-data_length-13){1'b0}}, 8'h80};
                    4: data_out = (data_length == 4) ? {4'hf,  data_in[1087:(1088-data_length)],                                                            8'h1,  {(1088-data_length-20){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+4)], 4'hf,  data_in[(1088-data_length+3):(1088-data_length)], 8'h1,  {(1088-data_length-20){1'b0}}, 8'h80};
                    5: data_out = (data_length == 5) ? {3'h7,  data_in[1087:(1088-data_length)],                                                            8'h3,  {(1088-data_length-19){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+5)], 3'h7,  data_in[(1088-data_length+4):(1088-data_length)], 8'h3,  {(1088-data_length-19){1'b0}}, 8'h80};
                    6: data_out = (data_length == 6) ? {2'h3,  data_in[1087:(1088-data_length)],                                                            8'h7,  {(1088-data_length-18){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+6)], 2'h3,  data_in[(1088-data_length+5):(1088-data_length)], 8'h7,  {(1088-data_length-18){1'b0}}, 8'h80};
                    7: data_out = (data_length == 7) ? {1'h1,  data_in[1087:(1088-data_length)],                                                            8'hf,  {(1088-data_length-17){1'b0}}, 8'h80} :
                                                       {       data_in[1087:(1088-data_length+7)], 1'h1,  data_in[(1088-data_length+6):(1088-data_length)], 8'hf,  {(1088-data_length-17){1'b0}}, 8'h80};
                    default: data_out = 1088'b0;
                endcase
                data_next = 1088'b0;
            end
        end else begin
            data_out = data_in;
            data_next = 1088'b0;            
        end
    end

endmodule