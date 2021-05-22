module immgen(instruction,outreg);
input [31:0]instruction;
output reg [63:0] outreg;

always @(instruction)
  casex(instruction[6:0])
    7'b0010011: outreg = {{53{instruction[31]}},instruction[30:20]};
    7'b0000011: outreg = {{53{instruction[31]}},instruction[30:20]};
    7'b0100011: outreg = {{53{instruction[31]}},instruction[30:25],instruction[11:7]};
    7'b1100011: outreg = {{52{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],0};


endcase
endmodule