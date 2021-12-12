module sync4up(input t, input clk, input rst, output [3:0]q);
wire [3:0]qbar; wire t1,t2;
jk_sr u1(t, t, clk, rst, q[0], qbar[0]);
jk_sr u2(q[0], q[0], clk, rst, q[1], qbar[1]); and(t1,q[0], q[1]);
jk_sr u3(t1, t1, clk, rst, q[2], qbar[2]); and(t2, t1, q[2]);
jk_sr u4(t2, t2, clk, rst, q[3], qbar[3]);

endmodule

module tb();
reg t; reg clk; reg rst; wire [3:0]q;
sync4up dev(.t(t), .clk(clk), .rst(rst), .q(q));

initial begin
	$dumpfile("up4.vcd");
	$dumpvars(-1, dev);
end

always begin
clk=~clk;#5;
end
initial begin
rst=1;rst=0;
t=1;clk=0; rst=1;#5;
rst=0;t=1;#160;
#10 $finish;
end

endmodule