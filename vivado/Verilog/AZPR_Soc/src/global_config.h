`ifndef __GLOBAL_CONFIG_HEADER__      //インクルードガード
    `define __GLOBAL_CONFIG_HEADER__
    
    /***********リセット関係、正論理なら上、負論理なら下************/
    
    `define RESET_EDGE              posedge
    //`define RESET_EDGE              negedge
    
    `define RESET_ENABLE            1'b1
    //`define RESET_ENABLE            1'b0
    
    `define RESET_DISABLE           1'b0
    //`define RESET_DISABLE           1'b1
        
    `define MEM_ENABLE              1'b1
    //`define MEM_ENABLE              1'b0
        
    `define MEM_DISABLE             1'b0
    //`define MEM_DISABLE             1'b1
    
`endif
                    
        
    
        
        