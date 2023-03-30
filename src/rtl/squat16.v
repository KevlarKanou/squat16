`include "../src/rtl/squat.vh"

module squat16 (
    input                  clk                   ,
    input                  rst_n                 ,
    

    input                  BusMode               , 
    input      [23:0]      Addr                  ,
    input                  Sel                   ,
    input      [`PORT_NUM+28-1:0]    DataIn      , 
    input                  Rd_DS                 , 
    input                  Wr_RW                 ,
    output     [`PORT_NUM+28-1:0]    DataOut     ,
    output                 Rdy_Dtack             ,


    input                  rx0_soc               ,
    input      [7:0]       rx0_data              ,
    input                  rx0_clav              ,
    output                 rx0_en                ,

    input                  rx1_soc               ,
    input      [7:0]       rx1_data              ,
    input                  rx1_clav              ,
    output                 rx1_en                ,

    input                  rx2_soc               ,
    input      [7:0]       rx2_data              ,
    input                  rx2_clav              ,
    output                 rx2_en                ,

    input                  rx3_soc               ,
    input      [7:0]       rx3_data              ,
    input                  rx3_clav              ,
    output                 rx3_en                ,

    input                  rx4_soc               ,
    input      [7:0]       rx4_data              ,
    input                  rx4_clav              ,
    output                 rx4_en                ,

    input                  rx5_soc               ,
    input      [7:0]       rx5_data              ,
    input                  rx5_clav              ,
    output                 rx5_en                ,

    input                  rx6_soc               ,
    input      [7:0]       rx6_data              ,
    input                  rx6_clav              ,
    output                 rx6_en                ,

    input                  rx7_soc               ,
    input      [7:0]       rx7_data              ,
    input                  rx7_clav              ,
    output                 rx7_en                ,

    input                  rx8_soc               ,
    input      [7:0]       rx8_data              ,
    input                  rx8_clav              ,
    output                 rx8_en                ,

    input                  rx9_soc               ,
    input      [7:0]       rx9_data              ,
    input                  rx9_clav              ,
    output                 rx9_en                ,

    input                  rx10_soc               ,
    input      [7:0]       rx10_data              ,
    input                  rx10_clav              ,
    output                 rx10_en                ,

    input                  rx11_soc               ,
    input      [7:0]       rx11_data              ,
    input                  rx11_clav              ,
    output                 rx11_en                ,

    input                  rx12_soc               ,
    input      [7:0]       rx12_data              ,
    input                  rx12_clav              ,
    output                 rx12_en                ,

    input                  rx13_soc               ,
    input      [7:0]       rx13_data              ,
    input                  rx13_clav              ,
    output                 rx13_en                ,

    input                  rx14_soc               ,
    input      [7:0]       rx14_data              ,
    input                  rx14_clav              ,
    output                 rx14_en                ,

    input                  rx15_soc               ,
    input      [7:0]       rx15_data              ,
    input                  rx15_clav              ,
    output                 rx15_en                ,

    output                 tx0_soc               ,
    output     [7:0]       tx0_data              ,
    output                 tx0_en                ,
    input                  tx0_clav              ,

    output                 tx1_soc               ,
    output     [7:0]       tx1_data              ,
    output                 tx1_en                ,
    input                  tx1_clav              ,
    
    output                 tx2_soc               ,
    output     [7:0]       tx2_data              ,
    output                 tx2_en                ,
    input                  tx2_clav              ,

    output                 tx3_soc               ,
    output     [7:0]       tx3_data              ,
    output                 tx3_en                ,
    input                  tx3_clav              ,

    output                 tx4_soc               ,
    output     [7:0]       tx4_data              ,
    output                 tx4_en                ,
    input                  tx4_clav              ,

    output                 tx5_soc               ,
    output     [7:0]       tx5_data              ,
    output                 tx5_en                ,
    input                  tx5_clav              ,

    output                 tx6_soc               ,
    output     [7:0]       tx6_data              ,
    output                 tx6_en                ,
    input                  tx6_clav              ,

    output                 tx7_soc               ,
    output     [7:0]       tx7_data              ,
    output                 tx7_en                ,
    input                  tx7_clav              ,

    output                 tx8_soc               ,
    output     [7:0]       tx8_data              ,
    output                 tx8_en                ,
    input                  tx8_clav              ,

    output                 tx9_soc               ,
    output     [7:0]       tx9_data              ,
    output                 tx9_en                ,
    input                  tx9_clav              ,

    output                 tx10_soc               ,
    output     [7:0]       tx10_data              ,
    output                 tx10_en                ,
    input                  tx10_clav              ,

    output                 tx11_soc               ,
    output     [7:0]       tx11_data              ,
    output                 tx11_en                ,
    input                  tx11_clav              ,

    output                 tx12_soc               ,
    output     [7:0]       tx12_data              ,
    output                 tx12_en                ,
    input                  tx12_clav              ,

    output                 tx13_soc               ,
    output     [7:0]       tx13_data              ,
    output                 tx13_en                ,
    input                  tx13_clav              ,

    output                 tx14_soc               ,
    output     [7:0]       tx14_data              ,
    output                 tx14_en                ,
    input                  tx14_clav              ,

    output                 tx15_soc               ,
    output     [7:0]       tx15_data              ,
    output                 tx15_en                ,
    input                  tx15_clav              
);

/////////////////////////////////////////////////////////////////////////

wire    		       rx0_rxreq          ;
wire    		       rx0_rxack          ;
wire    [3:0]	       rx0_uni_GFC        ;
wire    [7:0]	       rx0_uni_VPI        ;
wire    [15:0]	       rx0_uni_VCI        ;
wire    		       rx0_uni_CLP        ;
wire    [2:0]	       rx0_uni_PT         ;
wire    [7:0]	       rx0_uni_HEC        ;
wire    [8*48-1:0]	   rx0_uni_Payload    ;


utopia1_atm_rx atm_rx0(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx0_soc            ),
                       .data           ( rx0_data           ),
                       .clav           ( rx0_clav           ),
                       .en             ( rx0_en             ),
                                 
                       .rxreq          ( rx0_rxreq          ),
                       .rxack          ( rx0_rxack          ),
                       .uni_GFC        ( rx0_uni_GFC        ),
                       .uni_VPI        ( rx0_uni_VPI        ),
                       .uni_VCI        ( rx0_uni_VCI        ),
                       .uni_CLP        ( rx0_uni_CLP        ),
                       .uni_PT         ( rx0_uni_PT         ),
                       .uni_HEC        ( rx0_uni_HEC        ),
                       .uni_Payload    ( rx0_uni_Payload    )
                            
                      );


wire    		       rx1_rxreq          ;
wire    		       rx1_rxack          ;
wire    [3:0]	       rx1_uni_GFC        ;
wire    [7:0]	       rx1_uni_VPI        ;
wire    [15:0]	       rx1_uni_VCI        ;
wire    		       rx1_uni_CLP        ;
wire    [2:0]	       rx1_uni_PT         ;
wire    [7:0]	       rx1_uni_HEC        ;
wire    [8*48-1:0]	   rx1_uni_Payload    ;

utopia1_atm_rx atm_rx1(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx1_soc            ),
                       .data           ( rx1_data           ),
                       .clav           ( rx1_clav           ),
                       .en             ( rx1_en             ),
                                 
                       .rxreq          ( rx1_rxreq          ),
                       .rxack          ( rx1_rxack          ),
                       .uni_GFC        ( rx1_uni_GFC        ),
                       .uni_VPI        ( rx1_uni_VPI        ),
                       .uni_VCI        ( rx1_uni_VCI        ),
                       .uni_CLP        ( rx1_uni_CLP        ),
                       .uni_PT         ( rx1_uni_PT         ),
                       .uni_HEC        ( rx1_uni_HEC        ),
                       .uni_Payload    ( rx1_uni_Payload    )
                            
                      );

wire    		       rx2_rxreq          ;
wire    		       rx2_rxack          ;
wire    [3:0]	       rx2_uni_GFC        ;
wire    [7:0]	       rx2_uni_VPI        ;
wire    [15:0]	       rx2_uni_VCI        ;
wire    		       rx2_uni_CLP        ;
wire    [2:0]	       rx2_uni_PT         ;
wire    [7:0]	       rx2_uni_HEC        ;
wire    [8*48-1:0]	   rx2_uni_Payload    ;

utopia1_atm_rx atm_rx2(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx2_soc            ),
                       .data           ( rx2_data           ),
                       .clav           ( rx2_clav           ),
                       .en             ( rx2_en             ),
                                 
                       .rxreq          ( rx2_rxreq          ),
                       .rxack          ( rx2_rxack          ),
                       .uni_GFC        ( rx2_uni_GFC        ),
                       .uni_VPI        ( rx2_uni_VPI        ),
                       .uni_VCI        ( rx2_uni_VCI        ),
                       .uni_CLP        ( rx2_uni_CLP        ),
                       .uni_PT         ( rx2_uni_PT         ),
                       .uni_HEC        ( rx2_uni_HEC        ),
                       .uni_Payload    ( rx2_uni_Payload    )
                            
                      );
                      
wire    		       rx3_rxreq          ;
wire    		       rx3_rxack          ;
wire    [3:0]	       rx3_uni_GFC        ;
wire    [7:0]	       rx3_uni_VPI        ;
wire    [15:0]	       rx3_uni_VCI        ;
wire    		       rx3_uni_CLP        ;
wire    [2:0]	       rx3_uni_PT         ;
wire    [7:0]	       rx3_uni_HEC        ;
wire    [8*48-1:0]	   rx3_uni_Payload    ;

utopia1_atm_rx atm_rx3(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx3_soc            ),
                       .data           ( rx3_data           ),
                       .clav           ( rx3_clav           ),
                       .en             ( rx3_en             ),
                                 
                       .rxreq          ( rx3_rxreq          ),
                       .rxack          ( rx3_rxack          ),
                       .uni_GFC        ( rx3_uni_GFC        ),
                       .uni_VPI        ( rx3_uni_VPI        ),
                       .uni_VCI        ( rx3_uni_VCI        ),
                       .uni_CLP        ( rx3_uni_CLP        ),
                       .uni_PT         ( rx3_uni_PT         ),
                       .uni_HEC        ( rx3_uni_HEC        ),
                       .uni_Payload    ( rx3_uni_Payload    )
                            
                      );

wire    		       rx4_rxreq          ;
wire    		       rx4_rxack          ;
wire    [3:0]	       rx4_uni_GFC        ;
wire    [7:0]	       rx4_uni_VPI        ;
wire    [15:0]	       rx4_uni_VCI        ;
wire    		       rx4_uni_CLP        ;
wire    [2:0]	       rx4_uni_PT         ;
wire    [7:0]	       rx4_uni_HEC        ;
wire    [8*48-1:0]	   rx4_uni_Payload    ;

utopia1_atm_rx atm_rx4(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx4_soc            ),
                       .data           ( rx4_data           ),
                       .clav           ( rx4_clav           ),
                       .en             ( rx4_en             ),
                                
                       .rxreq          ( rx4_rxreq          ),
                       .rxack          ( rx4_rxack          ),
                       .uni_GFC        ( rx4_uni_GFC        ),
                       .uni_VPI        ( rx4_uni_VPI        ),
                       .uni_VCI        ( rx4_uni_VCI        ),
                       .uni_CLP        ( rx4_uni_CLP        ),
                       .uni_PT         ( rx4_uni_PT         ),
                       .uni_HEC        ( rx4_uni_HEC        ),
                       .uni_Payload    ( rx4_uni_Payload    )
                            
                      );

wire    		       rx5_rxreq          ;
wire    		       rx5_rxack          ;
wire    [3:0]	       rx5_uni_GFC        ;
wire    [7:0]	       rx5_uni_VPI        ;
wire    [15:0]	       rx5_uni_VCI        ;
wire    		       rx5_uni_CLP        ;
wire    [2:0]	       rx5_uni_PT         ;
wire    [7:0]	       rx5_uni_HEC        ;
wire    [8*48-1:0]	   rx5_uni_Payload    ;

utopia1_atm_rx atm_rx5(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx5_soc            ),
                       .data           ( rx5_data           ),
                       .clav           ( rx5_clav           ),
                       .en             ( rx5_en             ),
                        
                       .rxreq          ( rx5_rxreq          ),
                       .rxack          ( rx5_rxack          ),
                       .uni_GFC        ( rx5_uni_GFC        ),
                       .uni_VPI        ( rx5_uni_VPI        ),
                       .uni_VCI        ( rx5_uni_VCI        ),
                       .uni_CLP        ( rx5_uni_CLP        ),
                       .uni_PT         ( rx5_uni_PT         ),
                       .uni_HEC        ( rx5_uni_HEC        ),
                       .uni_Payload    ( rx5_uni_Payload    )
                            
                      );

wire    		       rx6_rxreq          ;
wire    		       rx6_rxack          ;
wire    [3:0]	       rx6_uni_GFC        ;
wire    [7:0]	       rx6_uni_VPI        ;
wire    [15:0]	       rx6_uni_VCI        ;
wire    		       rx6_uni_CLP        ;
wire    [2:0]	       rx6_uni_PT         ;
wire    [7:0]	       rx6_uni_HEC        ;
wire    [8*48-1:0]	   rx6_uni_Payload    ;

utopia1_atm_rx atm_rx6(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx6_soc            ),
                       .data           ( rx6_data           ),
                       .clav           ( rx6_clav           ),
                       .en             ( rx6_en             ),
                        
                       .rxreq          ( rx6_rxreq          ),
                       .rxack          ( rx6_rxack          ),
                       .uni_GFC        ( rx6_uni_GFC        ),
                       .uni_VPI        ( rx6_uni_VPI        ),
                       .uni_VCI        ( rx6_uni_VCI        ),
                       .uni_CLP        ( rx6_uni_CLP        ),
                       .uni_PT         ( rx6_uni_PT         ),
                       .uni_HEC        ( rx6_uni_HEC        ),
                       .uni_Payload    ( rx6_uni_Payload    )
                            
                      );

wire    		       rx7_rxreq          ;
wire    		       rx7_rxack          ;
wire    [3:0]	       rx7_uni_GFC        ;
wire    [7:0]	       rx7_uni_VPI        ;
wire    [15:0]	       rx7_uni_VCI        ;
wire    		       rx7_uni_CLP        ;
wire    [2:0]	       rx7_uni_PT         ;
wire    [7:0]	       rx7_uni_HEC        ;
wire    [8*48-1:0]	   rx7_uni_Payload    ;

utopia1_atm_rx atm_rx7(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx7_soc            ),
                       .data           ( rx7_data           ),
                       .clav           ( rx7_clav           ),
                       .en             ( rx7_en             ),
                        
                       .rxreq          ( rx7_rxreq          ),
                       .rxack          ( rx7_rxack          ),
                       .uni_GFC        ( rx7_uni_GFC        ),
                       .uni_VPI        ( rx7_uni_VPI        ),
                       .uni_VCI        ( rx7_uni_VCI        ),
                       .uni_CLP        ( rx7_uni_CLP        ),
                       .uni_PT         ( rx7_uni_PT         ),
                       .uni_HEC        ( rx7_uni_HEC        ),
                       .uni_Payload    ( rx7_uni_Payload    )
                            
                      );

wire                   rx8_rxreq          ;
wire                   rx8_rxack          ;
wire    [3:0]          rx8_uni_GFC        ;
wire    [7:0]          rx8_uni_VPI        ;
wire    [15:0]         rx8_uni_VCI        ;
wire                   rx8_uni_CLP        ;
wire    [2:0]          rx8_uni_PT         ;
wire    [7:0]          rx8_uni_HEC        ;
wire    [8*48-1:0]     rx8_uni_Payload    ;

utopia1_atm_rx atm_rx8(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx8_soc            ),
                       .data           ( rx8_data           ),
                       .clav           ( rx8_clav           ),
                       .en             ( rx8_en             ),
                        
                       .rxreq          ( rx8_rxreq          ),
                       .rxack          ( rx8_rxack          ),
                       .uni_GFC        ( rx8_uni_GFC        ),
                       .uni_VPI        ( rx8_uni_VPI        ),
                       .uni_VCI        ( rx8_uni_VCI        ),
                       .uni_CLP        ( rx8_uni_CLP        ),
                       .uni_PT         ( rx8_uni_PT         ),
                       .uni_HEC        ( rx8_uni_HEC        ),
                       .uni_Payload    ( rx8_uni_Payload    )
                            
                      );

    

wire                   rx9_rxreq          ;
wire                   rx9_rxack          ;
wire    [3:0]          rx9_uni_GFC        ;
wire    [7:0]          rx9_uni_VPI        ;
wire    [15:0]         rx9_uni_VCI        ;
wire                   rx9_uni_CLP        ;
wire    [2:0]          rx9_uni_PT         ;
wire    [7:0]          rx9_uni_HEC        ;
wire    [8*48-1:0]     rx9_uni_Payload    ;

utopia1_atm_rx atm_rx9(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx9_soc            ),
                       .data           ( rx9_data           ),
                       .clav           ( rx9_clav           ),
                       .en             ( rx9_en             ),
                        
                       .rxreq          ( rx9_rxreq          ),
                       .rxack          ( rx9_rxack          ),
                       .uni_GFC        ( rx9_uni_GFC        ),
                       .uni_VPI        ( rx9_uni_VPI        ),
                       .uni_VCI        ( rx9_uni_VCI        ),
                       .uni_CLP        ( rx9_uni_CLP        ),
                       .uni_PT         ( rx9_uni_PT         ),
                       .uni_HEC        ( rx9_uni_HEC        ),
                       .uni_Payload    ( rx9_uni_Payload    )
                            
                      );

    

wire                   rx10_rxreq          ;
wire                   rx10_rxack          ;
wire    [3:0]          rx10_uni_GFC        ;
wire    [7:0]          rx10_uni_VPI        ;
wire    [15:0]         rx10_uni_VCI        ;
wire                   rx10_uni_CLP        ;
wire    [2:0]          rx10_uni_PT         ;
wire    [7:0]          rx10_uni_HEC        ;
wire    [8*48-1:0]     rx10_uni_Payload    ;

utopia1_atm_rx atm_rx10(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx10_soc            ),
                       .data           ( rx10_data           ),
                       .clav           ( rx10_clav           ),
                       .en             ( rx10_en             ),
                        
                       .rxreq          ( rx10_rxreq          ),
                       .rxack          ( rx10_rxack          ),
                       .uni_GFC        ( rx10_uni_GFC        ),
                       .uni_VPI        ( rx10_uni_VPI        ),
                       .uni_VCI        ( rx10_uni_VCI        ),
                       .uni_CLP        ( rx10_uni_CLP        ),
                       .uni_PT         ( rx10_uni_PT         ),
                       .uni_HEC        ( rx10_uni_HEC        ),
                       .uni_Payload    ( rx10_uni_Payload    )
                            
                      );

    

wire                   rx11_rxreq          ;
wire                   rx11_rxack          ;
wire    [3:0]          rx11_uni_GFC        ;
wire    [7:0]          rx11_uni_VPI        ;
wire    [15:0]         rx11_uni_VCI        ;
wire                   rx11_uni_CLP        ;
wire    [2:0]          rx11_uni_PT         ;
wire    [7:0]          rx11_uni_HEC        ;
wire    [8*48-1:0]     rx11_uni_Payload    ;

utopia1_atm_rx atm_rx11(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx11_soc            ),
                       .data           ( rx11_data           ),
                       .clav           ( rx11_clav           ),
                       .en             ( rx11_en             ),
                        
                       .rxreq          ( rx11_rxreq          ),
                       .rxack          ( rx11_rxack          ),
                       .uni_GFC        ( rx11_uni_GFC        ),
                       .uni_VPI        ( rx11_uni_VPI        ),
                       .uni_VCI        ( rx11_uni_VCI        ),
                       .uni_CLP        ( rx11_uni_CLP        ),
                       .uni_PT         ( rx11_uni_PT         ),
                       .uni_HEC        ( rx11_uni_HEC        ),
                       .uni_Payload    ( rx11_uni_Payload    )
                            
                      );

    

wire                           rx12_rxreq          ;
wire                           rx12_rxack          ;
wire    [3:0]          rx12_uni_GFC        ;
wire    [7:0]          rx12_uni_VPI        ;
wire    [15:0]         rx12_uni_VCI        ;
wire                           rx12_uni_CLP        ;
wire    [2:0]          rx12_uni_PT         ;
wire    [7:0]          rx12_uni_HEC        ;
wire    [8*48-1:0]         rx12_uni_Payload    ;

utopia1_atm_rx atm_rx12(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx12_soc            ),
                       .data           ( rx12_data           ),
                       .clav           ( rx12_clav           ),
                       .en             ( rx12_en             ),
                        
                       .rxreq          ( rx12_rxreq          ),
                       .rxack          ( rx12_rxack          ),
                       .uni_GFC        ( rx12_uni_GFC        ),
                       .uni_VPI        ( rx12_uni_VPI        ),
                       .uni_VCI        ( rx12_uni_VCI        ),
                       .uni_CLP        ( rx12_uni_CLP        ),
                       .uni_PT         ( rx12_uni_PT         ),
                       .uni_HEC        ( rx12_uni_HEC        ),
                       .uni_Payload    ( rx12_uni_Payload    )
                            
                      );

    

wire                           rx13_rxreq          ;
wire                           rx13_rxack          ;
wire    [3:0]          rx13_uni_GFC        ;
wire    [7:0]          rx13_uni_VPI        ;
wire    [15:0]         rx13_uni_VCI        ;
wire                           rx13_uni_CLP        ;
wire    [2:0]          rx13_uni_PT         ;
wire    [7:0]          rx13_uni_HEC        ;
wire    [8*48-1:0]         rx13_uni_Payload    ;

utopia1_atm_rx atm_rx13(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx13_soc            ),
                       .data           ( rx13_data           ),
                       .clav           ( rx13_clav           ),
                       .en             ( rx13_en             ),
                        
                       .rxreq          ( rx13_rxreq          ),
                       .rxack          ( rx13_rxack          ),
                       .uni_GFC        ( rx13_uni_GFC        ),
                       .uni_VPI        ( rx13_uni_VPI        ),
                       .uni_VCI        ( rx13_uni_VCI        ),
                       .uni_CLP        ( rx13_uni_CLP        ),
                       .uni_PT         ( rx13_uni_PT         ),
                       .uni_HEC        ( rx13_uni_HEC        ),
                       .uni_Payload    ( rx13_uni_Payload    )
                            
                      );

    

wire                           rx14_rxreq          ;
wire                           rx14_rxack          ;
wire    [3:0]          rx14_uni_GFC        ;
wire    [7:0]          rx14_uni_VPI        ;
wire    [15:0]         rx14_uni_VCI        ;
wire                           rx14_uni_CLP        ;
wire    [2:0]          rx14_uni_PT         ;
wire    [7:0]          rx14_uni_HEC        ;
wire    [8*48-1:0]         rx14_uni_Payload    ;

utopia1_atm_rx atm_rx14(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx14_soc            ),
                       .data           ( rx14_data           ),
                       .clav           ( rx14_clav           ),
                       .en             ( rx14_en             ),
                        
                       .rxreq          ( rx14_rxreq          ),
                       .rxack          ( rx14_rxack          ),
                       .uni_GFC        ( rx14_uni_GFC        ),
                       .uni_VPI        ( rx14_uni_VPI        ),
                       .uni_VCI        ( rx14_uni_VCI        ),
                       .uni_CLP        ( rx14_uni_CLP        ),
                       .uni_PT         ( rx14_uni_PT         ),
                       .uni_HEC        ( rx14_uni_HEC        ),
                       .uni_Payload    ( rx14_uni_Payload    )
                            
                      );

    

wire                           rx15_rxreq          ;
wire                           rx15_rxack          ;
wire    [3:0]          rx15_uni_GFC        ;
wire    [7:0]          rx15_uni_VPI        ;
wire    [15:0]         rx15_uni_VCI        ;
wire                           rx15_uni_CLP        ;
wire    [2:0]          rx15_uni_PT         ;
wire    [7:0]          rx15_uni_HEC        ;
wire    [8*48-1:0]         rx15_uni_Payload    ;

utopia1_atm_rx atm_rx15(
                       .clk            ( clk                ),
                       .rst_n          ( rst_n              ),
                         
                       .soc            ( rx15_soc            ),
                       .data           ( rx15_data           ),
                       .clav           ( rx15_clav           ),
                       .en             ( rx15_en             ),
                        
                       .rxreq          ( rx15_rxreq          ),
                       .rxack          ( rx15_rxack          ),
                       .uni_GFC        ( rx15_uni_GFC        ),
                       .uni_VPI        ( rx15_uni_VPI        ),
                       .uni_VCI        ( rx15_uni_VCI        ),
                       .uni_CLP        ( rx15_uni_CLP        ),
                       .uni_PT         ( rx15_uni_PT         ),
                       .uni_HEC        ( rx15_uni_HEC        ),
                       .uni_Payload    ( rx15_uni_Payload    )
                            
                      );

/////////////////////////////////////////////////////////////////////////


wire                   tx0_txreq              ;
wire                   tx0_txack              ;
   
wire       [11:0]      tx0_nni_VPI            ;
wire       [15:0]      tx0_nni_VCI            ;
wire                   tx0_nni_CLP            ;
wire       [2:0]       tx0_nni_PT             ;
wire       [7:0]       tx0_nni_HEC            ;
wire       [8*48-1:0]  tx0_nni_Payload        ;

utopia1_atm_tx atm_tx0(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx0_soc                ),
                      .data               ( tx0_data               ),
                      .en                 ( tx0_en                 ),
                      .clav               ( tx0_clav               ),
                     
                      .txreq              ( tx0_txreq              ),
                      .txack              ( tx0_txack              ),
                         
                      .nni_VPI            ( tx0_nni_VPI            ),
                      .nni_VCI            ( tx0_nni_VCI            ),
                      .nni_CLP            ( tx0_nni_CLP            ),
                      .nni_PT             ( tx0_nni_PT             ),
                      .nni_HEC            ( tx0_nni_HEC            ),
                      .nni_Payload        ( tx0_nni_Payload        )

                      );


wire                   tx1_txreq              ;
wire                   tx1_txack              ;
   
wire       [11:0]      tx1_nni_VPI            ;
wire       [15:0]      tx1_nni_VCI            ;
wire                   tx1_nni_CLP            ;
wire       [2:0]       tx1_nni_PT             ;
wire       [7:0]       tx1_nni_HEC            ;
wire       [8*48-1:0]  tx1_nni_Payload        ;

utopia1_atm_tx atm_tx1(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx1_soc                ),
                      .data               ( tx1_data               ),
                      .en                 ( tx1_en                 ),
                      .clav               ( tx1_clav               ),
                     
                      .txreq              ( tx1_txreq              ),
                      .txack              ( tx1_txack              ),
                         
                      .nni_VPI            ( tx1_nni_VPI            ),
                      .nni_VCI            ( tx1_nni_VCI            ),
                      .nni_CLP            ( tx1_nni_CLP            ),
                      .nni_PT             ( tx1_nni_PT             ),
                      .nni_HEC            ( tx1_nni_HEC            ),
                      .nni_Payload        ( tx1_nni_Payload        )

                      );
                      
                      
wire                   tx2_txreq              ;
wire                   tx2_txack              ;
   
wire       [11:0]      tx2_nni_VPI            ;
wire       [15:0]      tx2_nni_VCI            ;
wire                   tx2_nni_CLP            ;
wire       [2:0]       tx2_nni_PT             ;
wire       [7:0]       tx2_nni_HEC            ;
wire       [8*48-1:0]  tx2_nni_Payload        ;

utopia1_atm_tx atm_tx2(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx2_soc                ),
                      .data               ( tx2_data               ),
                      .en                 ( tx2_en                 ),
                      .clav               ( tx2_clav               ),
                     
                      .txreq              ( tx2_txreq              ),
                      .txack              ( tx2_txack              ),
                         
                      .nni_VPI            ( tx2_nni_VPI            ),
                      .nni_VCI            ( tx2_nni_VCI            ),
                      .nni_CLP            ( tx2_nni_CLP            ),
                      .nni_PT             ( tx2_nni_PT             ),
                      .nni_HEC            ( tx2_nni_HEC            ),
                      .nni_Payload        ( tx2_nni_Payload        )

                      );
                      
                      
wire                   tx3_txreq              ;
wire                   tx3_txack              ;
   
wire       [11:0]      tx3_nni_VPI            ;
wire       [15:0]      tx3_nni_VCI            ;
wire                   tx3_nni_CLP            ;
wire       [2:0]       tx3_nni_PT             ;
wire       [7:0]       tx3_nni_HEC            ;
wire       [8*48-1:0]  tx3_nni_Payload        ;

utopia1_atm_tx atm_tx3(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx3_soc                ),
                      .data               ( tx3_data               ),
                      .en                 ( tx3_en                 ),
                      .clav               ( tx3_clav               ),
                     
                      .txreq              ( tx3_txreq              ),
                      .txack              ( tx3_txack              ),
                         
                      .nni_VPI            ( tx3_nni_VPI            ),
                      .nni_VCI            ( tx3_nni_VCI            ),
                      .nni_CLP            ( tx3_nni_CLP            ),
                      .nni_PT             ( tx3_nni_PT             ),
                      .nni_HEC            ( tx3_nni_HEC            ),
                      .nni_Payload        ( tx3_nni_Payload        )

                      );

wire                   tx4_txreq              ;
wire                   tx4_txack              ;
   
wire       [11:0]      tx4_nni_VPI            ;
wire       [15:0]      tx4_nni_VCI            ;
wire                   tx4_nni_CLP            ;
wire       [2:0]       tx4_nni_PT             ;
wire       [7:0]       tx4_nni_HEC            ;
wire       [8*48-1:0]  tx4_nni_Payload        ;

utopia1_atm_tx atm_tx4(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx4_soc                ),
                      .data               ( tx4_data               ),
                      .en                 ( tx4_en                 ),
                      .clav               ( tx4_clav               ),
                    
                      .txreq              ( tx4_txreq              ),
                      .txack              ( tx4_txack              ),

                      .nni_VPI            ( tx4_nni_VPI            ),
                      .nni_VCI            ( tx4_nni_VCI            ),
                      .nni_CLP            ( tx4_nni_CLP            ),
                      .nni_PT             ( tx4_nni_PT             ),
                      .nni_HEC            ( tx4_nni_HEC            ),
                      .nni_Payload        ( tx4_nni_Payload        )

                      );

wire                   tx5_txreq              ;
wire                   tx5_txack              ;
   
wire       [11:0]      tx5_nni_VPI            ;
wire       [15:0]      tx5_nni_VCI            ;
wire                   tx5_nni_CLP            ;
wire       [2:0]       tx5_nni_PT             ;
wire       [7:0]       tx5_nni_HEC            ;
wire       [8*48-1:0]  tx5_nni_Payload        ;

utopia1_atm_tx atm_tx5(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx5_soc                ),
                      .data               ( tx5_data               ),
                      .en                 ( tx5_en                 ),
                      .clav               ( tx5_clav               ),
                    
                      .txreq              ( tx5_txreq              ),
                      .txack              ( tx5_txack              ),

                      .nni_VPI            ( tx5_nni_VPI            ),
                      .nni_VCI            ( tx5_nni_VCI            ),
                      .nni_CLP            ( tx5_nni_CLP            ),
                      .nni_PT             ( tx5_nni_PT             ),
                      .nni_HEC            ( tx5_nni_HEC            ),
                      .nni_Payload        ( tx5_nni_Payload        )

                      );

wire                   tx6_txreq              ;
wire                   tx6_txack              ;
   
wire       [11:0]      tx6_nni_VPI            ;
wire       [15:0]      tx6_nni_VCI            ;
wire                   tx6_nni_CLP            ;
wire       [2:0]       tx6_nni_PT             ;
wire       [7:0]       tx6_nni_HEC            ;
wire       [8*48-1:0]  tx6_nni_Payload        ;

utopia1_atm_tx atm_tx6(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx6_soc                ),
                      .data               ( tx6_data               ),
                      .en                 ( tx6_en                 ),
                      .clav               ( tx6_clav               ),
                    
                      .txreq              ( tx6_txreq              ),
                      .txack              ( tx6_txack              ),

                      .nni_VPI            ( tx6_nni_VPI            ),
                      .nni_VCI            ( tx6_nni_VCI            ),
                      .nni_CLP            ( tx6_nni_CLP            ),
                      .nni_PT             ( tx6_nni_PT             ),
                      .nni_HEC            ( tx6_nni_HEC            ),
                      .nni_Payload        ( tx6_nni_Payload        )

                      );

wire                   tx7_txreq              ;
wire                   tx7_txack              ;
   
wire       [11:0]      tx7_nni_VPI            ;
wire       [15:0]      tx7_nni_VCI            ;
wire                   tx7_nni_CLP            ;
wire       [2:0]       tx7_nni_PT             ;
wire       [7:0]       tx7_nni_HEC            ;
wire       [8*48-1:0]  tx7_nni_Payload        ;

utopia1_atm_tx atm_tx7(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx7_soc                ),
                      .data               ( tx7_data               ),
                      .en                 ( tx7_en                 ),
                      .clav               ( tx7_clav               ),
                    
                      .txreq              ( tx7_txreq              ),
                      .txack              ( tx7_txack              ),

                      .nni_VPI            ( tx7_nni_VPI            ),
                      .nni_VCI            ( tx7_nni_VCI            ),
                      .nni_CLP            ( tx7_nni_CLP            ),
                      .nni_PT             ( tx7_nni_PT             ),
                      .nni_HEC            ( tx7_nni_HEC            ),
                      .nni_Payload        ( tx7_nni_Payload        )

                      );

wire                   tx8_txreq              ;
wire                   tx8_txack              ;
   
wire       [11:0]      tx8_nni_VPI            ;
wire       [15:0]      tx8_nni_VCI            ;
wire                   tx8_nni_CLP            ;
wire       [2:0]       tx8_nni_PT             ;
wire       [7:0]       tx8_nni_HEC            ;
wire       [8*48-1:0]  tx8_nni_Payload        ;

utopia1_atm_tx atm_tx8(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx8_soc                ),
                      .data               ( tx8_data               ),
                      .en                 ( tx8_en                 ),
                      .clav               ( tx8_clav               ),
                    
                      .txreq              ( tx8_txreq              ),
                      .txack              ( tx8_txack              ),

                      .nni_VPI            ( tx8_nni_VPI            ),
                      .nni_VCI            ( tx8_nni_VCI            ),
                      .nni_CLP            ( tx8_nni_CLP            ),
                      .nni_PT             ( tx8_nni_PT             ),
                      .nni_HEC            ( tx8_nni_HEC            ),
                      .nni_Payload        ( tx8_nni_Payload        )

                      );

wire                   tx9_txreq              ;
wire                   tx9_txack              ;
   
wire       [11:0]      tx9_nni_VPI            ;
wire       [15:0]      tx9_nni_VCI            ;
wire                   tx9_nni_CLP            ;
wire       [2:0]       tx9_nni_PT             ;
wire       [7:0]       tx9_nni_HEC            ;
wire       [8*48-1:0]  tx9_nni_Payload        ;

utopia1_atm_tx atm_tx9(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx9_soc                ),
                      .data               ( tx9_data               ),
                      .en                 ( tx9_en                 ),
                      .clav               ( tx9_clav               ),
                    
                      .txreq              ( tx9_txreq              ),
                      .txack              ( tx9_txack              ),

                      .nni_VPI            ( tx9_nni_VPI            ),
                      .nni_VCI            ( tx9_nni_VCI            ),
                      .nni_CLP            ( tx9_nni_CLP            ),
                      .nni_PT             ( tx9_nni_PT             ),
                      .nni_HEC            ( tx9_nni_HEC            ),
                      .nni_Payload        ( tx9_nni_Payload        )

                      );

wire                   tx10_txreq              ;
wire                   tx10_txack              ;
   
wire       [11:0]      tx10_nni_VPI            ;
wire       [15:0]      tx10_nni_VCI            ;
wire                   tx10_nni_CLP            ;
wire       [2:0]       tx10_nni_PT             ;
wire       [7:0]       tx10_nni_HEC            ;
wire       [8*48-1:0]  tx10_nni_Payload        ;

utopia1_atm_tx atm_tx10(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx10_soc                ),
                      .data               ( tx10_data               ),
                      .en                 ( tx10_en                 ),
                      .clav               ( tx10_clav               ),
                    
                      .txreq              ( tx10_txreq              ),
                      .txack              ( tx10_txack              ),

                      .nni_VPI            ( tx10_nni_VPI            ),
                      .nni_VCI            ( tx10_nni_VCI            ),
                      .nni_CLP            ( tx10_nni_CLP            ),
                      .nni_PT             ( tx10_nni_PT             ),
                      .nni_HEC            ( tx10_nni_HEC            ),
                      .nni_Payload        ( tx10_nni_Payload        )

                      );

wire                   tx11_txreq              ;
wire                   tx11_txack              ;
   
wire       [11:0]      tx11_nni_VPI            ;
wire       [15:0]      tx11_nni_VCI            ;
wire                   tx11_nni_CLP            ;
wire       [2:0]       tx11_nni_PT             ;
wire       [7:0]       tx11_nni_HEC            ;
wire       [8*48-1:0]  tx11_nni_Payload        ;

utopia1_atm_tx atm_tx11(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx11_soc                ),
                      .data               ( tx11_data               ),
                      .en                 ( tx11_en                 ),
                      .clav               ( tx11_clav               ),
                    
                      .txreq              ( tx11_txreq              ),
                      .txack              ( tx11_txack              ),

                      .nni_VPI            ( tx11_nni_VPI            ),
                      .nni_VCI            ( tx11_nni_VCI            ),
                      .nni_CLP            ( tx11_nni_CLP            ),
                      .nni_PT             ( tx11_nni_PT             ),
                      .nni_HEC            ( tx11_nni_HEC            ),
                      .nni_Payload        ( tx11_nni_Payload        )

                      );

wire                   tx12_txreq              ;
wire                   tx12_txack              ;
   
wire       [11:0]      tx12_nni_VPI            ;
wire       [15:0]      tx12_nni_VCI            ;
wire                   tx12_nni_CLP            ;
wire       [2:0]       tx12_nni_PT             ;
wire       [7:0]       tx12_nni_HEC            ;
wire       [8*48-1:0]  tx12_nni_Payload        ;

utopia1_atm_tx atm_tx12(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx12_soc                ),
                      .data               ( tx12_data               ),
                      .en                 ( tx12_en                 ),
                      .clav               ( tx12_clav               ),
                    
                      .txreq              ( tx12_txreq              ),
                      .txack              ( tx12_txack              ),

                      .nni_VPI            ( tx12_nni_VPI            ),
                      .nni_VCI            ( tx12_nni_VCI            ),
                      .nni_CLP            ( tx12_nni_CLP            ),
                      .nni_PT             ( tx12_nni_PT             ),
                      .nni_HEC            ( tx12_nni_HEC            ),
                      .nni_Payload        ( tx12_nni_Payload        )

                      );

wire                   tx13_txreq              ;
wire                   tx13_txack              ;
   
wire       [11:0]      tx13_nni_VPI            ;
wire       [15:0]      tx13_nni_VCI            ;
wire                   tx13_nni_CLP            ;
wire       [2:0]       tx13_nni_PT             ;
wire       [7:0]       tx13_nni_HEC            ;
wire       [8*48-1:0]  tx13_nni_Payload        ;

utopia1_atm_tx atm_tx13(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx13_soc                ),
                      .data               ( tx13_data               ),
                      .en                 ( tx13_en                 ),
                      .clav               ( tx13_clav               ),
                    
                      .txreq              ( tx13_txreq              ),
                      .txack              ( tx13_txack              ),

                      .nni_VPI            ( tx13_nni_VPI            ),
                      .nni_VCI            ( tx13_nni_VCI            ),
                      .nni_CLP            ( tx13_nni_CLP            ),
                      .nni_PT             ( tx13_nni_PT             ),
                      .nni_HEC            ( tx13_nni_HEC            ),
                      .nni_Payload        ( tx13_nni_Payload        )

                      );

wire                   tx14_txreq              ;
wire                   tx14_txack              ;
   
wire       [11:0]      tx14_nni_VPI            ;
wire       [15:0]      tx14_nni_VCI            ;
wire                   tx14_nni_CLP            ;
wire       [2:0]       tx14_nni_PT             ;
wire       [7:0]       tx14_nni_HEC            ;
wire       [8*48-1:0]  tx14_nni_Payload        ;

utopia1_atm_tx atm_tx14(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx14_soc                ),
                      .data               ( tx14_data               ),
                      .en                 ( tx14_en                 ),
                      .clav               ( tx14_clav               ),
                    
                      .txreq              ( tx14_txreq              ),
                      .txack              ( tx14_txack              ),

                      .nni_VPI            ( tx14_nni_VPI            ),
                      .nni_VCI            ( tx14_nni_VCI            ),
                      .nni_CLP            ( tx14_nni_CLP            ),
                      .nni_PT             ( tx14_nni_PT             ),
                      .nni_HEC            ( tx14_nni_HEC            ),
                      .nni_Payload        ( tx14_nni_Payload        )

                      );

wire                   tx15_txreq              ;
wire                   tx15_txack              ;
   
wire       [11:0]      tx15_nni_VPI            ;
wire       [15:0]      tx15_nni_VCI            ;
wire                   tx15_nni_CLP            ;
wire       [2:0]       tx15_nni_PT             ;
wire       [7:0]       tx15_nni_HEC            ;
wire       [8*48-1:0]  tx15_nni_Payload        ;

utopia1_atm_tx atm_tx15(
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                     
                      .soc                ( tx15_soc                ),
                      .data               ( tx15_data               ),
                      .en                 ( tx15_en                 ),
                      .clav               ( tx15_clav               ),
                    
                      .txreq              ( tx15_txreq              ),
                      .txack              ( tx15_txack              ),

                      .nni_VPI            ( tx15_nni_VPI            ),
                      .nni_VCI            ( tx15_nni_VCI            ),
                      .nni_CLP            ( tx15_nni_CLP            ),
                      .nni_PT             ( tx15_nni_PT             ),
                      .nni_HEC            ( tx15_nni_HEC            ),
                      .nni_Payload        ( tx15_nni_Payload        )

                      );

/////////////////////////////////////////////////////////////////////////

wire                                fwd_rden   ;
wire         [23:0]                 fwd_addr   ;
wire         [`PORT_NUM+28-1:0]     fwd_data   ;


