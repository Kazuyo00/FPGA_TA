`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/30 20:53:09
// Design Name: 
// Module Name: counter
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


module counter(

    //input  wire clk,
    //input  wire rst_,
    input  wire gtp_,
    input  wire counter_in_,
    output wire [`G_CounterBus] counter_out

    );
    
    reg [`G_CounterBus] counter_out_reg;
    assign counter_out = counter_out_reg;
    
    /*******1加算されていく度にグーチョキパーが変わっていく*******/
    
    
    /*
    always @(posedge clk and negedge counter_in_) begin
        if(gtp_==`ENABLE_) begin         //同期リセット
            counter_out_reg <= 2'b0;
        end else begin
            if(!counter_in_) begin
                counter_out_reg <= counter_out_reg + 1'b1;
            end
        end
    end
    */
    
    
    
    always @(negedge counter_in_ or negedge gtp_) begin
        if(gtp_==`ENABLE_)         //リセット
            counter_out_reg <= 2'b0;
        else if (!counter_in_) begin
            if (counter_out_reg == 2'b11)
                counter_out_reg <= 2'b01;
            else 
            counter_out_reg <= counter_out_reg + 1'b1;
        end
    end
    
           
endmodule
