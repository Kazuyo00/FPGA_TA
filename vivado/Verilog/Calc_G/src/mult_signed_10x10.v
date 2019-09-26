`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 17:03:46
// Design Name: 
// Module Name: mult_signed_10x10
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


module mult_signed_10x10(clk,m,n,out);


input wire                  clk;
input wire signed [9:0]     m,n;
output wire [19:0]          out;


reg [18:0]      m2,n2;
reg [19:0]      out_reg;


assign out = out_reg;


always @(posedge clk) begin
    m2 <= m * m;
    n2 <= n * n;
    out_reg <= m2 + n2;
end

    
endmodule