FwdLkp     fwdtable  (
                      .clk                ( clk                    ),
                      .rst_n              ( rst_n                  ),
                      
                      .BusMode            ( BusMode                ), 
                      .Addr               ( Addr                   ), 
                      .Sel                ( Sel                    ), 
                      .DataIn             ( DataIn                 ), 
                      .Rd_DS              ( Rd_DS                  ), 
                      .Wr_RW              ( Wr_RW                  ),
                      .DataOut            ( DataOut                ), 
                      .Rdy_Dtack          ( Rdy_Dtack              ),
                                   
                      .fwd_rden           ( fwd_rden               ),
                      .fwd_addr           ( fwd_addr               ),
                      .fwd_data           ( fwd_data               )
            
                      );



/////////////////////////////////////////////////////////////////////////

arbitor u_arbitor(
    .clk              		( clk              		),
    .rst_n            		( rst_n            		),
    .fwd_rden         		( fwd_rden         		),
    .fwd_addr         		( fwd_addr         		),
    .fwd_data         		( fwd_data         		),
    .rx0_rxreq        		( rx0_rxreq        		),
    .rx0_rxack        		( rx0_rxack        		),
    .rx0_uni_GFC      		( rx0_uni_GFC      		),
    .rx0_uni_VPI      		( rx0_uni_VPI      		),
    .rx0_uni_VCI      		( rx0_uni_VCI      		),
    .rx0_uni_CLP      		( rx0_uni_CLP      		),
    .rx0_uni_PT       		( rx0_uni_PT       		),
    .rx0_uni_HEC      		( rx0_uni_HEC      		),
    .rx0_uni_Payload  		( rx0_uni_Payload  		),
    .rx1_rxreq        		( rx1_rxreq        		),
    .rx1_rxack        		( rx1_rxack        		),
    .rx1_uni_GFC      		( rx1_uni_GFC      		),
    .rx1_uni_VPI      		( rx1_uni_VPI      		),
    .rx1_uni_VCI      		( rx1_uni_VCI      		),
    .rx1_uni_CLP      		( rx1_uni_CLP      		),
    .rx1_uni_PT       		( rx1_uni_PT       		),
    .rx1_uni_HEC      		( rx1_uni_HEC      		),
    .rx1_uni_Payload  		( rx1_uni_Payload  		),
    .rx2_rxreq        		( rx2_rxreq        		),
    .rx2_rxack        		( rx2_rxack        		),
    .rx2_uni_GFC      		( rx2_uni_GFC      		),
    .rx2_uni_VPI      		( rx2_uni_VPI      		),
    .rx2_uni_VCI      		( rx2_uni_VCI      		),
    .rx2_uni_CLP      		( rx2_uni_CLP      		),
    .rx2_uni_PT       		( rx2_uni_PT       		),
    .rx2_uni_HEC      		( rx2_uni_HEC      		),
    .rx2_uni_Payload  		( rx2_uni_Payload  		),
    .rx3_rxreq        		( rx3_rxreq        		),
    .rx3_rxack        		( rx3_rxack        		),
    .rx3_uni_GFC      		( rx3_uni_GFC      		),
    .rx3_uni_VPI      		( rx3_uni_VPI      		),
    .rx3_uni_VCI      		( rx3_uni_VCI      		),
    .rx3_uni_CLP      		( rx3_uni_CLP      		),
    .rx3_uni_PT       		( rx3_uni_PT       		),
    .rx3_uni_HEC      		( rx3_uni_HEC      		),
    .rx3_uni_Payload  		( rx3_uni_Payload  		),
    .rx4_rxreq        		( rx4_rxreq        		),
    .rx4_rxack        		( rx4_rxack        		),
    .rx4_uni_GFC      		( rx4_uni_GFC      		),
    .rx4_uni_VPI      		( rx4_uni_VPI      		),
    .rx4_uni_VCI      		( rx4_uni_VCI      		),
    .rx4_uni_CLP      		( rx4_uni_CLP      		),
    .rx4_uni_PT       		( rx4_uni_PT       		),
    .rx4_uni_HEC      		( rx4_uni_HEC      		),
    .rx4_uni_Payload  		( rx4_uni_Payload  		),
    .rx5_rxreq        		( rx5_rxreq        		),
    .rx5_rxack        		( rx5_rxack        		),
    .rx5_uni_GFC      		( rx5_uni_GFC      		),
    .rx5_uni_VPI      		( rx5_uni_VPI      		),
    .rx5_uni_VCI      		( rx5_uni_VCI      		),
    .rx5_uni_CLP      		( rx5_uni_CLP      		),
    .rx5_uni_PT       		( rx5_uni_PT       		),
    .rx5_uni_HEC      		( rx5_uni_HEC      		),
    .rx5_uni_Payload  		( rx5_uni_Payload  		),
    .rx6_rxreq        		( rx6_rxreq        		),
    .rx6_rxack        		( rx6_rxack        		),
    .rx6_uni_GFC      		( rx6_uni_GFC      		),
    .rx6_uni_VPI      		( rx6_uni_VPI      		),
    .rx6_uni_VCI      		( rx6_uni_VCI      		),
    .rx6_uni_CLP      		( rx6_uni_CLP      		),
    .rx6_uni_PT       		( rx6_uni_PT       		),
    .rx6_uni_HEC      		( rx6_uni_HEC      		),
    .rx6_uni_Payload  		( rx6_uni_Payload  		),
    .rx7_rxreq        		( rx7_rxreq        		),
    .rx7_rxack        		( rx7_rxack        		),
    .rx7_uni_GFC      		( rx7_uni_GFC      		),
    .rx7_uni_VPI      		( rx7_uni_VPI      		),
    .rx7_uni_VCI      		( rx7_uni_VCI      		),
    .rx7_uni_CLP      		( rx7_uni_CLP      		),
    .rx7_uni_PT       		( rx7_uni_PT       		),
    .rx7_uni_HEC      		( rx7_uni_HEC      		),
    .rx7_uni_Payload  		( rx7_uni_Payload  		),
    .rx8_rxreq        		( rx8_rxreq        		),
    .rx8_rxack        		( rx8_rxack        		),
    .rx8_uni_GFC      		( rx8_uni_GFC      		),
    .rx8_uni_VPI      		( rx8_uni_VPI      		),
    .rx8_uni_VCI      		( rx8_uni_VCI      		),
    .rx8_uni_CLP      		( rx8_uni_CLP      		),
    .rx8_uni_PT       		( rx8_uni_PT       		),
    .rx8_uni_HEC      		( rx8_uni_HEC      		),
    .rx8_uni_Payload  		( rx8_uni_Payload  		),
    .rx9_rxreq        		( rx9_rxreq        		),
    .rx9_rxack        		( rx9_rxack        		),
    .rx9_uni_GFC      		( rx9_uni_GFC      		),
    .rx9_uni_VPI      		( rx9_uni_VPI      		),
    .rx9_uni_VCI      		( rx9_uni_VCI      		),
    .rx9_uni_CLP      		( rx9_uni_CLP      		),
    .rx9_uni_PT       		( rx9_uni_PT       		),
    .rx9_uni_HEC      		( rx9_uni_HEC      		),
    .rx9_uni_Payload  		( rx9_uni_Payload  		),
    .rx10_rxreq       		( rx10_rxreq       		),
    .rx10_rxack       		( rx10_rxack       		),
    .rx10_uni_GFC     		( rx10_uni_GFC     		),
    .rx10_uni_VPI     		( rx10_uni_VPI     		),
    .rx10_uni_VCI     		( rx10_uni_VCI     		),
    .rx10_uni_CLP     		( rx10_uni_CLP     		),
    .rx10_uni_PT      		( rx10_uni_PT      		),
    .rx10_uni_HEC     		( rx10_uni_HEC     		),
    .rx10_uni_Payload 		( rx10_uni_Payload 		),
    .rx11_rxreq       		( rx11_rxreq       		),
    .rx11_rxack       		( rx11_rxack       		),
    .rx11_uni_GFC     		( rx11_uni_GFC     		),
    .rx11_uni_VPI     		( rx11_uni_VPI     		),
    .rx11_uni_VCI     		( rx11_uni_VCI     		),
    .rx11_uni_CLP     		( rx11_uni_CLP     		),
    .rx11_uni_PT      		( rx11_uni_PT      		),
    .rx11_uni_HEC     		( rx11_uni_HEC     		),
    .rx11_uni_Payload 		( rx11_uni_Payload 		),
    .rx12_rxreq       		( rx12_rxreq       		),
    .rx12_rxack       		( rx12_rxack       		),
    .rx12_uni_GFC     		( rx12_uni_GFC     		),
    .rx12_uni_VPI     		( rx12_uni_VPI     		),
    .rx12_uni_VCI     		( rx12_uni_VCI     		),
    .rx12_uni_CLP     		( rx12_uni_CLP     		),
    .rx12_uni_PT      		( rx12_uni_PT      		),
    .rx12_uni_HEC     		( rx12_uni_HEC     		),
    .rx12_uni_Payload 		( rx12_uni_Payload 		),
    .rx13_rxreq       		( rx13_rxreq       		),
    .rx13_rxack       		( rx13_rxack       		),
    .rx13_uni_GFC     		( rx13_uni_GFC     		),
    .rx13_uni_VPI     		( rx13_uni_VPI     		),
    .rx13_uni_VCI     		( rx13_uni_VCI     		),
    .rx13_uni_CLP     		( rx13_uni_CLP     		),
    .rx13_uni_PT      		( rx13_uni_PT      		),
    .rx13_uni_HEC     		( rx13_uni_HEC     		),
    .rx13_uni_Payload 		( rx13_uni_Payload 		),
    .rx14_rxreq       		( rx14_rxreq       		),
    .rx14_rxack       		( rx14_rxack       		),
    .rx14_uni_GFC     		( rx14_uni_GFC     		),
    .rx14_uni_VPI     		( rx14_uni_VPI     		),
    .rx14_uni_VCI     		( rx14_uni_VCI     		),
    .rx14_uni_CLP     		( rx14_uni_CLP     		),
    .rx14_uni_PT      		( rx14_uni_PT      		),
    .rx14_uni_HEC     		( rx14_uni_HEC     		),
    .rx14_uni_Payload 		( rx14_uni_Payload 		),
    .rx15_rxreq       		( rx15_rxreq       		),
    .rx15_rxack       		( rx15_rxack       		),
    .rx15_uni_GFC     		( rx15_uni_GFC     		),
    .rx15_uni_VPI     		( rx15_uni_VPI     		),
    .rx15_uni_VCI     		( rx15_uni_VCI     		),
    .rx15_uni_CLP     		( rx15_uni_CLP     		),
    .rx15_uni_PT      		( rx15_uni_PT      		),
    .rx15_uni_HEC     		( rx15_uni_HEC     		),
    .rx15_uni_Payload 		( rx15_uni_Payload 		),
    .tx0_txreq        		( tx0_txreq        		),
    .tx0_txack        		( tx0_txack        		),
    .tx0_nni_VPI      		( tx0_nni_VPI      		),
    .tx0_nni_VCI      		( tx0_nni_VCI      		),
    .tx0_nni_CLP      		( tx0_nni_CLP      		),
    .tx0_nni_PT       		( tx0_nni_PT       		),
    .tx0_nni_HEC      		( tx0_nni_HEC      		),
    .tx0_nni_Payload  		( tx0_nni_Payload  		),
    .tx1_txreq        		( tx1_txreq        		),
    .tx1_txack        		( tx1_txack        		),
    .tx1_nni_VPI      		( tx1_nni_VPI      		),
    .tx1_nni_VCI      		( tx1_nni_VCI      		),
    .tx1_nni_CLP      		( tx1_nni_CLP      		),
    .tx1_nni_PT       		( tx1_nni_PT       		),
    .tx1_nni_HEC      		( tx1_nni_HEC      		),
    .tx1_nni_Payload  		( tx1_nni_Payload  		),
    .tx2_txreq        		( tx2_txreq        		),
    .tx2_txack        		( tx2_txack        		),
    .tx2_nni_VPI      		( tx2_nni_VPI      		),
    .tx2_nni_VCI      		( tx2_nni_VCI      		),
    .tx2_nni_CLP      		( tx2_nni_CLP      		),
    .tx2_nni_PT       		( tx2_nni_PT       		),
    .tx2_nni_HEC      		( tx2_nni_HEC      		),
    .tx2_nni_Payload  		( tx2_nni_Payload  		),
    .tx3_txreq        		( tx3_txreq        		),
    .tx3_txack        		( tx3_txack        		),
    .tx3_nni_VPI      		( tx3_nni_VPI      		),
    .tx3_nni_VCI      		( tx3_nni_VCI      		),
    .tx3_nni_CLP      		( tx3_nni_CLP      		),
    .tx3_nni_PT       		( tx3_nni_PT       		),
    .tx3_nni_HEC      		( tx3_nni_HEC      		),
    .tx3_nni_Payload  		( tx3_nni_Payload  		),
    .tx4_txreq        		( tx4_txreq        		),
    .tx4_txack        		( tx4_txack        		),
    .tx4_nni_VPI      		( tx4_nni_VPI      		),
    .tx4_nni_VCI      		( tx4_nni_VCI      		),
    .tx4_nni_CLP      		( tx4_nni_CLP      		),
    .tx4_nni_PT       		( tx4_nni_PT       		),
    .tx4_nni_HEC      		( tx4_nni_HEC      		),
    .tx4_nni_Payload  		( tx4_nni_Payload  		),
    .tx5_txreq        		( tx5_txreq        		),
    .tx5_txack        		( tx5_txack        		),
    .tx5_nni_VPI      		( tx5_nni_VPI      		),
    .tx5_nni_VCI      		( tx5_nni_VCI      		),
    .tx5_nni_CLP      		( tx5_nni_CLP      		),
    .tx5_nni_PT       		( tx5_nni_PT       		),
    .tx5_nni_HEC      		( tx5_nni_HEC      		),
    .tx5_nni_Payload  		( tx5_nni_Payload  		),
    .tx6_txreq        		( tx6_txreq        		),
    .tx6_txack        		( tx6_txack        		),
    .tx6_nni_VPI      		( tx6_nni_VPI      		),
    .tx6_nni_VCI      		( tx6_nni_VCI      		),
    .tx6_nni_CLP      		( tx6_nni_CLP      		),
    .tx6_nni_PT       		( tx6_nni_PT       		),
    .tx6_nni_HEC      		( tx6_nni_HEC      		),
    .tx6_nni_Payload  		( tx6_nni_Payload  		),
    .tx7_txreq        		( tx7_txreq        		),
    .tx7_txack        		( tx7_txack        		),
    .tx7_nni_VPI      		( tx7_nni_VPI      		),
    .tx7_nni_VCI      		( tx7_nni_VCI      		),
    .tx7_nni_CLP      		( tx7_nni_CLP      		),
    .tx7_nni_PT       		( tx7_nni_PT       		),
    .tx7_nni_HEC      		( tx7_nni_HEC      		),
    .tx7_nni_Payload  		( tx7_nni_Payload  		),
    .tx8_txreq        		( tx8_txreq        		),
    .tx8_txack        		( tx8_txack        		),
    .tx8_nni_VPI      		( tx8_nni_VPI      		),
    .tx8_nni_VCI      		( tx8_nni_VCI      		),
    .tx8_nni_CLP      		( tx8_nni_CLP      		),
    .tx8_nni_PT       		( tx8_nni_PT       		),
    .tx8_nni_HEC      		( tx8_nni_HEC      		),
    .tx8_nni_Payload  		( tx8_nni_Payload  		),
    .tx9_txreq        		( tx9_txreq        		),
    .tx9_txack        		( tx9_txack        		),
    .tx9_nni_VPI      		( tx9_nni_VPI      		),
    .tx9_nni_VCI      		( tx9_nni_VCI      		),
    .tx9_nni_CLP      		( tx9_nni_CLP      		),
    .tx9_nni_PT       		( tx9_nni_PT       		),
    .tx9_nni_HEC      		( tx9_nni_HEC      		),
    .tx9_nni_Payload  		( tx9_nni_Payload  		),
    .tx10_txreq       		( tx10_txreq       		),
    .tx10_txack       		( tx10_txack       		),
    .tx10_nni_VPI     		( tx10_nni_VPI     		),
    .tx10_nni_VCI     		( tx10_nni_VCI     		),
    .tx10_nni_CLP     		( tx10_nni_CLP     		),
    .tx10_nni_PT      		( tx10_nni_PT      		),
    .tx10_nni_HEC     		( tx10_nni_HEC     		),
    .tx10_nni_Payload 		( tx10_nni_Payload 		),
    .tx11_txreq       		( tx11_txreq       		),
    .tx11_txack       		( tx11_txack       		),
    .tx11_nni_VPI     		( tx11_nni_VPI     		),
    .tx11_nni_VCI     		( tx11_nni_VCI     		),
    .tx11_nni_CLP     		( tx11_nni_CLP     		),
    .tx11_nni_PT      		( tx11_nni_PT      		),
    .tx11_nni_HEC     		( tx11_nni_HEC     		),
    .tx11_nni_Payload 		( tx11_nni_Payload 		),
    .tx12_txreq       		( tx12_txreq       		),
    .tx12_txack       		( tx12_txack       		),
    .tx12_nni_VPI     		( tx12_nni_VPI     		),
    .tx12_nni_VCI     		( tx12_nni_VCI     		),
    .tx12_nni_CLP     		( tx12_nni_CLP     		),
    .tx12_nni_PT      		( tx12_nni_PT      		),
    .tx12_nni_HEC     		( tx12_nni_HEC     		),
    .tx12_nni_Payload 		( tx12_nni_Payload 		),
    .tx13_txreq       		( tx13_txreq       		),
    .tx13_txack       		( tx13_txack       		),
    .tx13_nni_VPI     		( tx13_nni_VPI     		),
    .tx13_nni_VCI     		( tx13_nni_VCI     		),
    .tx13_nni_CLP     		( tx13_nni_CLP     		),
    .tx13_nni_PT      		( tx13_nni_PT      		),
    .tx13_nni_HEC     		( tx13_nni_HEC     		),
    .tx13_nni_Payload 		( tx13_nni_Payload 		),
    .tx14_txreq       		( tx14_txreq       		),
    .tx14_txack       		( tx14_txack       		),
    .tx14_nni_VPI     		( tx14_nni_VPI     		),
    .tx14_nni_VCI     		( tx14_nni_VCI     		),
    .tx14_nni_CLP     		( tx14_nni_CLP     		),
    .tx14_nni_PT      		( tx14_nni_PT      		),
    .tx14_nni_HEC     		( tx14_nni_HEC     		),
    .tx14_nni_Payload 		( tx14_nni_Payload 		),
    .tx15_txreq       		( tx15_txreq       		),
    .tx15_txack       		( tx15_txack       		),
    .tx15_nni_VPI     		( tx15_nni_VPI     		),
    .tx15_nni_VCI     		( tx15_nni_VCI     		),
    .tx15_nni_CLP     		( tx15_nni_CLP     		),
    .tx15_nni_PT      		( tx15_nni_PT      		),
    .tx15_nni_HEC     		( tx15_nni_HEC     		),
    .tx15_nni_Payload 		( tx15_nni_Payload 		)
);

endmodule   
