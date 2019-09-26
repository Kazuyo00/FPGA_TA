`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 16:41:39
// Design Name: 
// Module Name: calc_G_top_wrapper
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


module calc_G_top_wrapper(clk);


input wire clk;


wire signed [9:0] m,n;
wire [31:0] zparam;
wire [15:0] G_re,G_im;


calc_G_top     wrapper1 (clk,m,n,zparam,G_re,G_im); 


endmodule
