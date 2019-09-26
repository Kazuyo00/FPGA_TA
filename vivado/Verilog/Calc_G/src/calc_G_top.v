`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 19:43:13
// Design Name: 
// Module Name: calc_G_top
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


module calc_G_top(clk,m,n,zparam,G_re,G_im);


input wire          clk;
input wire          signed [9:0] m,n;
input wire [31:0]   zparam;
output wire [15:0]  G_re,G_im;


wire [19:0]     m2_n2;
wire [11:0]     theta;
wire [15:0]     G_re_buf,G_im_buf;


assign G_re = G_re_buf;
assign G_im = G_im_buf;


mult_signed_10x10       mult1 (clk,m,n,m2_n2); // m*m + n*n => m2_n2
mult_unsigned_32x20     mult2 (clk,m2_n2,zparam,theta); // (m*m + n*n) * zparam => theta (kai 12bit)


cos_rom                 cos_rom1 (clk,theta,G_re_buf);
sin_rom                 sin_rom1 (clk,theta,G_im_buf);

endmodule
