// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);
	logic [4:0] v;
	NAND2 #(				//used as NOT gate
			.Tpdhl(4),
			.Tpdlh(4)
	) g1_MUX2(
			.A(sel), 
			.B(sel), 
			.Z(v[0])
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g2_MUX2(
			.A(v[0]), 
			.B(d0), 
			.Z(v[1])
	);
	NAND2 #(				//used as NOT gate
			.Tpdhl(4),
			.Tpdlh(4)
	) g3_MUX2(
			.A(v[1]), 
			.B(v[1]), 
			.Z(v[2])
	);
	NAND2 #( 
			.Tpdhl(4),
			.Tpdlh(4)
	) g4_MUX2(
			.A(sel), 
			.B(d1), 
			.Z(v[3])
	);
	NAND2 #(				//used as NOT gate 
			.Tpdhl(4),
			.Tpdlh(4)
	) g5_MUX2(
			.A(v[3]), 
			.B(v[3]), 
			.Z(v[4])
	);
	OR2 #( 
			.Tpdhl(2),
			.Tpdlh(2)
	) g6_MUX2(
			.A(v[4]), 
			.B(v[2]), 
			.Z(z)
	);

endmodule
