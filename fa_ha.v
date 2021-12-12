module fa_ha(x,y,z,s,c);
input x,y,z;
output s,c;
wire p,q,r;

half_adder m1(x,y,p,q);
half_adder m2(p,z,s,r);
or(c,q,r);

endmodule


module fa_ha_tb();
reg x,y,z;
wire s,c;

fa_ha u1(.x(x), .y(y), .z(z), .s(s), .c(c));

initial begin
$dumpfile("fa_ha.vcd");
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