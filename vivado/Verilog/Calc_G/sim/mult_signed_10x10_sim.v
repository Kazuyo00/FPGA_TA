`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 17:31:11
// Design Name: 
// Module Name: mult_signed_10x10_sim
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


module mult_signed_10x10_sim();

    reg clk;
    reg signed [9:0] m,n;
    wire [19:0] out;
    
    
    mult_signed_10x10 mult1 (clk,m,n,out);
    
    
    initial begin
        clk <= 0;
        m <= 10'd1;
        n <= 10'd2;
      #50
        m <= -10'd1;
        n <= -10'd2;
      #50
        m <= 10'd2;
        n <= -10'd5;
      #100
        $finish;
    end
    
    
    always #10 begin
        clk <= ~clk;
    end
    
    
    
    

endmodule
