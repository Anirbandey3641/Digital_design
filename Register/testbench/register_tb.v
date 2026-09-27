`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 14:46:11
// Design Name: 
// Module Name: register_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module register_tb;
    reg clk;
    reg reset;
    reg enable;
    reg [15:0] data_in;
    wire [15:0] data_out;

    // Instantiate the register
    register
    
     uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk = 0;
        reset = 1;
        enable = 0;
        data_in = 16'b0;

        // Reset the register
        #10;
        reset = 0;

        // Write first data
        enable = 1;
        data_in = 16'h1234;

        #10;

        // Disable writing - value should remain unchanged
        enable = 0;
        data_in = 16'hFFFF;

        #10;

        // Write second data
        enable = 1;
        data_in = 16'hABCD;

        #10;

        // Disable writing again
        enable = 0;

        #10;

        // Reset register
        reset = 1;

        #10;

        reset = 0;

        #10;

        $finish;
    end
endmodule
