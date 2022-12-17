// 64-bit ALU test bench template
module alu1bit_test;
	logic  a;    // Input bit a
	logic  b;    // Input bit b
	logic cin;         // Carry in
	logic [1:0] op;    // Operation
	logic  s;    // Output S
	logic cout;	       // Carry out
	
	alu1bit alu1bit_gate(
						.a(a),
						.b(b),
						.cin(cin),
						.op(op),
						.s(s),
						.cout(cout)
	);
	
	initial begin
		a = 0;
		b = 0;
		cin = 0;
		op[0] = 1;
		op[1] = 0;
		
		#100
		
		
		a = 1;
		b = 0;
		cin = 0;
		op[0] = 1;
		op[1] = 0;
	
	end
		
endmodule
