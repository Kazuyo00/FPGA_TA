`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/31 18:29:03
// Design Name: 
// Module Name: chat
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

/************チャタリング防止回路、これ通さないと、プッシュボタン押してもうまく動作しないよ************/

`include "./nettype.h"
`include "./stddef.h"

module chat(

    input  wire clk,
    input  wire in,
    output wire out

    );
    
    reg [11:0] counter;                //2^11(2048)で分周
    reg sampling,sig;
    
    
    assign out = sig;
    
    
    always @(posedge clk) begin
        if (counter[11] == 1'b1) begin
            sampling <= 1'b0;
            counter <= counter + 1'b1;
        end else begin
            sampling <= 1'b1;
            counter <= counter + 1'b1;
        end
    end
    
    
    always @(posedge sampling) begin
        sig <= in;
    end
    
    
endmodule
