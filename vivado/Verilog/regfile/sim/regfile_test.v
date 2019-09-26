`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/27 21:18:26
// Design Name: 
// Module Name: regfile_test
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

module regfile_test;

    /***********入出力ポートの信号***************/
    // クロック　&　リセット
    reg             clk;               //クロック
    reg             reset_;             //リセット
    
    // アクセスインターフェース
    reg   [`AddrBus] addr;             //アドレス
	reg   [`DataBus] d_in;	           //入力データ
    reg              we_;             //書き込み有効（負論理）
    wire  [`DataBus] d_out;           //出力データ

	/*************内部信号******************/
	integer			 i;        		  //イテレータ
	
	/**********シミュレーションサイクルの定義************/
	parameter      STEP = 100.0000;   //10MHz
	
	/************クロックの生成*************/
	always #(STEP / 2) begin
	   clk <= ~clk;
	end
	
	/***********テストモジュールのインスタンス化**************/
	regfile regfile(
	   .clk    (clk),
	   .reset_  (reset_),
	   .addr   (addr),
	   .d_in   (d_in),
	   .we_    (we_),
	   .d_out  (d_out)
    );
    
    /************テストシーケンス*************/
    initial begin 
        #0 begin
            clk <= `HIGH;
            reset_ <= `ENABLE_;
            addr <= {`ADDR_W{1'b0}};
            d_in <= {`DATA_W{1'b0}};
            we_ <= `DISABLE_;
        end
        
        #(STEP * 3 /4)
        #STEP begin
            reset_ <= `DISABLE_;
        end
        #STEP begin
            for (i=0; i<`DATA_D; i=i+1)begin
                #STEP begin
                    addr <= i;
                    d_in <= i;
                    we_ <= `ENABLE_;
                end
                #STEP begin
                    addr <= {`ADDR_W{1'b0}};
                    d_in <= {`DATA_W{1'b0}};
                    we_ <= `DISABLE_;
                    if (d_out == i)begin 
                        $display($time," ff[%d] Read/Write Check OK !",i);
                    end else begin
                        $display($time," ff[%d] Read/Write Check NG !",i);
	                end
	            end
	        end
	    end
	    
	# STEP begin
	   $finish;
	end
end
	
endmodule



















