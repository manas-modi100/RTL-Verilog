module dff(input d, input clk, output reg q, qbar);
always@(posedge clk)
begin
q<=d;
qbar<= ~d;
end

endmodule

module dff_tb();
reg d, clk; wire q, qbar;
dff u1(.d(d), .clk(clk), .q(q), .qbar(qbar));
initial begin
	$dumpfile("dff_wr.vcd");
	$dumpvars(-1, u1);
end
always begin
clk= ~clk;#5;
end
initial begin
clk=0;d=1;#10;
d=0;#10;
d=1;#10;
#30 $finish;
end
endmodule