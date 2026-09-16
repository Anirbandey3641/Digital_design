module alu_16bit (
    input  [15:0] A,
    input  [15:0] B,
    input  [2:0]  op,

    output reg [15:0] out,
    output reg        carry,
    output reg        zero,
    output reg        sign,
    output reg        parity
);

always @(*) begin

    case(op)

        // Addition
        3'b000: begin
            {carry, out} = A + B;
        end

        // Subtraction
        3'b001: begin
            {carry, out} = A - B;
        end

        // AND
        3'b010: begin
            out = A & B;
        end

        // OR
        3'b011: begin
            out = A | B;
        end

        // XOR
        3'b100: begin
            out = A ^ B;
        end

        // NOT A
        3'b101: begin
            out = ~A;
        end

        // Increment A
        3'b110: begin
            {carry, out} = A + 1;
        end

        // Decrement A
        3'b111: begin
            {carry, out} = A - 1;
        end

        // Default
        default: begin
            out = 16'b0;
            carry = 1'b0;
        end

    endcase

    // Flags
    zero   = ~( |out );
    sign   = out[15];
    parity = ~^out;

end

endmodule
