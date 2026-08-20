`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 16:22:50
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,
    input we,                 // Write Enable
    input [3:0] addr,          // 4-bit address (16 locations)
    input [15:0] din,          // Data Input
    output reg [15:0] dout     // Data Output
);

    // Memory Declaration
    reg [15:0] memory [15:0];

    always @(posedge clk)
    begin
        if (we)
            memory[addr] <= din;   // Write Operation

        dout <= memory[addr];      // Read Operation
    end
endmodule

