// Full Adder/Subtractor test bench template
module fas_test;
	logic a,b,cin,a_ns,s,cout;
	fas FAS_gate(
			.a(a),
			.b(b),
			.cin(cin),
			.a_ns(a_ns),
			.s(s),
			.cout(cout)
	);
	
	initial begin
		a = 0;
		b = 1;
		cin = 0;
		a_ns = 0;
		
		#20
		
		a = 1;
		b = 1;
		cin = 0;
		a_ns = 0;
		
		#20
		
		a = 0;
		b = 1;
		cin = 0;
		a_ns = 0;
		
		#20
		
		a = 0;
		b = 1;
		cin = 0;
		a_ns = 1;
		
		#20
		
		a = 0;
		b = 1;
		cin = 0;
		a_ns = 0;
		
	end
		
endmodule
