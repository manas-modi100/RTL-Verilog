module sr_latch(input r, input s, output q, output p);
wire x,y;
//p=q'
nor(q,r,y);
nor(p,s,x);
assign x=q;
assign y=p;
endmodule

module sr_latch_tb();
reg r; reg s;
wire p; wire q;

sr_latch u1(.r(r), .s(s), .p(p), .q(q));
initial begin
	$dumpfile("latch.vcd");
	$dumpvars(-1,u1);
end
initial begin
s=1;r=0;#10;
s=0;r=0;#10;
s=0;r=1;#10;
s=0;r=0;#10;
//s=1;r=1;#10;
end
endmodule