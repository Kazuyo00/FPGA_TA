`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/17 18:52:25
// Design Name: 
// Module Name: bus_arbiter
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
`include "./global_config.h"
`include "./stddef.h"
`include "./bus.h"


/*****************モジュール************************/

module bus_arbiter(
    /****************クロックリセット********************/
    input wire          clk,
    input wire          reset,
    /***************バスマスタ*******************/
    input wire          m0_req_,
    output reg          m0_grnt_,
    
    input wire          m1_req_,
    output reg          m1_grnt_,
    
    input wire          m2_req_,
    output reg          m2_grnt_,
    
    input wire          m3_req_,
    output reg          m3_grnt_
                
    );
endmodule

    /*****************内部信号*********************/
    reg [`BusOwnerBus]  owner;
    
    /****************バスグラント生成（順次処理）****************/
    always @(*) begin       
    
        /*バスグラント初期化*/
        m0_grnt_ = `DISABLE_;
        m1_grnt_ = `DISABLE_;
        m2_grnt_ = `DISABLE_;
        m3_grnt_ = `DISABLE_;
        
        /*バスグラント生成*/
        case (owner)
        
            `BUS_OWNER_MASTER_0 : begin
                m0_grnt_ = `ENABLE_;
            end
            
            `BUS_OWNER_MASTER_1 : begin
                m1_grnt_ = `ENABLE_;
            end
     
            `BUS_OWNER_MASTER_2 : begin
                m2_grnt_ = `ENABLE_;
            end
                                           
            `BUS_OWNER_MASTER_3 : begin
                m3_grnt_ = `ENABLE_;
            end
        endcase
    end
    
    /************バス権のアービトレーション***************/
    always @(posedge clk or `RESET_EDGE reset) begin
        if (reset == `RESET_ENABLE) begin 
            /*非同期リセット*/
            owner <= #1 `BUS_OWNER_MASTER 0;
        end else begin
            /*アービトレーション*/
            case (owner)
            
            
                                

