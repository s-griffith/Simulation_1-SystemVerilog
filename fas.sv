// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);
	logic [6:0] v;
	XNOR2 #(
			.Tpdhl(3),
			.Tpdlh(3)
	) g1_FAS(
			.A(b),
			.B(a),
			.Z(v[0])
	);
	XNOR2 #(
			.Tpdhl(3),
			.Tpdlh(3)
	) g2_FAS(
			.A(cin),
			.B(v[0]),
			.Z(s)
	);
	NAND2 #(
			.Tpdhl(4),
			.Tpdlh(4)
	) g3_FAS(
			.A(cin),
			.B(b),
			.Z(v[1])
	);
	NAND2 #(
			.Tpdhl(4),
			.Tpdlh(4)
	) g4_FAS(
			.A(v[1]),
			.B(v[1]),
			.Z(v[2])
	);
	OR2 #(
		.Tpdhl(2),
		.Tpdlh(2)
	) g5_FAS(
		.A(b),
		.B(cin),
		.Z(v[3])
	);
	XNOR2 #(
			.Tpdhl(3),
			.Tpdlh(3)
	) g6_FAS(
			.A(a),
			.B(a_ns),
			.Z(v[4])
	);
	NAND2 #(
			.Tpdhl(4),
			.Tpdlh(4)
	) g7_FAS(
			.A(v[4]),
			.B(v[3]),
			.Z(v[5])
	);
	NAND2 #(
			.Tpdhl(4),
			.Tpdlh(4)
	) g8_FAS(
			.A(v[5]),
			.B(v[5]),
			.Z(v[6])
	);
	OR2 #(
		.Tpdhl(2),
		.Tpdlh(2)
	) g9_FAS(
		.A(v[6]),
		.B(v[2]),
		.Z(cout)
	);

endmodule
