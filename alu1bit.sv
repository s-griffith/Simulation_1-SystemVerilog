// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);
	logic [5:0] v;
	NAND2 #(
			.Tpdlh(4),
			.Tpdhl(4)
	) g1_ALU1BIT(
				.A(op[0]),
				.B(op[0]),
				.Z(v[0])
	);
	fas fas_gate(
		.a(a),
		.a_ns(v[0]),
		.b(b),
		.cin(cin),
		.cout(cout),
		.s(v[1])
	);
	XNOR2 #(
			.Tpdhl(3),
			.Tpdlh(3)
	) g2_ALU1BIT(
				.A(a),
				.B(b),
				.Z(v[2])
	);
	NAND2 #(
			.Tpdlh(4),
			.Tpdhl(4)
	) g3_ALU1BIT(
				.A(v[2]),
				.B(v[2]),
				.Z(v[3])
	);
	OR2 #(
			.Tpdlh(2),
			.Tpdhl(2)
	) g4_ALU1BIT(
				.A(a),
				.B(b),
				.Z(v[4])
	);
	NAND2 #(
			.Tpdlh(4),
			.Tpdhl(4)
	) g5_ALU1BIT(
				.A(v[4]),
				.B(v[4]),
				.Z(v[5])
	);
	mux4 mux4_gate(
				.d0(v[5]),
				.d1(v[3]),
				.d2(v[1]),
				.d3(v[1]),
				.sel(op),
				.z(s)
	);

endmodule
