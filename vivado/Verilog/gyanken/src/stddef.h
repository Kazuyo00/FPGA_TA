`ifndef __STDDEF_HEADER__
    `define __STDDEF_HEADER__
    
    /*******プッシュボタン用***********/
    
    `define ENABLE_             1'b0        //負論理
    `define DISABLE_            1'b1        //負論理
    
    /*******スライドスイッチ用*********/
    
    `define ENABLE             1'b1        //正論理
    `define DISABLE            1'b0        //正論理
    
    /**********いろいろ***************/
    
    
    `define G_DATA_W            6           //じゃんけん(gyanken)の入力データの幅                
    `define G_DataBus           5:0         //じゃんけん(gyanken)の入力データのバス
    
    
    `define S_DATA_W            4           //勝敗(syouhai)の入力データの幅                
    `define S_DataBus           3:0         //勝敗(syouhai)の入力データのバス
    
    `define G_CounterBus        1:0         //1人のじゃんけん判断するやつのバス
    
    `define L_DataBus           31:0         //7segLED×4のデータのバス
                   
    
    /**********グー(G)チョキ(T)パー(P)************/
    
    `define GGG                 6'b010101   //グーグーグー↓以下略
    `define GGT                 6'b010110   
    `define GGP                 6'b010111
    
    `define GTG                 6'b011001
    `define GTT                 6'b011010
    `define GTP                 6'b011011
    
    `define GPG                 6'b011101
    `define GPT                 6'b011110
    `define GPP                 6'b011111
    
    /***************めんどくさくなってきたぞ*************/
    
    `define TGG                 6'b100101
    `define TGT                 6'b100110
    `define TGP                 6'b100111
    
    `define TTG                 6'b101001
    `define TTT                 6'b101010
    `define TTP                 6'b101011
    
    `define TPG                 6'b101101
    `define TPT                 6'b101110
    `define TPP                 6'b101111
    
    /*****************まじでしんどい**********************/
    
    `define PGG                 6'b110101
    `define PGT                 6'b110110
    `define PGP                 6'b110111
    
    `define PTG                 6'b111001
    `define PTT                 6'b111010
    `define PTP                 6'b111011
    
    `define PPG                 6'b111101
    `define PPT                 6'b111110
    `define PPP                 6'b111111
    
    /*****************じゃんけん1人用*********************/
    
    `define G_6                 6'b000001
    `define T_6                 6'b000010
    `define P_6                 6'b000011
            
    
    
    /**************じゃんけんの勝敗判定、ドロー(D)、ノードロー(N)、勝ち(W)、負け(L)*******************/
    
    `define D                  4'b1000         //4ビット目がD or N、1,2,3ビットがそれぞれA,B,Cの勝ち負け
    `define LLW                4'b0001
    `define LWL                4'b0010
    `define LWW                4'b0011
    `define WLL                4'b0100
    `define WLW                4'b0101
    `define WWL                4'b0110
    
    /*************じゃんけん1人用*******************/
    
    `define G_4                4'b1001
    `define T_4                4'b1010
    `define P_4                4'b1011
            
    
    
    
    /**************7segLED用のやつ*********************/
    
    `define G_7seg_1           8'b11111101      //グー
    `define G_7seg_2           8'b10111011
    `define G_7seg_3           8'b00011011
            
    `define T_7seg_1           8'b00011101      //チョキ
    `define T_7seg_2           8'b00001101
    `define T_7seg_3           8'b00011101
                
    `define P_7seg_1           8'b11111101      //パー
    `define P_7seg_2           8'b00111001
    `define P_7seg_3           8'b10010011
                
    `define D_7seg_1           8'b11111101      //ドロー
    `define D_7seg_2           8'b00000011
    `define D_7seg_3           8'b10111011
    `define D_7seg_4           8'b11110001
                
    `define W_7seg             8'b10011111      //1
    `define L_7seg             8'b00000011      //0
        
`endif
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    
        
        
        
        
        
        
        
    
        
        
        
        
        
        
           
           
        
        
    
    