module alucontrol(instruction,aluop,control);
input [31:0] instruction;
input [1:0] aluop;
output reg [3:0] control;
wire [6:0] fun7;
wire [2:0] fun3;
assign fun3 = instruction[14:12];
assign fun7 = instruction[31:25];

always @(aluop)
casex(aluop)
  2'b00:control <= 4'b0010;
  2'b01:control <= 4'b0110;
  2'b10:begin
    casex({fun7,fun3})
      10'b0000000000:control <= 4'b0010;
      10'b0100000000:control <= 4'b0110;
      10'b0000000111:control <= 4'b0000;
      10'b0000000110:control <= 4'b0001;
      default:control <= 4'bxxxx;
endcase
end
default:control <= 4'bxxxx;
endcase
        

endmodule 