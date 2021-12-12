module dff_sr(input d, input clk, input rst, output reg q, output reg qbar);
always@(posedge clk)
begin
if (rst)
begin q<=0; qbar<=1; end
else
begin q<=d; qbar<=~d; end

end
endmodule
/*
module dff_sr_tb();
reg d,clk,rst; wire q,qbar;
dff_sr u1(.d(d), .clk(clk), .rst(rst), .q(q), .qbar(qbar));

initial begin
	$dumpfile("dffsr.vcd");
	$dumpvars(-1, u1);
end

always begin 
#10 clk = ~clk;
// test cases
#20 d<= $random;
end
initial begin
clk <= 0; d
<= 1;
rst <= 0;
#5 rst <= 1;
#15 rst <=0;
#15 d <= 0; 
#10 $finish;
end

endmodule
*/