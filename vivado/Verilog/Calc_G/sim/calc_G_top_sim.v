`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 20:12:52
// Design Name: 
// Module Name: calc_G_top_sim
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


module calc_G_top_sim( );

    reg clk;
    reg signed [9:0] m,n;
    reg [31:0] zparam;
    wire [15:0] G_re,G_im;
    
    
    calc_G_top test1 (clk,m,n,zparam,G_re,G_im);
    
    
    initial begin
        clk <= 0;
        m <= 10'd1;
        n <= 10'd1;
        zparam <= 32'b00000000000000000001000000000010; // 1.2
        
      #20
        m <= 10'd1;
        n <= 10'd1;
        zparam <= 32'b00000000000001001101000001001101; // 77.77
        
      #20
        m <= 10'd1;
        n <= 10'd2;
        zparam <= 32'b00000000000000000001000000000010; // 1.2
        
      #20
        m <= 10'd1;
        n <= 10'd2;
        zparam <= 32'b00000000000001001101000001001101; // 77.77
        
      #20
        m <= 10'd1;
        n <= -10'd3;
        zparam <= 32'b00000000000000000001000000000010; // 1.2
      
      #20
        m <= 10'd1;
        n <= -10'd3;
        zparam <= 32'b00000000000001001101000001001101; // 77.77
      
      #20
        $finish;
    end
    
    
    always #2 begin
        clk <= ~clk;
    end
    

endmodule