`ifndef __REGFILE_HEADER__
    `define __REGFILE_HEADER__
    
    /***********信号レベル**********/
    `define HIGH            1'b1    //HIGHレベル
    `define LOW             1'b0    //LOWレベル
    
    /**********論理値************/
    `define ENABLE_        	1'b0    //有効（負論理）
    `define DISABLE_       1'b1    //無効（負論理）
    
    /*********データ**************/
    `define DATA_W           32     //データの幅
	`define DataBus          31:0   //データのバス
	`define DATA_D           32     //データの深さ
	
	/**********アドレス**************/
	`define ADDR_W			 5		//アドレスの幅
	`define AddrBus			 4:0    //アドレスのバス
	
`endif