module SHAKE256 (
    input clock, reset,
    input [1087:0] message,
    input [10:0] length,
    output logic busy, full, squeezed,
    output logic [1087:0] hash
);

    logic [2:0] addrA, addrB;
    logic wren, aclr, squeeze, done;
    logic [1087:0] dataA, dataB, RAM_out;
    logic [1599:0] S_in, S_out, digest;
    logic [1:0] state_sel;

    assign hash = digest[1599:512];
    assign S_in = (state_sel == 0) ? ({RAM_out, 512'b0} ^ digest) :
                  (state_sel == 1) ? ({RAM_out, 512'b0}) : digest;

    pad pad10_1 (
        .data_in(message),
        .data_length(length),
        .data_out(dataA),
        .data_next(dataB)
    );

    inmem RAM (
        .clock(clock),
        .address_a(addrA),
        .address_b(addrB),
        .data_a(dataA),
        .data_b(dataB),
        .wren_a(wren),
        .wren_b(wren),
        .q_a(RAM_out)
    );

    control_unit cu (
        .clock(clock),
        .reset(reset),
        .data_next(dataB),
        .length(length),
        .addrA(addrA),
        .addrB(addrB),
        .state_sel(state_sel),
        .wren(wren),
        .busy(busy),
        .full(full),
        .aclr(aclr),
        .squeeze(squeeze)
    );

    KECCAK_f KECCAK (
        .clock(clock),
        .reset(aclr),
        .squeeze(squeeze),
        .S_in(S_in),
        .S_out(S_out),
        .done(done)
    );

    always_ff @ (posedge clock, negedge reset) begin
        if (!reset) begin
            digest = 0;
            squeezed = 0;
        end else begin
            digest = S_out;
            squeezed = done; 
        end
    end

endmodule