module Registers(instruction,writedata,readdata1,readdata2,regwrite,clock,regdst);
input [31:0] instruction;
input clock,regwrite,regdst;
input [63:0]writedata;
output [63:0] readdata1,readdata2;

reg [4:0] readregister1 ;
reg [4:0] readregister2;
reg [4:0] writeregister;
reg [63:0] registers;

always @(regdst)begin
if(regdst)begin
    writeregister = instruction[15:11];
end else begin
    writeregister = instruction[20:16];
end
end

always @(posedge clock) begin
if(regwrite == 1)
 registers[regwrite]=writedata;
end
endmodule