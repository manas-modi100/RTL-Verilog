module counter8_func(input clk, input rst, input mode, output [7:0]a); //8bit counter behavioural modelling using function call
reg [7:0] temp; reg [7:0]temp1;
initial begin
temp=0;
temp1 =0; end
always@(negedge clk or posedge rst)
begin
if(rst) begin
temp=0; end
else begin
temp = count(mode);
end
end
assign a=temp;

function [7:0]count(input mode1);
begin
if (mode1 == 1'b1) begin
temp1=temp1+1; end
else if (mode1 == 1'b0) begin
temp1 = temp1-1; end
assign count = temp1;
end
endfunction
endmodule

module tb();
reg clk; reg rst; reg mode; wire [7:0]a;
counter8_func u1(.clk(clk), .rst(rst), .mode(mode), .a(a));
initial begin
	$dumpfile("counterfunc.vcd");
	$dumpvars(-1, u1);
end
always begin
clk=~clk;#5;
end
initial begin
rst=1'b0;rst=1'b1;
clk=1'b0; rst=1'b0;#5;

mode=1'b0; #100;
mode=1'b1; #100;
#10 $finish;
end
endmodule