`timescale 1ns / 1ps

module alu16(
    input  [15:0] A,
    input  [15:0] B,
    input  [3:0]  ALU_Sel,

    output reg [15:0] ALU_Out,
    output reg        Carry,
    output reg        Overflow,
    output            Zero
);
reg [16:0] Temp;

always @(*) begin

    // Default values
    ALU_Out = 16'd0;
    Carry   = 1'b0;
    Overflow = 1'b0;
    Temp    = 17'd0;

    case(ALU_Sel)

        // Addition
        4'b0000: begin
            Temp = {1'b0, A} + {1'b0, B};
            ALU_Out = Temp[15:0];
            Carry = Temp[16];

            // Signed overflow
            Overflow = (~(A[15] ^ B[15])) &
                       (ALU_Out[15] ^ A[15]);
        end

        // Subtraction
        4'b0001: begin
            ALU_Out = A - B;

            // Borrow indication
            Carry = (A < B);

            // Signed overflow
            Overflow = (A[15] ^ B[15]) &
                       (ALU_Out[15] ^ A[15]);
        end

        // AND
        4'b0010: begin
            ALU_Out = A & B;
        end

        // OR
        4'b0011: begin
            ALU_Out = A | B;
        end

        // XOR
        4'b0100: begin
            ALU_Out = A ^ B;
        end

        // NOT
        4'b0101: begin
            ALU_Out = ~A;
        end

        // Left Shift
        4'b0110: begin
            Carry = A[15];
            ALU_Out = A << 1;
        end

        // Right Shift
        4'b0111: begin
            Carry = A[0];
            ALU_Out = A >> 1;
        end

        // Compare
        4'b1000: begin
            ALU_Out = (A < B) ? 16'd1 : 16'd0;
        end

        default: begin
            ALU_Out = 16'd0;
        end

    endcase
end

assign Zero = (ALU_Out == 16'd0);

endmodule
