`timescale 1ns / 1ps

module alu16_tb;

reg [15:0] A;
reg [15:0] B;
reg [3:0] ALU_Sel;

wire [15:0] ALU_Out;
wire Carry;
wire Overflow;
wire Zero;

alu16 uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Carry(Carry),
    .Overflow(Overflow),
    .Zero(Zero)
);

initial begin

    // Display results in simulator console
    $monitor("Time=%0t | A=%h | B=%h | Sel=%b | Out=%h | Carry=%b | Overflow=%b | Zero=%b",
             $time, A, B, ALU_Sel, ALU_Out, Carry, Overflow, Zero);

    // --------------------------------
    // Basic Operations
    // --------------------------------

    A = 16'd20;
    B = 16'd10;

    // Addition
    ALU_Sel = 4'b0000;
    #10;

    // Subtraction
    ALU_Sel = 4'b0001;
    #10;

    // AND
    ALU_Sel = 4'b0010;
    #10;

    // OR
    ALU_Sel = 4'b0011;
    #10;

    // XOR
    ALU_Sel = 4'b0100;
    #10;

    // NOT
    ALU_Sel = 4'b0101;
    #10;

    // Left Shift
    ALU_Sel = 4'b0110;
    #10;

    // Right Shift
    ALU_Sel = 4'b0111;
    #10;

    // Compare
    ALU_Sel = 4'b1000;
    #10;


    // --------------------------------
    // Carry Test
    // --------------------------------

    A = 16'hFFFF;
    B = 16'h0001;
    ALU_Sel = 4'b0000;
    #10;


    // --------------------------------
    // Signed Overflow Test
    // 7FFF + 0001 = 8000
    // --------------------------------

    A = 16'h7FFF;
    B = 16'h0001;
    ALU_Sel = 4'b0000;
    #10;


    // --------------------------------
    // Subtraction Borrow Test
    // 0000 - 0001
    // --------------------------------

    A = 16'h0000;
    B = 16'h0001;
    ALU_Sel = 4'b0001;
    #10;


    // --------------------------------
    // Zero Test
    // --------------------------------

    A = 16'h0000;
    B = 16'h0000;
    ALU_Sel = 4'b0010;
    #10;


    // --------------------------------
    // Shift Carry Test
    // --------------------------------

    A = 16'h8001;
    B = 16'h0000;

    // Left shift
    ALU_Sel = 4'b0110;
    #10;

    // Right shift
    ALU_Sel = 4'b0111;
    #10;


    $finish;

end

endmodule
