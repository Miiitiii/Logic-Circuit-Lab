module aluControl( ALU_Cnt, ALUOp, ins);
 output reg[3:0] ALU_Cnt;
 input [1:0] ALUOp;
 input ins;
 wire [5:0] ALUControlIn;
 assign ALUControlIn = {ALUOp,ins};
 always @(ALUControlIn)
 casex (ALUControlIn)
   6'b00xxxx: ALU_Cnt=4'b0010;
   6'bx1xxxx: ALU_Cnt=4'b0110;
   6'b1x0000: ALU_Cnt=4'b0010;
   6'b1x1000: ALU_Cnt=4'b0110;
   6'b1x0111: ALU_Cnt=4'b0000;
   6'b1x0110: ALU_Cnt=4'b0001;
  default: ALU_Cnt=4'b0010;
  endcase
endmodule