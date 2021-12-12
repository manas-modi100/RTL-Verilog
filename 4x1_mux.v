module mux_4to1(i0,i1,i2,i3,s0,s1,out);
input i0,i1,i2,i3,s0,s1;
output out;
wire x,y;

mux_2to1 dev1(i0,i1,s1,x);
mux_2to1 dev2(i2,i3,s1,y);
mux_2to1 dev3(x,y,s0,out);
endmodule
/*
module mux_4to1_tb();
reg i0,i1,i2,i3,s1,s0;
wire out;

mux_4to1 dev(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s1(s1), .s0(s0), .out(out));
initial begin
	$dumpfile("test1.vcd");
	$dumpvars(-1,dev);
end

initial begin
i3=1;i2=1;i1=0;i0=1;s0=0;s1=1;#10;
i3=0;i2=0;i1=1;i0=0;s0=0;s1=1;#10;
i3=0;i2=1;i1=0;i0=0;s0=1;s1=0;#10;
i3=1;i2=0;i1=0;i0=0;s0=1;s1=1;#10;
i3=0;i2=0;i1=0;i0=1;s0=0;s1=0;#10;
end
endmodule */