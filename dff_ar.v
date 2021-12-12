module dff_sr(input d, input clk, input rst, output reg q, output reg qbar);

always@(posedge clk or posedge rst)
begin
//t12 <= d ? 1'b1:1'b0;
if(rst)
begin  q<=0; qbar<=1; end
else if (!rst)
begin 
q<=d;
qbar<=~d;
 end

end
endmodule

/* module dff_ar_tb();
reg d,clk,rst; wire q,qbar;
dff_sr u1(.d(d), .clk(clk), .rst(rst), .q(q), .qbar(qbar));

initial begin
	$dumpfile("dffar.vcd");
	$dumpvars(-1, u1);
end

always begin
clk=~clk;#5;
end

initial begin 
d=1;rst=1;clk=0;#10;
d=1;rst=0;#10;
d=0;rst=0;#10;
d=1;rst=0;#10;
d=1;rst=0;#5;
d=0;rst=0;#5;
#60 $finish;
end

endmodule
*/