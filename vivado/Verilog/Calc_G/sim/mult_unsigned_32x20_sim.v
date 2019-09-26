`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/18 19:05:25
// Design Name: 
// Module Name: mut_unsigned_32x10_sim
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


module mult_unsigned_32x10_sim();

    reg clk;
    reg [19:0] in1;
    reg [31:0] in2; // 32bit (20bit seisuu    12bit syousuu)
    wire [11:0] out;
    
    
    mult_unsigned_32x20 mult2(clk,in1,in2,out);
    
    
    initial begin
        clk <= 0;
        in1 <= 20'd3;
        in2 <= 32'b00000000000001001101000001001101; // 77.77
      #50
        in1 <= 20'd50;
        in2 <= 32'b00000000000001111011000111001000; // 123.456
      #50
        in1 <= 20'd99;
        in2 <= 32'b00000000000000000001000000000010; // 1.2
      #100
        $finish;
    end
    
    
    always #10 begin
        clk <= ~clk;
    end
    
    
    
    

endmodule