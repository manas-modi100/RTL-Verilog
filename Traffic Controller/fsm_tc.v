module FSM(input clk, input rst, output reg [1:0]hy, output reg [1:0]fr);
parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101; 
reg [2:0]ps; reg [2:0]ns; wire [N-1:0]x;
parameter N=6;
counter u1(clk, rst, x);
always@(negedge clk or posedge rst) begin
	if(rst) begin
	ps<=A; hy<=2'b10; fr<=2'b10;
	end
	else begin
	if(ps==A) begin
		if(x==6'd0) begin ns=B; hy<=2'b00; fr<=2'b10; end
		else begin ns=A; hy<=2'b10; fr<=2'b10; end
	end
	else if(ps==B) begin
		if(x==6'd30) begin ns=C; hy<=2'b01; fr<=2'b10; end
		else begin ns=B; hy<=2'b00; fr<=2'b10; end
	end
	else if(ps==C) begin
		if(x==6'd33) begin ns=D; hy<=2'b10; fr<=2'b10; end
		else begin ns=C; hy<=2'b01; fr<=2'b10; end
	end
	
	else if(ps==D) begin
		if(x==6'd34) begin ns=E; hy<=2'b10; fr<=2'b00; end
		else begin ns=D; hy<=2'b10; fr<=2'b10; end
	end
	else if(ps==E) begin
		if(x==6'd49) begin ns=F; hy<=2'b10; fr<=2'b01; end
		else begin ns=E; hy<=2'b10; fr<=2'b00; end
	end
	else if(ps==F) begin
		if(x==6'd52) begin ns=B; hy<=2'b10; fr<=2'b10; end
		else begin ns=F; hy<=2'b10; fr<=2'b01; end
	end

	ps<=ns;
	end
end

endmodule


module tb();
reg clk; reg rst; wire [1:0]hy; wire [1:0]fr;
FSM dev(.clk(clk), .rst(rst), .hy(hy), .fr(fr));
initial begin
	$dumpfile("test1.vcd");
	$dumpvars(-1, dev);
end
always begin
clk=~clk;#1;
end
initial begin
rst=0;clk=0;rst=1;#1;
rst=0;
#120 $finish;
end
endmodule