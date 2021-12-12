module adder(input [3:0]a, input [3:0]b, input cin, output reg [3:0]sum, output reg carry);
reg [4:0]t;
integer i;
always@(cin, a, b)
begin
t[0] = cin;
for (i=0; i < 4; i=i+1)
begin
FA (a[i], b[i], t[i], sum[i], t[i+1]);
end
carry=t[3];
end

task FA;
input a; input b; input cin; output sum; output carry;
begin
assign sum=a^b^cin;
assign carry= a&b | cin&(a^b);
end
endtask

endmodule

module tb();
reg [3:0]a; reg [3:0]b; reg cin; wire [3:0]sum; wire carry;
adder dev(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
initial begin
	$dumpfile("adderfortask.vcd");
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