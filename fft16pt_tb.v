`timescale 1ns / 1ps
////////////////////////////////

module fft16pt_tb();
reg clk,rst;

wire signed[23:0]x1_r,x1_c,x2_r,x2_c,y1_r,y1_c,y2_r,y2_c,z1_r,z1_c,z2_r,z2_c;
wire signed[13:0]ra1_r,ra1_c;
fft16pt dut(clk,rst,x1_r,x1_c,x2_r,x2_c,y1_r,y1_c,y2_r,y2_c,ra1_r,ra1_c,z1_r,z1_c,z2_r,z2_c);
 initial begin
        clk = 1;
//'
        // Wait 100 ns for global reset to finish  
 #100
 
  #50
  rst = 1;
  #47;
  rst = 0;
  #5;
  end
  
   always
        #5 clk=~clk;



endmodule