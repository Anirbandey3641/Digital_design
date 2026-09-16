`timescale 1ns/1ps

module alu_16bit_tb;

reg [15:0] A;
reg [15:0] B;
reg [2:0]  op;

wire [15:0] out;
wire        carry;
wire        zero;
wire        sign;
wire        parity;

alu_16bit uut (
    .A(A),
    .B(B),
    .op(op),
    .out(out),
    .carry(carry),
    .zero(zero),
    .sign(sign),
    .parity(parity)
);

initial begin

    $monitor("Time=%0t A=%h B=%h op=%b out=%h carry=%b zero=%b sign=%b parity=%b",
             $time, A, B, op, out, carry, zero, sign, parity);

    // Addition
    A = 16'h000F;
    B = 16'h0001;
    op = 3'b000;
    #10;

    // Subtraction
    A = 16'h000F;
    B = 16'h0001;
    op = 3'b001;
    #10;

    // AND
    A = 16'hAAAA;
    B = 16'hCCCC;
    op = 3'b010;
    #10;

    // OR
    A = 16'hAAAA;
    B = 16'hCCCC;
    op = 3'b011;
    #10;

    // XOR
    A = 16'hAAAA;
    B = 16'hCCCC;
    op = 3'b100;
    #10;

    // NOT
    A = 16'hAAAA;
    B = 16'h0000;
    op = 3'b101;
    #10;

    // Increment
    A = 16'h000F;
    B = 16'h0000;
    op = 3'b110;
    #10;

    // Decrement
    A = 16'h000F;
    B = 16'h0000;
    op = 3'b111;
    #10;

    // Zero flag test
    A = 16'h000A;
    B = 16'h000A;
    op = 3'b001;
    #10;

    // Sign flag test
    A = 16'hFFFF;
    B = 16'h0001;
    op = 3'b000;
    #10;

    $finish;

end

endmodule
