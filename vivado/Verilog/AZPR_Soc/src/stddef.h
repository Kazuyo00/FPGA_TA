`ifndef __STDDEF_HEADER__      //インクルードガード
    `define __STDDEF_HEADER__
    
    `define  HIGH                  1'b1        //HIGH
    `define  LOW                   1'b0        //LOW
    
    `define  DISABLE               1'b0        //無効（正論理）
    `define  ENABLE                1'b1        //有効（正論理）
    `define  DISABLE_              1'b1        //無効（負論理）
    `define  ENABLE_               1'b0        //有効（負論理）
    
    `define  READ                  1'b1        //読み出し
    `define  WRITE                 1'b0        //書き込み
    
    `define  LSB                   0           //最下位ビット
    `define  BYTE_DATA_W           8           //データ幅（バイト）
    `define  BYTE_MSB              7           //最上位ビット（バイト）
    `define  ByteDataBus           7:0         //データバス（バイト）
    
    `define  WORD_DATA_W           32          //データ幅（ワード）
    `define  WORD_MSB              31          //最上位ビット（ワード）
    `define  WordDataBus           32:0        //データバス（ワード）
    `define  WORD_ADDR_W           30          //アドレス幅
    `define  WARD_ADDR_MSB         29          //最上位ビット
    `define  WardAssrBus           29:0        //アドレスバス
    
    `define  BYTE_OFFSET_W         2           //オフセット幅
    `define  ByteOffsetBus         1:0         //オフセットバス
    `define  WardAddrLoc           31:2        //ワードアドレスの位置
    `define  ByteOffsetLoc         1:0         //バイトオフセットの位置
    `define  BYTE_OFFSET_WORD      2'b00       //ワード境界

`endif
        
        
        
            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        