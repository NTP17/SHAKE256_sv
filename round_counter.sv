module round_counter (input clock, reset, output logic [4:0] round);

    always_ff @(posedge clock, negedge reset)
        if (!reset)             round =         'd0;
        else if (round == 'd24) round =         'd0;
        else                    round = round + 'd1;

endmodule