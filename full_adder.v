module full_adder(x,y,z,s,c);
input x,y,z;
output s,c;

assign s=x^y^z;
assign c=x&y|z&(x^y);
endmodule

/*module full_adder_tb();
reg x,y,z;
wire s,c;

full_adder u1(.x(x), .y(y), .z(z), .s(s), .c(c));

initial begin
$dumpfile("fa.vcd");
$dumpvars(-1,u1);
end

initial begin
x=0;y=0;z=0;#10;
x=0;y=0;z=1;#10;
x=0;y=1;z=0;#10;
x=0;y=1;z=1;#10;
x=1;y=0;z=0;#10;
x=1;y=0;z=1;#10;
x=1;y=1;z=0;#10;
x=1;y=1;z=1;#10;
end
endmodule
*/