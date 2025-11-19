typedef enum logic [2:0] {
  ALU_ADD   = 3'b000,
  ALU_SUB   = 3'b001,
  ALU_AND   = 3'b010,
  ALU_OR    = 3'b011,
  ALU_XOR   = 3'b100,
  ALU_SLT   = 3'b101 // Set less than (signed)
} alu_op_e;


module ALU(parameter int N=32) (
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input alu_op_e op, //op signal with enum type(alu_op_e)
    output logic [N-1:0] RESULT
);
     always_comb begin
    unique case (op)
      ALU_ADD:   RESULT = A + B;
      ALU_SUB:   RESULT = A - B;
      ALU_AND:   RESULT = A & B;
      ALU_OR:    RESULT = A | B;
      ALU_XOR:   RESULT = A ^ B;
      ALU_SLT:   RESULT = ($signed(A) < $signed(B)) ? '1 : '0;
      default:   RESULT = '0;
    endcase
    zero = (RESULT == '0);
  end
