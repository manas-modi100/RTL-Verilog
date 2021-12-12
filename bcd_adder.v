module bcd_adder(input [3:0]a, input [3:0]b, input c0, output [3:0]s, output cout);
wire [3:0]z;
wire k, carry,c1;
wire [3:0]y;
assign c1=0;
adder_4bit m1(a, b, c0, z, k);
assign cout= k|z[3]&z[2]|z[3]&z[1];
assign y[0] =0;
assign y[3] =0;
assign y[2] =cout;
assign y[1] =cout;
//adder_4bit m2([3:0]y, [3:0]z, c1, [3:0]s, carry);
adder_4bit m2(y, z, c1, s, carry);

endmodule

module bcd_adder_tb();
reg [3:0]a; reg [3:0]b; reg c0; wire [3:0]s; wire cout;

bcd_adder u1(.a(a), .b(b), .c0(c0), .s(s), .cout(cout));

initial begin
	$dumpfile("bcd.vcd");
	$dumpvars(-1, u1);
end

initial begin
a=4'b0000;b=4'b0000;c0=1'b0;#10;
a=4'b0110;b=4'b1001;c0=1'b0;#10;
a=4'b0011;b=4'b0011;c0=1'b1;#10;
a=4'b0100;b=4'b0101;c0=1'b0;#10;
a=4'b1000;b=4'b0010;c0=1'b0;#10;
a=4'b1001;b=4'b1001;c0=1'b1;#10;
end
endmodule