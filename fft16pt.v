`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2024 12:48:10
// Design Name: 
// Module Name: fft16pt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





module fft16pt(clk,rst,x1_r,x1_c,x2_r,x2_c,y1_r,y1_c,y2_r,y2_c,ra1_r,ra1_c,z1_r,z1_c,z2_r,z2_c);
input clk,rst;

output reg signed[23:0]x1_r,x1_c,x2_r,x2_c;

reg signed [23:0]x1_1r,x1_1c,x2_1r,x2_1c,x1_2r,x1_2c,x2_2r,x2_2c,x1_3r,x1_3c,x2_3r,x2_3c,x1_4r,x1_4c,x2_4r,x2_4c,x1_5r,x1_5c,x2_5r,x2_5c,x1_6r,x1_6c,x2_6r,x2_6c,x1_7r,x1_7c,x2_7r,x2_7c,x1_8r,x1_8c,x2_8r,x2_8c,x1_9r,x1_9c,x2_9r,x2_9c,x1_10r,x1_10c,x2_10r,x2_10c,x1_11r,x1_11c,x2_11r,x2_11c,x1_12r,x1_12c,x2_12r,x2_12c,x1_13r,x1_13c,x2_13r,x2_13c,x1_14r,x1_14c,x2_14r,x2_14c,x1_15r,x1_15c,x2_15r,x2_15c,x1_16r,x1_16c,x2_16r,x2_16c;

wire signed[23:0]s1a_r,s1a_c,s1b_r,s1b_c;
wire signed[23:0]s1a1_r,s1a1_c,s1b1_r,s1b1_c;


output signed[23:0]y1_r,y1_c,y2_r,y2_c;
output signed[13:0]ra1_r,ra1_c;
output signed[23:0]z1_r,z1_c,z2_r,z2_c;

reg [3:0]count;

wire signed [23:0]s3a_r,s3a_c,s3b_r,s3b_c,s3a1_r,s3a1_c,s3b1_r,s3b1_c;
wire signed [23:0]s2a_r,s2a_c,s2b_r,s2b_c,s2a1_r,s2a1_c,s2b1_r,s2b1_c;

reg signed[13:0] w1_r=14'b01111111111111;
reg signed[13:0] w2_r=14'b01110110010000;
reg signed[13:0] w3_r=14'b01011010100001;
reg signed[13:0] w4_r=14'b00110000111111;
reg signed[13:0] w5_r=14'b00000000000000;
reg signed[13:0] w6_r=14'b11001111000001;
reg signed[13:0] w7_r=14'b10100101011111;
reg signed[13:0] w8_r=14'b10001001110000;
reg signed[13:0] w9_r=14'b10000000000000;
reg signed[13:0] w10_r=14'b10001001110000;
reg signed[13:0] w11_r=14'b10100101011111;
reg signed[13:0] w12_r=14'b11001111000001;
reg signed[13:0] w13_r=14'b00000000000000;
reg signed[13:0] w14_r=14'b00110000111111;
reg signed[13:0] w15_r=14'b01011010100001;
reg signed[13:0] w16_r=14'b01110110010000;
reg signed[13:0] w1_c=14'b00000000000000;
reg signed[13:0] w2_c=14'b11001111000001;
reg signed[13:0] w3_c=14'b10100101011111;
reg signed[13:0] w4_c=14'b10001001110000;
reg signed[13:0] w5_c=14'b10000000000000;
reg signed[13:0] w6_c=14'b10001001110000;
reg signed[13:0] w7_c=14'b10100101011111;
reg signed[13:0] w8_c=14'b11001111000001;
reg signed[13:0] w9_c=14'b00000000000000;
reg signed[13:0] w10_c=14'b00110000111111;
reg signed[13:0] w11_c=14'b01011010100001;
reg signed[13:0] w12_c=14'b01110110010000;
reg signed[13:0] w13_c=14'b01111111111111;
reg signed[13:0] w14_c=14'b01110110010000;
reg signed[13:0] w15_c=14'b01011010100001;
reg signed[13:0] w16_c=14'b00110000111111;
                   
reg [13:0]rd1_r,rd2_r,rd3_r,rd4_r,rd5_r,rd6_r,rd7_r,rd8_r,rd1_c,rd2_c,rd3_c,rd4_c,rd5_c,rd6_c,rd7_c,rd8_c;

always @(posedge clk)
if(rst)
begin
x1_1r<=24'b000000000000100011011101;
x2_1r<=24'b000000000001011010110011;
x1_1c<=24'b000000000000000000000000;
x2_1c<=24'b000000000000000000000000;
x1_2r<=24'b000000000000000101111010;
x2_2r<=24'b000000000001100000100110;
x1_2c<=24'b000000000000000000000000;
x2_2c<=24'b000000000000000000000000;
x1_3r<=24'b000000000000001100011100;
x2_3r<=24'b000000000000100011010101;
x1_3c<=24'b000000000000000000000000;
x2_3c<=24'b000000000000000000000000;
x1_4r<=24'b000000000001101001011010;
x2_4r<=24'b000000000001010111000000;
x1_4c<=24'b000000000000000000000000;
x2_4c<=24'b000000000000000000000000;
x1_5r<=24'b000000000001011000111100;
x2_5r<=24'b000000000001010011110111;
x1_5c<=24'b000000000000000000000000;
x2_5c<=24'b000000000000000000000000;
x1_6r<=24'b000000000000101000100110;
x2_6r<=24'b000000000000010100110100;
x1_6c<=24'b000000000000000000000000;
x2_6c<=24'b000000000000000000000000;
x1_7r<=24'b000000000001111001101000;
x2_7r<=24'b000000000000001111001111;
x1_7c<=24'b000000000000000000000000;
x2_7c<=24'b000000000000000000000000;
x1_8r<=24'b000000000000000100011010;
x2_8r<=24'b000000000000111111110011;
x1_8c<=24'b000000000000000000000000;
x2_8c<=24'b000000000000000000000000;
x1_9r<=24'b000000000000111000001010;
x2_9r<=24'b000000000001111010110110;
x1_9c<=24'b000000000000000000000000;
x2_9c<=24'b000000000000000000000000;
x1_10r<=24'b000000000000110000110110;
x2_10r<=24'b000000000000101011100100;
x1_10c<=24'b000000000000000000000000;
x2_10c<=24'b000000000000000000000000;
x1_11r<=24'b000000000001100001111111;
x2_11r<=24'b000000000001001010111011;
x1_11c<=24'b000000000000000000000000;
x2_11c<=24'b000000000000000000000000;
x1_12r<=24'b000000000001100101110010;
x2_12r<=24'b000000000000011100101001;
x1_12c<=24'b000000000000000000000000;
x2_12c<=24'b000000000000000000000000;
x1_13r<=24'b000000000000010111111011;
x2_13r<=24'b000000000001100000001010;
x1_13c<=24'b000000000000000000000000;
x2_13c<=24'b000000000000000000000000;
x1_14r<=24'b000000000000111110101100;
x2_14r<=24'b000000000000100000101010;
x1_14c<=24'b000000000000000000000000;
x2_14c<=24'b000000000000000000000000;
x1_15r<=24'b000000000000111001000010;
x2_15r<=24'b000000000001000000110001;
x1_15c<=24'b000000000000000000000000;
x2_15c<=24'b000000000000000000000000;
x1_16r<=24'b000000000001010010101111;
x2_16r<=24'b000000000001011001011111;
x1_16c<=24'b000000000000000000000000;
x2_16c<=24'b000000000000000000000000;
end
else
begin
x1_1r<=x1_2r;
x1_2r<=x1_3r;
x1_3r<=x1_4r;
x1_4r<=x1_5r;
x1_5r<=x1_6r;
x1_6r<=x1_7r;
x1_7r<=x1_8r;
x1_8r<=x1_9r;
x1_9r<=x1_10r;
x1_10r<=x1_11r;
x1_11r<=x1_12r;
x1_12r<=x1_13r;
x1_13r<=x1_14r;
x1_14r<=x1_15r;
x1_15r<=x1_16r;
x1_16r<=x1_1r;

x1_1c<=x1_2c;
x1_2c<=x1_3c;
x1_3c<=x1_4c;
x1_4c<=x1_5c;
x1_5c<=x1_6c;
x1_6c<=x1_7c;
x1_7c<=x1_8c;
x1_8c<=x1_9c;
x1_9c<=x1_10c;
x1_10c<=x1_11c;
x1_11c<=x1_12c;
x1_12c<=x1_13c;
x1_13c<=x1_14c;
x1_14c<=x1_15c;
x1_15c<=x1_16c;
x1_16c<=x1_1c;

x2_1r<=x2_2r;
x2_2r<=x2_3r;
x2_3r<=x2_4r;
x2_4r<=x2_5r;
x2_5r<=x2_6r;
x2_6r<=x2_7r;
x2_7r<=x2_8r;
x2_8r<=x2_9r;
x2_9r<=x2_10r;
x2_10r<=x2_11r;
x2_11r<=x2_12r;
x2_12r<=x2_13r;
x2_13r<=x2_14r;
x2_14r<=x2_15r;
x2_15r<=x2_16r;
x2_16r<=x2_1r;

x2_1c<=x2_2c;
x2_2c<=x2_3c;
x2_3c<=x2_4c;
x2_4c<=x2_5c;
x2_5c<=x2_6c;
x2_6c<=x2_7c;
x2_7c<=x2_8c;
x2_8c<=x2_9c;
x2_9c<=x2_10c;
x2_10c<=x2_11c;
x2_11c<=x2_12c;
x2_12c<=x2_13c;
x2_13c<=x2_14c;
x2_14c<=x2_15c;
x2_15c<=x2_16c;
x2_16c<=x2_1c;
end

always @(*)
begin
x1_r<=x1_1r;
x1_c<=x1_1c;
x2_r<=x2_1r;
x2_c<=x2_1c;
end


always @ (posedge clk or posedge rst)
begin
if(rst==1)
begin
rd1_r<=w8_r;
rd2_r<=w7_r;
rd3_r<=w6_r;
rd4_r<=w5_r;
rd5_r<=w4_r;
rd6_r<=w3_r;
rd7_r<=w2_r;
rd8_r<=w1_r;

rd1_c<=w8_c;
rd2_c<=w7_c;
rd3_c<=w6_c;
rd4_c<=w5_c;
rd5_c<=w4_c;
rd6_c<=w3_c;
rd7_c<=w2_c;
rd8_c<=w1_c;
end
else
begin
rd1_r<=rd8_r;
rd2_r<=rd1_r;
rd3_r<=rd2_r;
rd4_r<=rd3_r;
rd5_r<=rd4_r;
rd6_r<=rd5_r;
rd7_r<=rd6_r;
rd8_r<=rd7_r;

rd1_c<=rd8_c;
rd2_c<=rd1_c;
rd3_c<=rd2_c;
rd4_c<=rd3_c;
rd5_c<=rd4_c;
rd6_c<=rd5_c;
rd7_c<=rd6_c;
rd8_c<=rd7_c;
end
end

reg [13:0]rc4_r,rc1_r,rc2_r,rc3_r,rc4_c,rc1_c,rc2_c,rc3_c;

always @ (posedge clk or posedge rst)
begin
if(rst==1)
begin
rc1_r<=w7_r;
rc2_r<=w5_r;
rc3_r<=w3_r;
rc4_r<=w1_r;

rc1_c<=w3_c;
rc2_c<=w5_c;
rc3_c<=w7_c;
rc4_c<=w1_c; 
end
else
begin
rc1_r<=rc4_r;
rc2_r<=rc1_r;
rc3_r<=rc2_r;
rc4_r<=rc3_r;

rc1_c<=rc4_c;
rc2_c<=rc1_c;
rc3_c<=rc2_c;
rc4_c<=rc3_c;
end
end 

reg signed[13:0]tfs3_r,tfs3_c;
always @ (posedge clk)
begin
tfs3_r<=rc1_r;
tfs3_c<=rc1_c;
end

reg [13:0]rb2_r,rb1_r,rb2_c,rb1_c;

always @ (posedge clk or posedge rst)
begin
if(rst==1)
begin
rb1_r<=w1_r;
rb2_r<=w5_r;

rb1_c<=w1_c;
rb2_c<=w5_c;
end
else
begin
rb2_r<=rb1_r;
rb1_r<=rb2_r;

rb2_c<=rb1_c;
rb1_c<=rb2_c;
end
end

reg signed[13:0] ra1_r,ra1_c;

always @ (posedge clk)
begin
ra1_r<=w1_r;
ra1_c<=w1_c;
end

always @ (posedge clk or posedge rst)
if(rst ==1)
count<=0000;
else
count<=count+1;

assign c1=count[0];
assign c2=count[1];
assign c3=count[2];
assign c4=count[3];

ffts4 s4(x1_r,x1_c,x2_r,x2_c,clk,rst,c4,s3a_r,s3a_c,s3b_r,s3b_c);

bfunit_24_14 bf4(clk,s3a_r,s3a_c,s3b_r,s3b_c,rd1_r,rd1_c,s3a1_r,s3a1_c,s3b1_r,s3b1_c);

ffts3 s3(s3a1_r,s3a1_c,s3b1_r,s3b1_c,clk,rst,c3,s2a_r,s2a_c,s2b_r,s2b_c);

bfunit_24_14 bf3(clk,s2a_r,s2a_c,s2b_r,s2b_c,tfs3_r,tfs3_c,s2a1_r,s2a1_c,s2b1_r,s2b1_c);

ffts2 s2(s2a1_r,s2a1_c,s2b1_r,s2b1_c,clk,rst,c2,s1a_r,s1a_c,s1b_r,s1b_c);

bfunit_24_14 bf2(clk,s1a_r,s1a_c,s1b_r,s1b_c,rb1_r,rb1_c,s1a1_r,s1a1_c,s1b1_r,s1b1_c);

ffts1 s1(s1a1_r,s1a1_c,s1b1_r,s1b1_c,clk,rst,c1,y1_r,y1_c,y2_r,y2_c);

bfunit_24_14 bf1(clk,y1_r,y1_c,y2_r,y2_c,ra1_r,ra1_c,z1_r,z1_c,z2_r,z2_c);

endmodule

module ffts4(x1_r,x1_c,x2_r,x2_c,clk,rst,c,y1_r,y1_c,y2_r,y2_c);
input signed [23:0]x1_r,x2_r,x1_c,x2_c;
input clk,rst,c;
output reg signed [23:0]y1_r,y2_r,y1_c,y2_c;

reg signed[23:0] r1_r,r1_c,r2_r,r2_c,r3_r,r3_c,r4_r,r4_c,r5_r,r5_c,r6_r,r6_c,r7_r,r7_c,r8_r,r8_c,r9_r,r9_c,r10_r,r10_c,r11_r,r11_c,r12_r,r12_c,r13_r,r13_c,r14_r,r14_c,r15_r,r15_c,r16_r,r16_c;

wire signed[23:0]t1_r,t2_r,t1_c,t2_c;

reg c41;

reg signed[23:0]xr1_r,xr2_r,xr1_c,xr2_c;

always @ (posedge clk)
begin
xr1_r<=x1_r;
xr2_r<=x2_r;
xr1_c<=x1_c;
xr2_c<=x2_c;
end

always @ (posedge clk)
c41<=c;

always @ (posedge clk)
begin
r1_r<=xr2_r;
r2_r<=r1_r;
r3_r<=r2_r;
r4_r<=r3_r;
r5_r<=r4_r;
r6_r<=r5_r;
r7_r<=r6_r;
r8_r<=r7_r;

r1_c<=xr2_c;
r2_c<=r1_c;
r3_c<=r2_c;
r4_c<=r3_c;
r5_c<=r4_c;
r6_c<=r5_c;
r7_c<=r6_c;
r8_c<=r7_c;
end

mdc m1(xr1_r,r8_r,xr1_c,r8_c,c41,t1_r,t2_r,t1_c,t2_c);

always @ (posedge clk)
begin
r9_r<=t1_r;
r10_r<=r9_r;
r11_r<=r10_r;
r12_r<=r11_r;
r13_r<=r12_r;
r14_r<=r13_r;
r15_r<=r14_r;
r16_r<=r15_r;

r9_c<=t1_c;
r10_c<=r9_c;
r11_c<=r10_c;
r12_c<=r11_c;
r13_c<=r12_c;
r14_c<=r13_c;
r15_c<=r14_c;
r16_c<=r15_c;
end

always @ (*)
begin
y1_r<=r16_r;
y1_c<=r16_c;
end

always@ (*)
begin
y2_r<=t2_r;
y2_c<=t2_c;
end

endmodule

module ffts3(x1_r,x1_c,x2_r,x2_c,clk,rst,c,y1_r,y1_c,y2_r,y2_c);

input signed[23:0]x1_r,x2_r,x1_c,x2_c;
input clk,c,rst;
output reg signed[23:0]y1_r,y2_r,y1_c,y2_c;

reg signed[23:0]r1_r,r2_r,r3_r,r4_r,r5_r,r6_r,r7_r,r8_r,r1_c,r2_c,r3_c,r4_c,r5_c,r6_c,r7_c,r8_c;

wire signed[23:0]t1_r,t2_r,t1_c,t2_c;

reg c41,c31,c21,c11;
reg signed[23:0]xr1_r,xr2_r,xr1_c,xr2_c,t3_r,t3_c;

//always @ (posedge clk)
//begin
//xr1_r<=x1_r;
//xr2_r<=x2_r;
//xr1_c<=x1_c;
//xr2_c<=x2_c;
//end

always @ (posedge clk)
c41<=c;

always @(posedge clk)
begin
c31<=c41;
c21<=c31;
c11<=c21;
end

always @ (posedge clk)
begin
r1_r<=x2_r;
r2_r<=r1_r;
r3_r<=r2_r;
r4_r<=r3_r;
r1_c<=x2_c;
r2_c<=r1_c;
r3_c<=r2_c;
r4_c<=r3_c;
end

mdc m1(x1_r,r4_r,x1_c,r4_c,~c31,t1_r,t2_r,t1_c,t2_c);

always @ (posedge clk)
begin
r5_r<=t1_r;
r6_r<=r5_r;
r7_r<=r6_r;
r8_r<=r7_r;
r5_c<=t1_c;
r6_c<=r5_c;
r7_c<=r6_c;
r8_c<=r7_c;
end

always @ (*)
begin
y1_r<=r8_r;
y1_c<=r8_c;
end

always@ (*)
begin
y2_r<=t2_r;
y2_c<=t2_c;
end

endmodule

module ffts2(x1_r,x1_c,x2_r,x2_c,clk,rst,c,y1_r,y1_c,y2_r,y2_c);
input [23:0]x1_r,x2_r,x1_c,x2_c;
input clk,c,rst;
output reg [23:0]y1_r,y2_r,y1_c,y2_c;

reg [23:0]r1_r,r2_r,r3_r,r4_r,r1_c,r2_c,r3_c,r4_c;

wire [23:0]t1_r,t2_r,t1_c,t2_c;

reg c21,c22;
reg [23:0]xr1_r,xr2_r,xr1_c,xr2_c;

always @ (posedge clk)
begin
xr1_r<=x1_r;
xr2_r<=x2_r;
xr1_c<=x1_c;
xr2_c<=x2_c;
end

always @ (posedge clk)
begin
c21<=c;
c22<=c21;
end

always @ (posedge clk)
begin
r1_r<=xr2_r;
r2_r<=r1_r;
r1_c<=xr2_c;
r2_c<=r1_c;
end

mdc m1(xr1_r,r2_r,xr1_c,r2_c,~c22,t1_r,t2_r,t1_c,t2_c);

always @ (posedge clk)
begin
r3_r<=t1_r;
r4_r<=r3_r;
end

always @ (posedge clk)
begin
r3_c<=t1_c;
r4_c<=r3_c;
end

always @ (*)
begin
y1_r<=r4_r;
y1_c<=r4_c;
end
always@ (*)
begin
y2_r<=t2_r;
y2_c<=t2_c;
end

endmodule


module ffts1(x1_r,x1_c,x2_r,x2_c,clk,rst,c,y1_r,y1_c,y2_r,y2_c);

input [23:0]x1_r,x2_r,x1_c,x2_c;
input clk,c,rst;
output reg [23:0]y1_r,y2_r,y1_c,y2_c;

reg [23:0]r1_r,r3_r,r1_c,r3_c;

wire [23:0]t1_r,t2_r,t1_c,t2_c;

reg c11,c12,c13;
reg [23:0]xr1_r,xr2_r,xr1_c,xr2_c;

always @ (posedge clk)
begin
xr1_r<=x1_r;
xr2_r<=x2_r;
xr1_c<=x1_c;
xr2_c<=x2_c;
end

always @ (posedge clk)
begin
c11<=c;
c12<=c11;
c13<=c12;
end

always @ (posedge clk)
begin
r1_r<=xr2_r;
r1_c<=xr2_c;
end

mdc m1(xr1_r,r1_r,xr1_c,r1_c,~c13,t1_r,t2_r,t1_c,t2_c);

always @ (posedge clk)
begin
r3_r<=t1_r;
r3_c<=t1_c;
end

always @ (*)
begin
y1_r<=r3_r;
y1_c<=r3_c;
end

always@ (*)
begin
y2_r<=t2_r;
y2_c<=t2_c;
end

endmodule

module mdc(u1_r,u2_r,u1_c,u2_c,c,v1_r,v2_r,v1_c,v2_c);

input signed[23:0]u1_r,u2_r,u1_c,u2_c;
input c;
output reg signed[23:0]v1_r,v2_r,v1_c,v2_c;

always @ (*)
if(c==1'b0)
begin
v1_r<=u1_r;
v2_r<=u2_r;
v1_c<=u1_c;
v2_c<=u2_c;
end
else
begin
v1_r<=u2_r;
v2_r<=u1_r;
v1_c<=u2_c;
v2_c<=u1_c;
end

endmodule
 
module bfunit_24_14(input clk, input [23:0]a,b,c,d,input [13:0]e,f, output reg signed [23:0]sur,sui,dpr,dpi);

reg signed [23:0]xr, xi, yi, yr, sr, si, dr, di;
reg signed [13:0] tr, ti;
wire signed [23:0]pr, pi;

always @ (posedge clk)
begin
xr <= a;
xi <= b;
yr <= c;
yi <= d;
tr <= e;
ti <= f;
end

always @ (*)
begin
sr <= xr + yr;
si <= xi + yi;
dr <= xr - yr;
di <= xi - yi;
end

cmx_24_14 cm3(clk, dr, di, tr, ti, pr, pi);

reg [23:0]r0_r,r1_r,r2_r,r3_r,r0_c,r1_c,r2_c,r3_c;

always @ (posedge clk)
begin
r0_r<=sr;
r1_r<=r0_r;
r2_r<=r1_r;

r0_c<=si;
r1_c<=r0_c;
r2_c<=r1_c;
end


always @ (posedge clk)
begin
sur <=r2_r;
sui <=r2_c;
dpr <= pr;
dpi <= pi;
end


endmodule

module cmx_24_14(input clk, input [23:0]a,b,input [13:0]c,d, output reg signed [23:0]s1,s2);
reg signed [37:0]px1,px2,px3,px4;
reg signed [23:0]a1,b1;
reg signed [13:0]c1,d1;
reg signed [23:0]p1,p2,p3,p4;

always @ (posedge clk)
begin
a1 <= a;
b1 <= b;
c1 <= c;
d1 <= d;
end

always @ (posedge clk)
begin
px1 <=a1*c1;
px2 <=b1*d1;
px3 <=b1*c1;
px4 <=a1*d1;
end

always @ (*)
begin
p1 <= px1[36:13]+px1[12];
p2 <= px2[36:13]+px2[12];
p3 <= px3[36:13]+px3[12];
p4 <= px4[36:13]+px4[12];
end

always @ (posedge clk)
begin
s1 <= p1 - p2;
s2 <= p3 + p4;
end
endmodule
