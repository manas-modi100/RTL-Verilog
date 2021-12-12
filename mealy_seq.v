module seq(input x, input clk, input rst, output y); //sequence detector 10101 using mealy machine and overlap mechanism
wire [2:0]t; wire [2:0]tc; wire p1, p2, p3; wire q1, q2, q3,xcomp, r1;
assign xcomp = ~x;
and(p1,t[2],tc[1],tc[0],x); and(p2,tc[2],x); or(p3,p1,p2);
dff_sr u0(p3,clk,rst,t[0],tc[0]);
and(q1,tc[2],tc[1],t[0],xcomp); and(q2,tc[2],t[1],tc[0],x); or(q3, q1,q2,p1);
dff_sr u1(q3,clk,rst,t[1],tc[1]);
and(r1,tc[2], t[1], t[0], xcomp);
dff_sr u2(r1,clk,rst,t[2],tc[2]);
assign y = p1;


endmodule

module tb();
reg x;reg clk; reg rst; wire y;
seq dev(.x(x), .clk(clk), .rst(rst), .y(y));
initial begin
	$dumpfile("mealy.vcd");
	$dumpvars(-1, dev);
end
always begin
clk=~clk;#5;
end
initial begin
x=1'b0;
rst=1'b0;rst=1'b1;#5;
clk=1'b0; rst=1'b0;#5;
x=1'b1;#10;
x=1'b0;#10;
x=1'b1;#10;
x=1'b0;#10;
x=1'b1;#10;
x=1'b0;#10;
x=1'b1;#10;
#10 $finish;
end

endmodule 