module control_unit (
    input clock, reset,
    input [1087:0] data_next,
    input [10:0] length,
    output [2:0] addrA, addrB,
    output [1:0] state_sel,
    output wren, busy, full, aclr, squeeze
);

    logic [3:0] addrA_reg, addrB_reg, absorb_amount;
    logic [1:0] state_sel_reg;
    logic wren_reg, busy_reg, full_reg, aclr_reg, squeeze_reg;
    logic [4:0] round_count;
    logic [1:0] cu_state;

    localparam INPUT = 2'd0, READY = 2'd1, ABSORB = 2'd2, SQUEEZE = 2'd3;

    assign addrA = addrA_reg[2:0];
    assign addrB = addrB_reg[2:0];
    assign state_sel = state_sel_reg;
    assign wren = wren_reg;
    assign busy = busy_reg;
    assign full = full_reg;
    assign aclr = aclr_reg;
    assign squeeze = squeeze_reg;

    always_ff @ (posedge clock, negedge reset) begin
        if (!reset) begin
            cu_state = INPUT;
            addrA_reg = 0;
            addrB_reg = 1;
            absorb_amount = 0;
            wren_reg = 1;
            busy_reg = 0;
            full_reg = 0;
            aclr_reg = 0;
            squeeze_reg = 0;
            state_sel_reg = 1;
            round_count = 0;
        end else if (cu_state == INPUT) begin
            if ((length >= 0) && (length <= 1088)) begin
                cu_state = READY;
                addrA_reg = 0;
                absorb_amount = (data_next == 0) ? (addrB_reg-1) : addrB_reg;
                wren_reg = 0;
                busy_reg = 1;
                full_reg = 0;
            end else begin
                if (addrA_reg == 6) begin
                    wren_reg = 1;
                    busy_reg = 0;
                    full_reg = 1;
                end else begin
                    addrA_reg = addrA_reg + 1;
                    addrB_reg = addrB_reg + 1;
                    wren_reg = 1;
                    busy_reg = 0;
                    full_reg = 0;                   
                end
            end
        end else if (cu_state == READY) begin
		        cu_state = ABSORB;
				absorb_amount = (absorb_amount == 0) ? absorb_amount : (absorb_amount+1);
				aclr_reg = 1;
        end else if (cu_state == ABSORB) begin
            if (addrA_reg == absorb_amount) begin
                cu_state = SQUEEZE;
                squeeze_reg = 1;
                state_sel_reg = 2;
            end else if (round_count < 23) begin
                state_sel_reg = (addrA_reg == 0) ? 1 : 0;
                round_count = round_count + 1;
            end else begin
                addrA_reg = addrA_reg + 1;
                squeeze_reg = (addrA_reg == absorb_amount) ? 1 : 0;
                state_sel_reg = 0;
                round_count = 0;
            end
        end else if (cu_state == SQUEEZE) cu_state = SQUEEZE;
    end

endmodule