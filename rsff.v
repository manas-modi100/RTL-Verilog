module rsf(input s, input r, input clk, output reg q, output reg qbar);
always@(posedge clk)
begin
if(s==0 && r==0)
begin
q<=q;
qbar<=qbar;
end
else if (s==1)
begin 
q<=1;
qbar<=0;
end
else if (r==1)
begin 
q<=0;
qbar<=1;
end
end
endmodule

module rsf_tb();
reg s,r,clk; wire q,qbar;
rsf u1(.s(s), .r(r), .clk(clk), .q(q), .qbar(qbar));

initial begin 
	$dumpfile("rsf_wr.vcd");
	$dumpvars(-1, u1);
end

always begin
clk= ~clk;#5;
end
initial begin
s=0;r=0;clk=0;#10;
s=1;r=0;#10;
s=0;r=1;#10;
s=0;r=0;#10;
#10 $finish;
end
endmodule