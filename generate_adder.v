module bit4gen(input [N:0]a, input [N:0]b, input cin, output [N:0]sum, output carry);
 //four bit adder using generate statement
 wire [N+1:0]t;
parameter N= 3;
genvar i;
generate 
assign t[0] = cin;
for (i = 0; i < N+1; i=i+1)
begin
FA f1(a[i], b[i], t[i], sum[i], t[i+1]);
end
assign carry = t[3];
endgenerate 

endmodule

module FA(input x, input y, input z, output s, output c);
assign s = x^y^z;
assign c = x&y | z&(x^y);
endmodule

module tb();
parameter N=3;
reg [N:0]a; reg [N:0]b; reg cin; wire [N:0]sum; wire carry;
bit4gen dev(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
initial begin
	$dumpfile("bit4generate.vcd");
	$dumpvars(-1, dev);
end
initial begin
a=4'b1111; b=4'b1111; cin=1'b0;#10;
end
always begin
#10 a = $random;
#10 b= $random;
#50 $finish;
end

endmodule