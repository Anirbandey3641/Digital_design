`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 22:22:58
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder;
  reg a,b;
  wire o1,o2,o3,o4;
  decoder uut(
    .a(a),
    .b(b),
    .o1(o1),
    .o2(o2),
    .o3(o3),
    .o4(o4)
   );
   initial begin 
     a=0;b=0;#10;
     a=0;b=1;#10;
     a=1;b=0;#10;
     a=1;b=1;#10;
     $finish;
    end
endmodule
