module binto7seg
  (
    input logic [3:0] bits,
   output logic [6:0] segs
   );

  always_comb begin
    unique case(bits)
      4'd0: segs = 7'b1000000;
      4'd1: segs = 7'b1111001;
      4'd2: segs = 7'b0100100;
      4'd3: segs = 7'b0110000;
      4'd4: segs = 7'b0011001;
      4'd5: segs = 7'b0010010;
      4'd6: segs = 7'b0000010;
      4'd7: segs = 7'b1111000;
      4'd8: segs = 7'b0000000;
      4'd9: segs = 7'b0010000;
      4'hA: segs = 7'b0001000;
      4'hB: segs = 7'b0000011;
      4'hC: segs = 7'b1000110;
      4'hD: segs = 7'b0100001;
      4'hE: segs = 7'b0000110;
      4'hF: segs = 7'b0001110;
      default: segs = 7'b0111111;
    endcase
  end

endmodule