`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/27 20:15:06
// Design Name: 
// Module Name: regfile
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


`include "./regfile.h"



module regfile(

	/****************クロック　&　リセット*************/
	input wire		clk,				//クロック
	input wire		reset_,				//非同期リセット（負論理）
	
	/*************アクセスインターフェース***********/
	input wire  [`AddrBus] addr,		//アドレス
	input wire  [`DataBus] d_in,		//入力データ
	input wire			   we_,			//書き込み有効（負論理）
	output wire [`DataBus] d_out		//出力データ
);
	
	/*************内部信号******************/
	reg [`DataBus]		ff[`DATA_D-1:0];	//レジスタ配列
	integer				i;   				//イテレータ
	
	/*************読み出しアクセス*************/
	assign d_out = ff[addr];
	
	/*************書き込みアクセス*************/
	always @(posedge clk or negedge reset_)begin
		if(reset_ == `ENABLE_)begin
		/* 非同期リセット */
		  for (i=0;i<`DATA_D;i=i+1)begin
			ff[i] <= #1 {`DATA_W{1'b0}};
		  end
	   end else begin
		/* 書き込みアクセス */
		  if (we_ == `ENABLE_)begin
			ff[addr] <= #1 d_in;
		  end
	   end
	end

endmodule