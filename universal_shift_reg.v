module uni_shift_reg(input [1:0]s, input [3:0]pin, input left, input right,
 input clk, input rst, output reg [3:0]a);
always@(posedge clk or posedge rst)
begin
if(rst) begin
a=4'b0000; end
else begin
case (s)
	2'b00: begin
	a[0]<=a[0]; a[1]<=a[1] ;a[2]<=a[2]; a[3]<=a[3];
	end
	2'b11: begin
	a[0]<=pin[0]; a[1]<=pin[1]; a[2]<=pin[2]; a[3]<=pin[3];
	end
	2'b01: begin //shift right
	a[3]<=right; a[2]<=a[3]; a[1]<=a[2];a[0]<=a[1];
	end
	2'b10: begin //shift left
	a[0]<=left; a[1]<=a[0]; a[2]<=a[1]; a[3]<=a[2];
	end
endcase
end
end

endmodule

module tb();
reg [1:0]s; reg [3:0]pin; reg left; reg right; reg clk; reg rst; wire [3:0]a;
uni_shift_reg dev(.s(s), .pin(pin), .left(left), .right(right), .clk(clk), .rst(rst), .a(a));
initial begin
	$dumpfile("shiftreg.vcd");
	$dumpvars(-1, dev);
end

always begin
clk=~clk;#5;
end
initial begin
rst=1; rst=0;
clk=0;rst=1;#5;
rst=0; 
//parallel load 
s=2'b11; pin=4'b1011;#10;
//memory state
s=2'b00;#10;
//left shift
s=2'b10;left=1'b0;#10;
s=2'b10;left=1'b1;#10;
s=2'b10;left=1'b0;#10;
s=2'b10;left=1'b0;#10;
//memory state
s=2'b00;#10;
//right shift
s=2'b01;right=1'b1;#10;
s=2'b01;right=1'b0;#10;
s=2'b01;right=1'b1;#10;
s=2'b01;right=1'b1;#10;
//memory state
s=2'b00;#10;
#10 $finish;
end
endmodule