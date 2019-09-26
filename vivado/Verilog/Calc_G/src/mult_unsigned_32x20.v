`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 18:35:26
// Design Name: 
// Module Name: mult_unsigned_32x20
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


module mult_unsigned_32x20(clk,in1,in2,out);


input wire              clk;
input wire [19:0]       in1; // m*m + n*n
input wire [31:0]       in2; // zparam
output wire [11:0]      out; // theta


reg [51:0]      out_reg; // seisuu + syousuu


assign out = out_reg[11:0];


always @(posedge clk) begin
    out_reg <= in1 * in2; 
end


endmodule
