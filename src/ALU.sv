module ALU(
    input logic [31:0] A,
    input logic [3:0] B,
    input logic [1:0] SEL,
    output logic [31:0] RESULT
);
    always_comb begin
        case (SEL)
            32'h00000000: RESULT = A + B;        // Addition
            32'h0000FFFF: RESULT = A - B;        // Subtraction
            32'hFFFF0000: RESULT = A & B;        // AND operation
            32'hFFFFFFFF: RESULT = A | B;        // OR operation
            default: RESULT = 32'b00000000000000000000000000000000;
        endcase
    end 