`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/31 15:55:52
// Design Name: 
// Module Name: top
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

module top(

    input  wire clk,
    input  wire d_in_,              //じゃんけん選択する信号
    input  wire gtp_,               //グーチョキパー入力する信号
    input  wire pon,                //じゃんけんぽん！
    output wire [`L_DataBus] led_    //表示用7segLED

    );
    
    wire [`G_CounterBus] Counter_out_buf;
    wire [`G_DataBus] g_data_out_buf;
    wire [`S_DataBus] battle_out_buf;
    wire d_in_chat_,gtp_chat_;
    
    
	/***************作ったモジュールつなぎまくる*********************/
    chat chat_d_in_ (
        .clk(clk),
        .in(d_in_),
        .out(d_in_chat_)
    );
        
        
    chat chat_gtp_ (
        .clk(clk),
        .in(gtp_),
        .out(gtp_chat_)
    );
   
        
    counter counter1 (
        .gtp_ (gtp_chat_),
        .counter_in_(d_in_chat_),
        .counter_out(Counter_out_buf)
    );
    
    
    selecter selecter1 (
        .pon(pon),
        .gtp_(gtp_chat_),
        .selecter_in(Counter_out_buf),
        .g_data_out(g_data_out_buf)
    );
    
    
    battle battle1 (
        .battle_in(g_data_out_buf),
        .battle_out(battle_out_buf)
    );
    
    
    decoder decoder1 (
        .decoder_in(battle_out_buf),
        .led_(led_)
    );
    
    
    
    
    
endmodule
