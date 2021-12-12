module adder_4bit(input [3:0]x,input [3:0]y,input cin,
output [3:0]s, output cout);

wire p,q,r;

full_adder m1(x[0], y[0], cin, s[0], p);
full_adder m2(x[1], y[1], p, s[1], q);
full_adder m3(x[2], y[2], q, s[2], r);
full_adder m4(x[3], y[3], r, s[3], cout);

endmodule

/*
module adder_4bit_tb();
reg [3:0]x;reg [3:0]y;reg cin;
wire [3:0]s; wire cout;
//adder_4bit u1(.[3:0]x([3:0]x),.[3:0]y([3:0]y),.cin(cin),.[3:0]s([3:0]s),.cout(cout));
adder_4bit ua(.x(x),.y(y),.cin(cin),.s(s),.cout(cout));
initial begin
	$dumpfile("add.vcd");
	$dumpvars(-1,ua);
end

initial begin
x=4'b0000;y=4'b0000;cin=1'b0;#0;
x=4'b0100;y=4'b0011;cin=1'b1;#10;
x=4'b0011;y=4'b0111;cin=1'b1;#20;
x=4'b1000;y=4'b0100;cin=1'b0;#30;
x=4'b0101;y=4'b0101;cin=1'b1;#40;
end
endmodule
*/