module pc(PCNext, PCResult, Reset, Clk,PCWrite);

	input       [63:0]  PCNext;
	input               Reset, Clk,PCWrite;

	output reg  [63:0]  PCResult;


	initial begin
	
		PCResult <= 64'h000000000;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    	begin
    		PCResult <= 64'h000000000;
    	end
    	else
    	begin
			if (PCWrite == 1) begin
				PCResult <= PCNext;
			end
    	end

		
    end

endmodule