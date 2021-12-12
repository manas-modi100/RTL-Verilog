module SISO(input clk, input din, input rst, output q);
wire [7:0]t;
dff_sr m1(clk, din, rst, t[0], t[3]);
dff_sr m2(clk, t[0], rst, t[1], t[4]);
dff_sr m3(clk, t[1], rst, t[2], t[5]);
dff_sr m4(clk, t[2], rst, q, t[7]);

endmodule

module dff_sr(input clk, input d, input rst, output reg q, output reg qbar);
always@(posedge clk or posedge rst)
begin
if (rst) begin
q<=0; qbar<=1;  end

else begin
q<=d; qbar<=~d;
end

end

endmodule

module SISO_tb();
reg clk, din, rst; wire q;
SISO u1(.clk(clk), .din(din), .rst(rst), .q(q));
initial begin
	$dumpfile("siso.vcd");
	$dumpvars(-1, u1);
end

always begin
clk=~clk;#5;
end
initial begin
clk=0; rst=0; din=0;
rst=1;#5;
rst=0;#5;
din=1;#10;
din=0;#10;
din=0;#10;
din=1;#10;
din=0;#10;
#120 $finish;
end

endmodule