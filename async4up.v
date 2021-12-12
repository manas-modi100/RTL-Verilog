module aysnc4up(input [3:0]j, input [3:0]k, input clk, input rst, output [3:0]q);
wire [3:0]qbar;
jk_sr u1(j[0], k[0], clk, rst, q[0], qbar[0]);
jk_sr u2(j[1], k[1], q[0], rst, q[1], qbar[1]);
jk_sr u3(j[2], k[2], q[1], rst, q[2], qbar[2]);
jk_sr u4(j[3], k[3], q[2], rst, q[3], qbar[3]);

endmodule

module aysnc4up_tb();
reg [3:0]j; reg[3:0]k; reg clk; reg rst; wire [3:0]q;
aysnc4up dev(.j(j), .k(k), .clk(clk), .rst(rst), .q(q));
initial begin
	$dumpfile("4bitup.vcd");
	$dumpvars(-1,dev);
end

always begin
clk=~clk;#5;
end

initial begin
rst=1;rst=0;
j=4'b1111;k=4'b1111; rst=1;clk=0;#5;
rst=0;j=4'b1111;k=4'b1111;#160;
#10 $finish;
end

endmodule