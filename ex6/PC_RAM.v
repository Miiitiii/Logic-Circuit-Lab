module PC_RAM();

	reg enable, reset, load, dir, leftInput, rightInput;
	reg [63:0] in;
	wire [63:0] reg_out, adder_out, ram_out;
	wire Clock;

	clock_generator CLG(Clock);

	CLAFullAdder64b adder(.Cin(0), .A(ram_out), .B({0, 4}), .Sum(adder_out));
	ShiftRegister shReg(.Enable(enable), .Reset(reset), .Load(load), .Input(adder_out), .Dir(dir), .LeftInput(leftInput), .RightInput(rightInput), .Clock(Clock), .Q(reg_out));
	defparam shReg.n = 64;
	RAM ram(reg_out, ram_out);

	initial begin
		enable = 0;
		reset = 0;
		load = 1;
		dir = 1;
		leftInput = 1;
		rightInput = 1;
		#20 $display("initial register's bits: %b", reg_out);
		reset = 1;
		#20 $display("register's bits after reset: %b", reg_out);
		reset = 0;
		$display("start counting:");
		$display("Register: %d", reg_out);
		#20 $display("Register: %d", reg_out);
		#20 $display("Register: %d", reg_out);
		#20 $display("Register: %d", reg_out);
		#20 $display("Register: %d", reg_out);
		#20 $display("Register: %d", reg_out);
		
	end

endmodule