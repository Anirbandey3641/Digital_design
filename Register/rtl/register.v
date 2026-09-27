`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 14:41:27
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input reset,
    input enable,
    input [15:0] data_in,
    output reg [15:0] data_out
);

always @(posedge clk) begin
    if (reset)
        data_out <= 16'b0;
    else if (enable)
        data_out <= data_in;
end
endmodule
