`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 20:39:11
// Design Name: 
// Module Name: cos_rom
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


module sin_rom(clk,addr,out);


input wire           clk;
input wire [11:0]    addr;
output wire [15:0]   out;


reg [15:0]     out_reg;


assign out = out_reg;


always @(posedge clk) begin
    out_reg <= {4'b1111,addr}; // sin, wakaranai toriaezu 1 iretoku
end

    
endmodule
