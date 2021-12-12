module jk_sr(input j, input k, input clk, input rst, output reg q, output reg qbar);
always@(negedge clk or posedge rst)
begin
if (rst)
begin q<=0; qbar<=1; end
else begin
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
end

endmodule
/*
module jk_sr_tb();
reg j, k, clk, rst; wire q, qbar;
jk_sr u1(.j(j), .k(k), .clk(clk), .rst(rst), .q(q), .qbar(qbar));

initial begin
	$dumpfile("jkfsr.vcd");
	$dumpvars(-1, u1);
end

always begin
clk=~clk;#5;
end
initial begin
clk=0;rst=0;j=0;k=0;
rst=1;#5; rst=0;#5;
j=0;k=0;#10;
j=0;k=1;#10;
j=1;k=0;#10;
j=1;k=1;#10;
#20 $finish;
end

endmodule
*/