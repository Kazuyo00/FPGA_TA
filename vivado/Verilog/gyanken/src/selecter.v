`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/30 21:29:45
// Design Name: 
// Module Name: selecter
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

`include "./nettype.h"
`include "./stddef.h"

module selecter(

    //input  wire clk,
    //input  wire rst_,                      //プッシュボタン3
    input  wire pon,                       //じゃんけんぽん！スライドスイッチ１
    input  wire gtp_,                       //「グーチョキパー」チャージするボタン、プッシュボタン2
            
    input  wire [`G_CounterBus] selecter_in,
    output reg  [`G_DataBus] g_data_out
    //output wire [`S_DataBus] s_data

    );
    
    reg [`G_DataBus] g_data = 6'b0;
    
    
    /***********6bitの信号でじゃんけんのパターンを送る*************/
    //always @(posedge clk) begin
    always @(*) begin
         case (pon)
    
           `ENABLE     : g_data_out <= g_data; 
        
           `DISABLE    : g_data_out <= {{4'b0},selecter_in};
           
           default     : g_data_out <= 6'b0;
    
        endcase
    end


    /***********gtpボタンを押したら2bitで表されたじゃんけんの手が6bit(3人分)に格納されていくよ^-^*****************/
   
    /*
    always @(posedge clk) begin
        if (gtp == `ENABLE_) begin
            g_data <= {g_data[3:0],selecter_in};
        end
    end
    */
    
    always @(negedge gtp_) begin
        if (gtp_ == `ENABLE_) begin
            g_data <= {g_data[3:0],selecter_in};
        end
    end
    
endmodule
