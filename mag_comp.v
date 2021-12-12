module mag_comp(input [3:0]a, input [3:0]b, output aeqb, output agb, output alb);
wire [3:0]x;
xnor(x[0],a[0],b[0]);
xnor(x[1],a[1],b[1]);
xnor(x[2],a[2],b[2]);
xnor(x[3],a[3],b[3]);
//a equal b condition
and(aeqb,x[0],x[1],x[2],x[3]);
//a greater than b condition
assign agb = a[3]&(~b[3]) | x[3]&a[2]&(~b[2]) | x[3]&x[2]&a[1]&(~b[1]) | x[3]&x[2]&x[1]&a[0]&(~b[0]);
//a less than b condition
assign alb = b[3]&(~a[3]) | x[3]&b[2]&(~a[2]) | x[3]&x[2]&b[1]&(~a[1]) | x[3]&x[2]&x[1]&b[0]&(~a[0]);
endmodule

module mag_comp_tb();
reg [3:0]a; reg [3:0]b; 
wire aeqb, agb, alb;
mag_comp u1(.a(a), .b(b), .aeqb(aeqb), .agb(agb), .alb(alb));

initial begin
	$dumpfile("compare.vcd");
	$dumpvars(-1,u1);
end

initial begin
a=4'b1100;b=4'b1100;#10;
a=4'b0100;b=4'b1100;#10;
a=4'b1111;b=4'b1100;#10;
a=4'b0000;b=4'b0000;#10;

end
endmodule