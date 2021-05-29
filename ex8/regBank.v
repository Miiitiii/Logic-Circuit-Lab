module regBank(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2);

 input clk,ReadRegister1,ReadRegister2,WriteRegister,WriteData,RegWrite;
 
 output [63:0]ReadData1;
 output [63:0]ReadData2;

 integer i =0;
 reg [63:0]registers[0:31];
parameter delay = 5;

initial begin
        //two number for add	
		registers[1] <= 64'h000000001; 
		registers[2] <= 64'h000000011;

end
 
 always@(posedge clk)
  begin
   begin
    if (RegWrite)
     registers[WriteRegister] <= WriteData;
   end
  end


 assign #delay ReadData1 = registers[ReadRegister1];
 assign #delay ReadData2 = registers[ReadRegister2];

endmodule 