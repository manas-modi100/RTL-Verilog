module add16bit(input [n:0]a, input [n:0]b, input cin, output [n:0]sum, output carry);
wire [n+1:0]t;
//parameter in verilog = generic in vhdl
parameter n= 15;
assign t=a+b+cin;
assign sum[n:0] = t[n:0];
assign carry = t[n+1];

endmodule

module tb();
parameter n=15;
reg [n:0]a; reg [n:0]b; reg cin; wire [n:0]sum; wire carry;

add16bit dev(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
initial begin
	$dumpfile("16param.vcd");
	$dumpvars(-1, dev);
end
initial begin
a = 16'hFFFF;b = 16'hFFFF;cin = 1;#10;
a = $random;
b = $random;
cin = $random;#10;
#10 $finish;
end

endmodule