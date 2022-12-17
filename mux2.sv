// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);
	logic a,b,c,d,e;
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g1_MUX2(
			.A(sel), 
			.B(sel), 
			.Z(a)
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g2_MUX2(
			.A(a), 
			.B(d0), 
			.Z(b)
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g3_MUX2(
			.A(b), 
			.B(b), 
			.Z(c)
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g4_MUX2(
			.A(sel), 
			.B(d1), 
			.Z(d)
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g5_MUX2(
			.A(d), 
			.B(d), 
			.Z(e)
	);
	OR2 #( 
			.Tpdhl(2),
			.Tpdlh(2)
	) g6_MUX2(
			.A(e), 
			.B(c), 
			.Z(z)
	);

endmodule
