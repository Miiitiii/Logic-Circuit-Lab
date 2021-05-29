module instructionMem( clk, address, instruction );
 input clk;
 input [63:0] address;
 output reg[31:0] instruction ;
 integer i =0;
 reg [31:0]memory[0:1023];
initial begin
	
		memory[0] <= 32'b00000000001000001000000110110011;
	end
 always@(posedge clk)
   begin
    instruction = memory[address];
   end
endmodule