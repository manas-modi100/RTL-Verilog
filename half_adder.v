module half_adder(x,y,s,c);
input x,y;
output s,c;

assign s=x^y;
assign c=x&y;
endmodule
/*
module half_adder_tb();
reg x,y;
wire s,c;
half_adder u1(.x(x), .y(y), .s(s), .c(c));

initial begin
	$dumpfile("ha.vcd");
	$dumpvars(-1, u1);
end
initial begin
x=0;y=0;#100;
x=1;y=0;#100;
x=0;y=1;#100;
x=1;y=1;#100;
end
endmodule
*/