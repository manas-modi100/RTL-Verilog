module jk(input j,input k,input clk, output reg q, output reg qbar);
always@(posedge clk)
begin
if (j==0 && k==0)
begin
q<=q;
qbar<=qbar;
end
else if (j==0 && k==1)
begin
q<=0; qbar<=1;
end 
else if (j==1 && k==0)
begin 
q<=1; qbar<=0;
end
else 
begin 
q<=~q;
qbar<=~qbar;
end
end
endmodule

module jk_tb();
reg j,k,clk; wire q, qbar;
jk u1(.j(j), .k(k), .clk(clk), .q(q), .qbar(qbar));
initial begin
	$dumpfile("jk.vcd");
	$dumpvars(-1, u1);
end

always begin
clk=~clk;#5;
end
initial begin
j=1;k=0; clk=0;#10;
j=0;k=0;#10;
j=0;k=1;#10;
j=1;k=1;#10;
#40 $finish;
end
endmodule