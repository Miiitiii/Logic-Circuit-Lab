module cpu();
wire [31:0]inst;
wire clk, pcout, reset, write, WriteData, ReadData1, ReadData2;
wire Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite;
wire result,zero;
wire pcin = 64'b0;

clock clock1(clk);

pc pc1(clk, pcin, pcout, reset, write);

instructionMem insMem1(clk, pcout, inst);

control ctrl(inst[6:0], ALUSrc, MemToReg, RegWrite, MemWrite, MemRead, Branch, ALUOp1, ALUOp0);

regBank regBank1(clk, inst[19:15], inst[24:20], inst[11:7], WriteData, RegWrite, ReadData1, ReadData2);

wire immgenoutput;
immGen immgen1(inst[31:0], immgenoutput);
wire mux1res;
mux mux1( ReadData2,immgenoutput, ALUSrc, mux1res);

wire ALU_Cnt;
aluControl alucontrol(ALU_Cnt,{ALUOp1, ALUOp0}, {inst[30:26]});

alu alu1(ReadData1,mux1res,ALU_Cnt,result,zero);

wire mux2res;
wire and1;
and(and1, Branch, zero);
mux mux2(pcout+4, pcout+immgenoutput, and1, mux2res); 
assign pcin = mux2res;

wire ReadData;
dataMem dataMemory(clk,result,ReadData,ReadData2,MemWrite,MemRead);

wire mux3res;
mux mux3(result, ReadData, MemToReg, mux3res);
assign WriteData = mux3res;

endmodule 