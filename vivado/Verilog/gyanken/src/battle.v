`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/30 19:04:10
// Design Name: 
// Module Name: battle
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


module battle(

    input  wire [`G_DataBus]          battle_in,
    output reg  [`S_DataBus]          battle_out

    );
    
    
    /*
    reg [G_DataBus]                  battle_in_reg;
    reg [S_DataBus]                  battle_out_reg;
    
    assign battle_in  = battle_in_reg;
    assign battle_out = battle_out_reg;   
    */
    
    /************じゃんけんの入力データ→勝敗データ*************/
    
    always @(*)begin
        case (battle_in) 
            `GGG        : battle_out <= `D;
            `GGT        : battle_out <= `WWL;
            `GGP        : battle_out <= `LLW;
            
            `GTG        : battle_out <= `WLW;
            `GTT        : battle_out <= `WLL;
            `GTP        : battle_out <= `D;
            
            `GPG        : battle_out <= `LWL;
            `GPT        : battle_out <= `D;
            `GPP        : battle_out <= `LWW;
             
             /****************************************/
             
            `TGG        : battle_out <= `LWW;
            `TGT        : battle_out <= `LWL;
            `TGP        : battle_out <= `D;
            
            `TTG        : battle_out <= `LLW;
            `TTT        : battle_out <= `D;
            `TTP        : battle_out <= `WWL;
            
            `TPG        : battle_out <= `D;
            `TPT        : battle_out <= `WLW;
            `TPP        : battle_out <= `WLL;
            
            /********************************************/
            
            `PGG        : battle_out <= `WLL;
            `PGT        : battle_out <= `D;
            `PGP        : battle_out <= `WLW;
            
            `PTG        : battle_out <= `D;
            `PTT        : battle_out <= `LWW;
            `PTP        : battle_out <= `LWL;
            
            `PPG        : battle_out <= `WWL;
            `PPT        : battle_out <= `LLW;
            `PPP        : battle_out <= `D;
            
            /********************1人用********************/
            
            `G_6        : battle_out <= `G_4;
            `T_6        : battle_out <= `T_4;
            `P_6        : battle_out <= `P_4;
                                    
                    
            default     : battle_out <=  4'b1111;
            
        endcase
    end
    
endmodule
