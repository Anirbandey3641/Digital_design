`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 22:06:32
// Design Name: 
// Module Name: decoder
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


module decoder(
  input a,
  input b,
  output o1,
  output o2,
  output o3,
  output o4
);
  assign o1= (~a) & (~b);
  assign o2= (~a) & b;
  assign o3= a & (~b);
  assign o4= a & b;
endmodule
