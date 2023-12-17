`timescale 1ps/1ps

module KECCAK_f_tb;

    // Inputs and Outputs
    logic [1599:0] S_in, S_out;
    
    // Instantiate the module under test
    KECCAK_f dut (.S_in(S_in), .S_out(S_out));

    // Test stimulus
    initial begin
        $dumpfile("KECCAKf_tb.vcd");
        $dumpvars;

	    // Apply stimulus
        S_in = 'h1F00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        
        // Wait for a few clock cycles
        #1;
        
        // Print the output
        $display("S_in  = %h", S_in);
        $display("S_out = %h", S_out);

        // End the simulation
        $finish;
    end
    
endmodule