// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

	logic a, b;
	mux2 m1_MUX4 (
				.sel(sel[0]),
				.d1(d3),
				.d0(d2),
				.z(a)
	);
	mux2 m2_MUX4 (
				.sel(sel[0]),
				.d1(d1),
				.d0(d0),
				.z(b)
	);
	mux2 m3_MUX4 (
				.sel(sel[1]),
				.d1(a),
				.d0(b),
				.z(z)
	);

endmodule
