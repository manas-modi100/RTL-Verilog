//implement a 3 bit carry look ahead adder
module carry_look_ahead(input [2:0]a, input [2:0]b,
input c0, output [2:0]s, output cout);
wire p0,p1,p2; //a xor b
wire g0,g1,g2; //a and b
wire c1,c2;

xor(p0,a[0],b[0]);
and(g0,a[0],b[0]);
xor(p1,a[1],b[1]);
and(g1,a[1],b[1]);
xor(p2,a[2],b[2]);
and(g2,a[2],b[2]);

//1st full adder
xor(s[0],p0,c0);
assign c1=g0|c0&p0;

//2nd full adder
xor(s[1],p1,c1);
assign c2=g1|p1&c0|p1&p0&c0;

//3rd full adder
xor(s[2],p2,c2);
assign cout=g2|p2&g1|p2&p1&g0|p2&p1&p0&c0;
endmodule

module carry_look_ahead_tb();
reg [2:0]a;
 reg [2:0]b;
 reg c0;
wire [2:0]s;
wire cout;

carry_look_ahead u1(.a(a), .b(b), .c0(c0), .s(s), .cout(cout));

initial begin
	$dumpfile("carry_adder.vcd");
	$dumpvars(-1,u1);
end

initial begin
a=3'b000;b=3'b000;c0=1'b0;#10;
a=3'b000;b=3'b000;c0=1'b1;#10;
a=3'b001;b=3'b000;c0=1'b0;#10;
a=3'b000;b=3'b001;c0=1'b1;#10;
a=3'b101;b=3'b101;c0=1'b0;#10;
a=3'b101;b=3'b101;c0=1'b1;#10;
a=3'b111;b=3'b000;c0=1'b0;#10;
a=3'b000;b=3'b111;c0=1'b1;#10;
a=3'b111;b=3'b111;c0=1'b0;#10;
a=3'b111;b=3'b111;c0=1'b1;#10;
end
endmodule