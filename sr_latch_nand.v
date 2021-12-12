module sr_latch_nand(input s, input r, output q, output p);
wire x,y;
//p=q'
nand(q,s,y);
nand(p,r,x);
assign x=q;
assign y=p;
endmodule

module sr_latch_nand_tb();
reg r; reg s;
wire p; wire q;

sr_latch_nand u1(.r(r), .s(s), .p(p), .q(q));
initial begin
	$dumpfile("latch_nand.vcd");
	$dumpvars(-1,u1);
end
initial begin
s=1;r=0;#10;
s=1;r=1;#10;
s=0;r=1;#10;
s=1;r=1;#10;
//s=0;r=0;#10;
end
endmodule