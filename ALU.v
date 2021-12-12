module alu(input [3:0]a, input [3:0]b, input [1:0]opcode, input enable, output reg [7:0]out, output reg done);
always@(posedge enable)
begin
done =0;
out=0;
if (opcode==2'b00) begin
out= a+b;done =1;
end
else if (opcode==2'b01) begin
out= a-b; done =1;end
else if (opcode==2'b10) begin
out= a*b; done =1;end
else if (opcode==2'b11) begin
out=a+1; done =1;end

end

endmodule

module alu_tb();
reg [3:0]a; reg [3:0]b; reg [1:0]opcode; reg enable; 
wire [7:0]out; wire done;
alu u1(.a(a), .b(b), .opcode(opcode), .enable(enable), .out(out), .done(done));

initial begin
	$dumpfile("alutest.vcd");
	$dumpvars(-1, u1);
end
always begin
enable = ~enable;#5;
end
initial begin
a=4'b100; b=4'b010; opcode=2'b00;enable=0;#10;
a=4'b100; b=4'b010; opcode=2'b00;#10;
a=4'b100; b=4'b010; opcode=2'b01;#10;
a=4'b100; b=4'b010; opcode=2'b10;#10;
a=4'b100; b=4'b010; opcode=2'b11;#10;
#10 $finish;
end

endmodule