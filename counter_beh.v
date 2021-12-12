module counter(input clk, input rst, output reg [N-1:0]out);
parameter N=6; 
reg [N-1:0] temp1;
always@(posedge clk or posedge rst) 
begin
	if(rst) begin
	out =0; temp1=0; 
	end
	else begin
	if(out==6'b110110) begin
	out=0;
	end
	else begin
	out = out+1;
	end
	end
end
/*function count1(input rst);
begin
	if(!rst) begin
	temp1 = temp1+1;

	count1=temp1; 
	end 
end
endfunction
*/
endmodule

module tb();
parameter N=6;
reg clk; reg rst; wire [N-1:0]out;
counter u1(.clk(clk), .rst(rst), .out(out));
initial begin
	$dumpfile("count.vcd");
	$dumpvars(-1, u1);
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