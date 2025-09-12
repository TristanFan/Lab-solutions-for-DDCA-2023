module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] AluOp,        
    output reg [31:0] Result,
    output C,                 // carry out
    output zero               // zero flag
);

    wire [31:0] op1;
    wire [31:0] adder_out;
    wire carry_out;
    wire [31:0] logic_result;
    wire [31:0] arith_out;
    wire [31:0] signed_extend;

    // 1. MUX: Select B or ~B
    assign op1 = AluOp[1] ? ~B : B;

    // 2. Adder/Subtractor
    assign {carry_out, adder_out} = A + op1 + AluOp[1];

    // 3. Sign extension
    assign signed_extend = {31'b0, adder_out[31]};

    // 4. Arithmetic output select
    assign arith_out = AluOp[3] ? signed_extend : adder_out;

    // 5. Logic operations
    assign logic_result =
        (AluOp[1:0] == 2'b00) ? (A & B) :
        (AluOp[1:0] == 2'b01) ? (A | B) :
        (AluOp[1:0] == 2'b10) ? (A ^ B) :
        ~(A | B); // NOR

    // 6. Final MUX: Arithmetic or Logic
    always @(*) begin
        Result = AluOp[2] ? logic_result : arith_out;
    end

    // 7. Flags
    assign C = carry_out;
    assign zero = (Result == 32'b0);

endmodule
