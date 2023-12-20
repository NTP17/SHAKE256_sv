module round_counter (input clock, reset, output logic [4:0] round);

    always_ff @(posedge clock, negedge reset)
        if (!reset)           round =         0;
        else if (round == 24) round =         0;
        else                  round = round + 1;

endmodule