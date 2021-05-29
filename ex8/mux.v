module mux(input0, input1, selector, outPut);

 input input0, input1, selector;
 output reg outPut;

 always @(selector)
  begin 
   if (selector == 1'b0)
    outPut <= input0;
   else
    outPut <= input1;
  end

endmodule 
