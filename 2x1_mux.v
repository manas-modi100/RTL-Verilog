module mux_2to1(i0,i1,sel,out); // declaring 2x1 multiplexer module 
input i0,i1,sel; //defining input ports
/*   output reg out; // defining output ports as register to use always
always@(i0,i1,sel) //always statement for implementation of ckt on a given event(i0 or i1 or sel change levels)
begin
if(sel)
out=i1;
else
out=i0;
end*/
output out;//defining output ports
assign out=(sel==0)?i0:i1;
endmodule


/*module mux_2to1_tb();//testbench
reg i0,i1,sel;
wire out;
mux_2to1 sample(i0,i1,sel,out);//instantiation

initial begin
	$dumpfile("test.vcd");
	$dumpvars(-1,sample);
end

initial begin
i0=0;i1=0;sel=0;#10;
i0=0;i1=1;sel=0;#10;
i0=1;i1=0;sel=0;#10;
i0=1;i1=1;sel=0;#10;
i0=0;i1=0;sel=1;#10;
i0=0;i1=1;sel=1;#10;
i0=1;i1=0;sel=1;#10;
i0=1;i1=1;sel=1;#10;
end
endmodule
*/