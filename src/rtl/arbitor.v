`include "../src/rtl/squat.vh"

module arbitor (
        input                  clk                ,
        input                  rst_n              ,

        output			                        fwd_rden           ,
        output	[7:0]                           fwd_addr           ,
        input	[12+`PORT_NUM-1:0]	        fwd_data           ,

        input			       rx0_rxreq          ,
        output	reg		       rx0_rxack          ,
        input	[3:0]	       rx0_uni_GFC        ,
        input	[7:0]	       rx0_uni_VPI        ,
        input	[15:0]	       rx0_uni_VCI        ,
        input			       rx0_uni_CLP        ,
        input	[2:0]	       rx0_uni_PT         ,
        input	[7:0]	       rx0_uni_HEC        ,
        input	[8*48-1:0]	   rx0_uni_Payload    ,

        input			       rx1_rxreq          ,
        output	reg		       rx1_rxack          ,
        input	[3:0]	       rx1_uni_GFC        ,
        input	[7:0]	       rx1_uni_VPI        ,
        input	[15:0]	       rx1_uni_VCI        ,
        input			       rx1_uni_CLP        ,
        input	[2:0]	       rx1_uni_PT         ,
        input	[7:0]	       rx1_uni_HEC        ,
        input	[8*48-1:0]	   rx1_uni_Payload    ,

        input			       rx2_rxreq          ,
        output	reg		       rx2_rxack          ,
        input	[3:0]	       rx2_uni_GFC        ,
        input	[7:0]	       rx2_uni_VPI        ,
        input	[15:0]	       rx2_uni_VCI        ,
        input			       rx2_uni_CLP        ,
        input	[2:0]	       rx2_uni_PT         ,
        input	[7:0]	       rx2_uni_HEC        ,
        input	[8*48-1:0]	   rx2_uni_Payload    ,

        input			       rx3_rxreq          ,
        output	reg		       rx3_rxack          ,
        input	[3:0]	       rx3_uni_GFC        ,
        input	[7:0]	       rx3_uni_VPI        ,
        input	[15:0]	       rx3_uni_VCI        ,
        input			       rx3_uni_CLP        ,
        input	[2:0]	       rx3_uni_PT         ,
        input	[7:0]	       rx3_uni_HEC        ,
        input	[8*48-1:0]	   rx3_uni_Payload    ,

        input                  rx4_rxreq          ,
        output  reg            rx4_rxack          ,
        input   [4:0]          rx4_uni_GFC        ,
        input   [7:0]          rx4_uni_VPI        ,
        input   [15:0]         rx4_uni_VCI        ,
        input                  rx4_uni_CLP        ,
        input   [2:0]          rx4_uni_PT         ,
        input   [7:0]          rx4_uni_HEC        ,
        input   [8*48-1:0]     rx4_uni_Payload    ,
    

        input                  rx5_rxreq          ,
        output  reg            rx5_rxack          ,
        input   [5:0]          rx5_uni_GFC        ,
        input   [7:0]          rx5_uni_VPI        ,
        input   [15:0]         rx5_uni_VCI        ,
        input                  rx5_uni_CLP        ,
        input   [2:0]          rx5_uni_PT         ,
        input   [7:0]          rx5_uni_HEC        ,
        input   [8*48-1:0]     rx5_uni_Payload    ,
    

        input                  rx6_rxreq          ,
        output  reg            rx6_rxack          ,
        input   [6:0]          rx6_uni_GFC        ,
        input   [7:0]          rx6_uni_VPI        ,
        input   [15:0]         rx6_uni_VCI        ,
        input                  rx6_uni_CLP        ,
        input   [2:0]          rx6_uni_PT         ,
        input   [7:0]          rx6_uni_HEC        ,
        input   [8*48-1:0]     rx6_uni_Payload    ,
    

        input                  rx7_rxreq          ,
        output  reg            rx7_rxack          ,
        input   [7:0]          rx7_uni_GFC        ,
        input   [7:0]          rx7_uni_VPI        ,
        input   [15:0]         rx7_uni_VCI        ,
        input                  rx7_uni_CLP        ,
        input   [2:0]          rx7_uni_PT         ,
        input   [7:0]          rx7_uni_HEC        ,
        input   [8*48-1:0]     rx7_uni_Payload    ,

        input                  rx8_rxreq          ,
        output  reg            rx8_rxack          ,
        input   [7:0]          rx8_uni_GFC        ,
        input   [7:0]          rx8_uni_VPI        ,
        input   [15:0]         rx8_uni_VCI        ,
        input                  rx8_uni_CLP        ,
        input   [2:0]          rx8_uni_PT         ,
        input   [7:0]          rx8_uni_HEC        ,
        input   [8*48-1:0]     rx8_uni_Payload    ,
    

        input                  rx9_rxreq          ,
        output  reg            rx9_rxack          ,
        input   [7:0]          rx9_uni_GFC        ,
        input   [7:0]          rx9_uni_VPI        ,
        input   [15:0]         rx9_uni_VCI        ,
        input                  rx9_uni_CLP        ,
        input   [2:0]          rx9_uni_PT         ,
        input   [7:0]          rx9_uni_HEC        ,
        input   [8*48-1:0]     rx9_uni_Payload    ,
    

        input                  rx10_rxreq          ,
        output  reg            rx10_rxack          ,
        input   [7:0]          rx10_uni_GFC        ,
        input   [7:0]          rx10_uni_VPI        ,
        input   [15:0]         rx10_uni_VCI        ,
        input                  rx10_uni_CLP        ,
        input   [2:0]          rx10_uni_PT         ,
        input   [7:0]          rx10_uni_HEC        ,
        input   [8*48-1:0]     rx10_uni_Payload    ,
    

        input                  rx11_rxreq          ,
        output  reg            rx11_rxack          ,
        input   [7:0]          rx11_uni_GFC        ,
        input   [7:0]          rx11_uni_VPI        ,
        input   [15:0]         rx11_uni_VCI        ,
        input                  rx11_uni_CLP        ,
        input   [2:0]          rx11_uni_PT         ,
        input   [7:0]          rx11_uni_HEC        ,
        input   [8*48-1:0]     rx11_uni_Payload    ,
    

        input                  rx12_rxreq          ,
        output  reg            rx12_rxack          ,
        input   [7:0]          rx12_uni_GFC        ,
        input   [7:0]          rx12_uni_VPI        ,
        input   [15:0]         rx12_uni_VCI        ,
        input                  rx12_uni_CLP        ,
        input   [2:0]          rx12_uni_PT         ,
        input   [7:0]          rx12_uni_HEC        ,
        input   [8*48-1:0]     rx12_uni_Payload    ,
    

        input                  rx13_rxreq          ,
        output  reg            rx13_rxack          ,
        input   [7:0]          rx13_uni_GFC        ,
        input   [7:0]          rx13_uni_VPI        ,
        input   [15:0]         rx13_uni_VCI        ,
        input                  rx13_uni_CLP        ,
        input   [2:0]          rx13_uni_PT         ,
        input   [7:0]          rx13_uni_HEC        ,
        input   [8*48-1:0]     rx13_uni_Payload    ,
    

        input                  rx14_rxreq          ,
        output  reg            rx14_rxack          ,
        input   [7:0]          rx14_uni_GFC        ,
        input   [7:0]          rx14_uni_VPI        ,
        input   [15:0]         rx14_uni_VCI        ,
        input                  rx14_uni_CLP        ,
        input   [2:0]          rx14_uni_PT         ,
        input   [7:0]          rx14_uni_HEC        ,
        input   [8*48-1:0]     rx14_uni_Payload    ,
    

        input                  rx15_rxreq          ,
        output  reg            rx15_rxack          ,
        input   [7:0]          rx15_uni_GFC        ,
        input   [7:0]          rx15_uni_VPI        ,
        input   [15:0]         rx15_uni_VCI        ,
        input                  rx15_uni_CLP        ,
        input   [2:0]          rx15_uni_PT         ,
        input   [7:0]          rx15_uni_HEC        ,
        input   [8*48-1:0]     rx15_uni_Payload    ,

        output	reg		       tx0_txreq          ,
        input			       tx0_txack          ,
        output	[11:0]	       tx0_nni_VPI        ,
        output	[15:0]	       tx0_nni_VCI        ,
        output			       tx0_nni_CLP        ,
        output	[2:0]	       tx0_nni_PT         ,
        output	[7:0]	       tx0_nni_HEC        ,
        output	[8*48-1:0]	   tx0_nni_Payload    ,

        output	reg		       tx1_txreq          ,
        input			       tx1_txack          ,
        output	[11:0]	       tx1_nni_VPI        ,
        output	[15:0]	       tx1_nni_VCI        ,
        output			       tx1_nni_CLP        ,
        output	[2:0]	       tx1_nni_PT         ,
        output	[7:0]	       tx1_nni_HEC        ,
        output	[8*48-1:0]	   tx1_nni_Payload    ,

        output	reg		       tx2_txreq          ,
        input			       tx2_txack          ,
        output	[11:0]	       tx2_nni_VPI        ,
        output	[15:0]	       tx2_nni_VCI        ,
        output			       tx2_nni_CLP        ,
        output	[2:0]	       tx2_nni_PT         ,
        output	[7:0]	       tx2_nni_HEC        ,
        output	[8*48-1:0]	   tx2_nni_Payload    ,

        output	reg		       tx3_txreq          ,
        input			       tx3_txack          ,
        output	[11:0]	       tx3_nni_VPI        ,
        output	[15:0]	       tx3_nni_VCI        ,
        output			       tx3_nni_CLP        ,
        output	[2:0]	       tx3_nni_PT         ,
        output	[7:0]	       tx3_nni_HEC        ,
        output	[8*48-1:0]	   tx3_nni_Payload	  ,

        output  reg            tx4_txreq          ,
        input				   tx4_txack          ,
        output  [11:0]         tx4_nni_VPI        ,
        output  [15:0]         tx4_nni_VCI        ,
        output                 tx4_nni_CLP        ,
        output  [2:0]          tx4_nni_PT         ,
        output  [7:0]          tx4_nni_HEC        ,
        output  [8*48-1:0]     tx4_nni_Payload    ,


        output  reg            tx5_txreq          ,
        input                  tx5_txack          ,
        output  [11:0]         tx5_nni_VPI        ,
        output  [15:0]         tx5_nni_VCI        ,
        output                 tx5_nni_CLP        ,
        output  [2:0]          tx5_nni_PT         ,
        output  [7:0]          tx5_nni_HEC        ,
        output  [8*48-1:0]     tx5_nni_Payload    ,


        output  reg            tx6_txreq          ,
        input                  tx6_txack          ,
        output  [11:0]         tx6_nni_VPI        ,
        output  [15:0]         tx6_nni_VCI        ,
        output                 tx6_nni_CLP        ,
        output  [2:0]          tx6_nni_PT         ,
        output  [7:0]          tx6_nni_HEC        ,
        output  [8*48-1:0]     tx6_nni_Payload    ,


        output  reg            tx7_txreq          ,
        input                  tx7_txack          ,
        output  [11:0]         tx7_nni_VPI        ,
        output  [15:0]         tx7_nni_VCI        ,
        output                 tx7_nni_CLP        ,
        output  [2:0]          tx7_nni_PT         ,
        output  [7:0]          tx7_nni_HEC        ,
        output  [8*48-1:0]     tx7_nni_Payload    ,

        output  reg            tx8_txreq          ,
        input                  tx8_txack          ,
        output  [11:0]         tx8_nni_VPI        ,
        output  [15:0]         tx8_nni_VCI        ,
        output                 tx8_nni_CLP        ,
        output  [2:0]          tx8_nni_PT         ,
        output  [7:0]          tx8_nni_HEC        ,
        output  [8*48-1:0]     tx8_nni_Payload    ,
    

        output  reg            tx9_txreq          ,
        input                  tx9_txack          ,
        output  [11:0]         tx9_nni_VPI        ,
        output  [15:0]         tx9_nni_VCI        ,
        output                 tx9_nni_CLP        ,
        output  [2:0]          tx9_nni_PT         ,
        output  [7:0]          tx9_nni_HEC        ,
        output  [8*48-1:0]     tx9_nni_Payload    ,
    

        output  reg            tx10_txreq          ,
        input                  tx10_txack          ,
        output  [11:0]         tx10_nni_VPI        ,
        output  [15:0]         tx10_nni_VCI        ,
        output                 tx10_nni_CLP        ,
        output  [2:0]          tx10_nni_PT         ,
        output  [7:0]          tx10_nni_HEC        ,
        output  [8*48-1:0]     tx10_nni_Payload    ,
    

        output  reg            tx11_txreq          ,
        input                  tx11_txack          ,
        output  [11:0]         tx11_nni_VPI        ,
        output  [15:0]         tx11_nni_VCI        ,
        output                 tx11_nni_CLP        ,
        output  [2:0]          tx11_nni_PT         ,
        output  [7:0]          tx11_nni_HEC        ,
        output  [8*48-1:0]     tx11_nni_Payload    ,
    

        output  reg            tx12_txreq          ,
        input                  tx12_txack          ,
        output  [11:0]         tx12_nni_VPI        ,
        output  [15:0]         tx12_nni_VCI        ,
        output                 tx12_nni_CLP        ,
        output  [2:0]          tx12_nni_PT         ,
        output  [7:0]          tx12_nni_HEC        ,
        output  [8*48-1:0]     tx12_nni_Payload    ,
    

        output  reg            tx13_txreq          ,
        input                  tx13_txack          ,
        output  [11:0]         tx13_nni_VPI        ,
        output  [15:0]         tx13_nni_VCI        ,
        output                 tx13_nni_CLP        ,
        output  [2:0]          tx13_nni_PT         ,
        output  [7:0]          tx13_nni_HEC        ,
        output  [8*48-1:0]     tx13_nni_Payload    ,
    

        output  reg            tx14_txreq          ,
        input                  tx14_txack          ,
        output  [11:0]         tx14_nni_VPI        ,
        output  [15:0]         tx14_nni_VCI        ,
        output                 tx14_nni_CLP        ,
        output  [2:0]          tx14_nni_PT         ,
        output  [7:0]          tx14_nni_HEC        ,
        output  [8*48-1:0]     tx14_nni_Payload    ,
    

        output  reg            tx15_txreq          ,
        input                  tx15_txack          ,
        output  [11:0]         tx15_nni_VPI        ,
        output  [15:0]         tx15_nni_VCI        ,
        output                 tx15_nni_CLP        ,
        output  [2:0]          tx15_nni_PT         ,
        output  [7:0]          tx15_nni_HEC        ,
        output  [8*48-1:0]     tx15_nni_Payload
    );

    ////////////////////////////////////////////////////////////////////

    parameter      wait_rx_valid = 3'h0  ,
                   wait_fwdlkp   = 3'h1  ,
                   tx_checksum   = 3'h2  ,
                   wait_tx_ready = 3'h3  ,
                   wait_tx_fwd   = 3'h4  ;

    reg    [2:0]                SquatState     ;
    wire                        uni_hec_err    ;
    wire                        tx_fwd_done    ;
    wire   [`PORT_NUM-1:0]   rxreq_arb      ;
    wire   [`PORT_NUM-1:0]   forward        ;

    always @(posedge clk or negedge rst_n)
        if(~rst_n)
            SquatState <= wait_rx_valid;
        else begin
            case (SquatState)
                wait_rx_valid  :   begin
                    if(|rxreq_arb) begin
                        SquatState <= wait_fwdlkp ;
                    end
                end
                wait_fwdlkp  :   begin
                    if (uni_hec_err)
                        SquatState   <= wait_rx_valid;
                    else
                        SquatState <= tx_checksum;
                end
                tx_checksum   :  begin
                    SquatState <= wait_tx_ready;
                end
                wait_tx_ready :  begin
                    if (|forward)
                        SquatState    <= wait_tx_fwd ;
                    else
                        SquatState    <= wait_rx_valid  ;
                end
                wait_tx_fwd   :  begin
                    if(tx_fwd_done)
                        SquatState <= wait_rx_valid ;
                end
                default       :
                    SquatState <= wait_rx_valid ;
            endcase
        end

    ////////////////////////////////////////////////////////////////////////////////////

    wire                  s_state_rxvld  = SquatState == wait_rx_valid  ;
    wire                  s_state_fwdlkp = SquatState == wait_fwdlkp    ;
    wire                  s_state_chksum = SquatState == tx_checksum    ;
    wire                  s_state_txrdy  = SquatState == wait_tx_ready  ;
    wire                  s_state_txfwd  = SquatState == wait_tx_fwd    ;

    ////////////////////////////////////////////////////////////////////////////////////

    // rxreq_sel 用作轮询掩码，每拍查找一位rx的请求
    reg      [`PORT_NUM-1:0]        rxreq_sel ;
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rxreq_sel <= `PORT_NUM'h1 ;
        else if(s_state_rxvld)
            rxreq_sel <= {rxreq_sel[`PORT_NUM-2:0],rxreq_sel[`PORT_NUM-1]} ;

    // rxreq_arb 是掩码结果
    assign rxreq_arb = rxreq_sel & {rx15_rxreq,rx14_rxreq,rx13_rxreq,rx12_rxreq,
                                    rx11_rxreq,rx10_rxreq,rx9_rxreq,rx8_rxreq,
                                    rx7_rxreq,rx6_rxreq,rx5_rxreq,rx4_rxreq,
                                    rx3_rxreq,rx2_rxreq,rx1_rxreq,rx0_rxreq} ;

    ////////////////////////////////////////////////////////////////////////////////////

    // FSM 位于 wait_rx_valid 状态时，rxreq_sel_vld 有效
    wire       [`PORT_NUM-1:0]       rxreq_sel_vld = rxreq_arb & {`PORT_NUM{s_state_rxvld}} ;

    ////////////////////////////////////////////////////////////////////////////////////
    reg        [3:0]       arb_uni_GFC     ;
    reg        [7:0]       arb_uni_VPI     ;
    reg        [15:0]      arb_uni_VCI     ;
    reg                    arb_uni_CLP     ;
    reg        [2:0]       arb_uni_PT      ;
    reg        [7:0]       arb_uni_HEC     ;
    reg        [8*48-1:0]  arb_uni_Payload ;


    // reg        [3:0]       nxt_arb_uni_GFC     = rxreq_sel_vld == 4'h1 ? rx0_uni_GFC     : rxreq_sel_vld == 4'h2 ? rx1_uni_GFC     : rxreq_sel_vld == 4'h4 ? rx2_uni_GFC     : rxreq_sel_vld == 4'h8 ? rx3_uni_GFC     :  arb_uni_GFC     ;
    // reg        [7:0]       nxt_arb_uni_VPI     = rxreq_sel_vld == 4'h1 ? rx0_uni_VPI     : rxreq_sel_vld == 4'h2 ? rx1_uni_VPI     : rxreq_sel_vld == 4'h4 ? rx2_uni_VPI     : rxreq_sel_vld == 4'h8 ? rx3_uni_VPI     :  arb_uni_VPI     ;
    // reg        [15:0]      nxt_arb_uni_VCI     = rxreq_sel_vld == 4'h1 ? rx0_uni_VCI     : rxreq_sel_vld == 4'h2 ? rx1_uni_VCI     : rxreq_sel_vld == 4'h4 ? rx2_uni_VCI     : rxreq_sel_vld == 4'h8 ? rx3_uni_VCI     :  arb_uni_VCI     ;
    // reg                    nxt_arb_uni_CLP     = rxreq_sel_vld == 4'h1 ? rx0_uni_CLP     : rxreq_sel_vld == 4'h2 ? rx1_uni_CLP     : rxreq_sel_vld == 4'h4 ? rx2_uni_CLP     : rxreq_sel_vld == 4'h8 ? rx3_uni_CLP     :  arb_uni_CLP     ;
    // reg        [2:0]       nxt_arb_uni_PT      = rxreq_sel_vld == 4'h1 ? rx0_uni_PT      : rxreq_sel_vld == 4'h2 ? rx1_uni_PT      : rxreq_sel_vld == 4'h4 ? rx2_uni_PT      : rxreq_sel_vld == 4'h8 ? rx3_uni_PT      :  arb_uni_PT      ;
    // reg        [7:0]       nxt_arb_uni_HEC     = rxreq_sel_vld == 4'h1 ? rx0_uni_HEC     : rxreq_sel_vld == 4'h2 ? rx1_uni_HEC     : rxreq_sel_vld == 4'h4 ? rx2_uni_HEC     : rxreq_sel_vld == 4'h8 ? rx3_uni_HEC     :  arb_uni_HEC     ;
    // reg        [8*48-1:0]  nxt_arb_uni_Payload = rxreq_sel_vld == 4'h1 ? rx0_uni_Payload : rxreq_sel_vld == 4'h2 ? rx1_uni_Payload : rxreq_sel_vld == 4'h4 ? rx2_uni_Payload : rxreq_sel_vld == 4'h8 ? rx3_uni_Payload :  arb_uni_Payload ;

    reg        [3:0]       nxt_arb_uni_GFC     ;
    reg        [7:0]       nxt_arb_uni_VPI     ;
    reg        [15:0]      nxt_arb_uni_VCI     ;
    reg                    nxt_arb_uni_CLP     ;
    reg        [2:0]       nxt_arb_uni_PT      ;
    reg        [7:0]       nxt_arb_uni_HEC     ;
    reg        [8*48-1:0]  nxt_arb_uni_Payload ;

    always @(*) begin
        case (rxreq_sel_vld)
            `PORT_NUM'h1: begin
                nxt_arb_uni_GFC     = rx0_uni_GFC     ;
                nxt_arb_uni_VPI     = rx0_uni_VPI     ;
                nxt_arb_uni_VCI     = rx0_uni_VCI     ;
                nxt_arb_uni_CLP     = rx0_uni_CLP     ;
                nxt_arb_uni_PT      = rx0_uni_PT      ;
                nxt_arb_uni_HEC     = rx0_uni_HEC     ;
                nxt_arb_uni_Payload = rx0_uni_Payload ;
            end
            `PORT_NUM'h2: begin
                nxt_arb_uni_GFC     = rx1_uni_GFC     ;
                nxt_arb_uni_VPI     = rx1_uni_VPI     ;
                nxt_arb_uni_VCI     = rx1_uni_VCI     ;
                nxt_arb_uni_CLP     = rx1_uni_CLP     ;
                nxt_arb_uni_PT      = rx1_uni_PT      ;
                nxt_arb_uni_HEC     = rx1_uni_HEC     ;
                nxt_arb_uni_Payload = rx1_uni_Payload ;
            end
            `PORT_NUM'h4: begin
                nxt_arb_uni_GFC     = rx2_uni_GFC     ;
                nxt_arb_uni_VPI     = rx2_uni_VPI     ;
                nxt_arb_uni_VCI     = rx2_uni_VCI     ;
                nxt_arb_uni_CLP     = rx2_uni_CLP     ;
                nxt_arb_uni_PT      = rx2_uni_PT      ;
                nxt_arb_uni_HEC     = rx2_uni_HEC     ;
                nxt_arb_uni_Payload = rx2_uni_Payload ;
            end
            `PORT_NUM'h8: begin
                nxt_arb_uni_GFC     = rx3_uni_GFC     ;
                nxt_arb_uni_VPI     = rx3_uni_VPI     ;
                nxt_arb_uni_VCI     = rx3_uni_VCI     ;
                nxt_arb_uni_CLP     = rx3_uni_CLP     ;
                nxt_arb_uni_PT      = rx3_uni_PT      ;
                nxt_arb_uni_HEC     = rx3_uni_HEC     ;
                nxt_arb_uni_Payload = rx3_uni_Payload ;
            end
            `PORT_NUM'h10: begin
                nxt_arb_uni_GFC     = rx4_uni_GFC     ;
                nxt_arb_uni_VPI     = rx4_uni_VPI     ;
                nxt_arb_uni_VCI     = rx4_uni_VCI     ;
                nxt_arb_uni_CLP     = rx4_uni_CLP     ;
                nxt_arb_uni_PT      = rx4_uni_PT      ;
                nxt_arb_uni_HEC     = rx4_uni_HEC     ;
                nxt_arb_uni_Payload = rx4_uni_Payload ;
            end
            `PORT_NUM'h20: begin
                nxt_arb_uni_GFC     = rx5_uni_GFC     ;
                nxt_arb_uni_VPI     = rx5_uni_VPI     ;
                nxt_arb_uni_VCI     = rx5_uni_VCI     ;
                nxt_arb_uni_CLP     = rx5_uni_CLP     ;
                nxt_arb_uni_PT      = rx5_uni_PT      ;
                nxt_arb_uni_HEC     = rx5_uni_HEC     ;
                nxt_arb_uni_Payload = rx5_uni_Payload ;
            end
            `PORT_NUM'h40: begin
                nxt_arb_uni_GFC     = rx6_uni_GFC     ;
                nxt_arb_uni_VPI     = rx6_uni_VPI     ;
                nxt_arb_uni_VCI     = rx6_uni_VCI     ;
                nxt_arb_uni_CLP     = rx6_uni_CLP     ;
                nxt_arb_uni_PT      = rx6_uni_PT      ;
                nxt_arb_uni_HEC     = rx6_uni_HEC     ;
                nxt_arb_uni_Payload = rx6_uni_Payload ;
            end
            `PORT_NUM'h80: begin
                nxt_arb_uni_GFC     = rx7_uni_GFC     ;
                nxt_arb_uni_VPI     = rx7_uni_VPI     ;
                nxt_arb_uni_VCI     = rx7_uni_VCI     ;
                nxt_arb_uni_CLP     = rx7_uni_CLP     ;
                nxt_arb_uni_PT      = rx7_uni_PT      ;
                nxt_arb_uni_HEC     = rx7_uni_HEC     ;
                nxt_arb_uni_Payload = rx7_uni_Payload ;
            end
            `PORT_NUM'h100: begin
                nxt_arb_uni_GFC     = rx8_uni_GFC     ;
                nxt_arb_uni_VPI     = rx8_uni_VPI     ;
                nxt_arb_uni_VCI     = rx8_uni_VCI     ;
                nxt_arb_uni_CLP     = rx8_uni_CLP     ;
                nxt_arb_uni_PT      = rx8_uni_PT      ;
                nxt_arb_uni_HEC     = rx8_uni_HEC     ;
                nxt_arb_uni_Payload = rx8_uni_Payload ;
            end
            `PORT_NUM'h200: begin
                nxt_arb_uni_GFC     = rx9_uni_GFC     ;
                nxt_arb_uni_VPI     = rx9_uni_VPI     ;
                nxt_arb_uni_VCI     = rx9_uni_VCI     ;
                nxt_arb_uni_CLP     = rx9_uni_CLP     ;
                nxt_arb_uni_PT      = rx9_uni_PT      ;
                nxt_arb_uni_HEC     = rx9_uni_HEC     ;
                nxt_arb_uni_Payload = rx9_uni_Payload ;
            end
            `PORT_NUM'h400: begin
                nxt_arb_uni_GFC     = rx10_uni_GFC     ;
                nxt_arb_uni_VPI     = rx10_uni_VPI     ;
                nxt_arb_uni_VCI     = rx10_uni_VCI     ;
                nxt_arb_uni_CLP     = rx10_uni_CLP     ;
                nxt_arb_uni_PT      = rx10_uni_PT      ;
                nxt_arb_uni_HEC     = rx10_uni_HEC     ;
                nxt_arb_uni_Payload = rx10_uni_Payload ;
            end
            `PORT_NUM'h800: begin
                nxt_arb_uni_GFC     = rx11_uni_GFC     ;
                nxt_arb_uni_VPI     = rx11_uni_VPI     ;
                nxt_arb_uni_VCI     = rx11_uni_VCI     ;
                nxt_arb_uni_CLP     = rx11_uni_CLP     ;
                nxt_arb_uni_PT      = rx11_uni_PT      ;
                nxt_arb_uni_HEC     = rx11_uni_HEC     ;
                nxt_arb_uni_Payload = rx11_uni_Payload ;
            end
            `PORT_NUM'h1000: begin
                nxt_arb_uni_GFC     = rx12_uni_GFC     ;
                nxt_arb_uni_VPI     = rx12_uni_VPI     ;
                nxt_arb_uni_VCI     = rx12_uni_VCI     ;
                nxt_arb_uni_CLP     = rx12_uni_CLP     ;
                nxt_arb_uni_PT      = rx12_uni_PT      ;
                nxt_arb_uni_HEC     = rx12_uni_HEC     ;
                nxt_arb_uni_Payload = rx12_uni_Payload ;
            end
            `PORT_NUM'h2000: begin
                nxt_arb_uni_GFC     = rx13_uni_GFC     ;
                nxt_arb_uni_VPI     = rx13_uni_VPI     ;
                nxt_arb_uni_VCI     = rx13_uni_VCI     ;
                nxt_arb_uni_CLP     = rx13_uni_CLP     ;
                nxt_arb_uni_PT      = rx13_uni_PT      ;
                nxt_arb_uni_HEC     = rx13_uni_HEC     ;
                nxt_arb_uni_Payload = rx13_uni_Payload ;
            end
            `PORT_NUM'h4000: begin
                nxt_arb_uni_GFC     = rx14_uni_GFC     ;
                nxt_arb_uni_VPI     = rx14_uni_VPI     ;
                nxt_arb_uni_VCI     = rx14_uni_VCI     ;
                nxt_arb_uni_CLP     = rx14_uni_CLP     ;
                nxt_arb_uni_PT      = rx14_uni_PT      ;
                nxt_arb_uni_HEC     = rx14_uni_HEC     ;
                nxt_arb_uni_Payload = rx14_uni_Payload ;
            end
            `PORT_NUM'h8000: begin
                nxt_arb_uni_GFC     = rx15_uni_GFC     ;
                nxt_arb_uni_VPI     = rx15_uni_VPI     ;
                nxt_arb_uni_VCI     = rx15_uni_VCI     ;
                nxt_arb_uni_CLP     = rx15_uni_CLP     ;
                nxt_arb_uni_PT      = rx15_uni_PT      ;
                nxt_arb_uni_HEC     = rx15_uni_HEC     ;
                nxt_arb_uni_Payload = rx15_uni_Payload ;
            end
            default: begin
                nxt_arb_uni_GFC     = arb_uni_GFC     ;
                nxt_arb_uni_VPI     = arb_uni_VPI     ;
                nxt_arb_uni_VCI     = arb_uni_VCI     ;
                nxt_arb_uni_CLP     = arb_uni_CLP     ;
                nxt_arb_uni_PT      = arb_uni_PT      ;
                nxt_arb_uni_HEC     = arb_uni_HEC     ;
                nxt_arb_uni_Payload = arb_uni_Payload ;
            end
        endcase
    end

    always@(posedge clk or negedge rst_n)
        if(~rst_n) begin
            arb_uni_GFC     <= 0 ;
            arb_uni_VPI     <= 0 ;
            arb_uni_VCI     <= 0 ;
            arb_uni_CLP     <= 0 ;
            arb_uni_PT      <= 0 ;
            arb_uni_HEC     <= 0 ;
            arb_uni_Payload <= 0 ;
        end
        else begin
            arb_uni_GFC     <= nxt_arb_uni_GFC     ;
            arb_uni_VPI     <= nxt_arb_uni_VPI     ;
            arb_uni_VCI     <= nxt_arb_uni_VCI     ;
            arb_uni_CLP     <= nxt_arb_uni_CLP     ;
            arb_uni_PT      <= nxt_arb_uni_PT      ;
            arb_uni_HEC     <= nxt_arb_uni_HEC     ;
            arb_uni_Payload <= nxt_arb_uni_Payload ;
        end

    ////////////////////////////////////////////////////////////////////////////////////
    assign   fwd_addr = nxt_arb_uni_VPI ;
    assign   fwd_rden = |rxreq_sel_vld  ;
    reg      [12+`PORT_NUM-1:0] fwd_data_reg ;
    wire     [12+`PORT_NUM-1:0] nxt_fwd_data = fwd_rden ? fwd_data : fwd_data_reg ;
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            fwd_data_reg <= 16'h0 ;
        else
            fwd_data_reg <= nxt_fwd_data ;

    ////////////////////////////////////////////////////////////////////////////////////

    reg        [7:0]       hec_nni ;

    wire       [11:0]      arb_nni_VPI      = fwd_data_reg[11:0]  ;
    wire       [15:0]      arb_nni_VCI      = arb_uni_VCI         ;
    wire                   arb_nni_CLP      = arb_uni_CLP         ;
    wire       [2:0]       arb_nni_PT       = arb_uni_PT          ;
    wire       [7:0]       arb_nni_HEC      = hec_nni             ;
    wire       [8*48-1:0]  arb_nni_Payload  = arb_uni_Payload     ;

    // forward 标识发送端口，为 0 则丢弃报文
    // 支持类 UDP
    assign                 forward          = fwd_data_reg[12+`PORT_NUM-1:12] ;

    //////////////////////////////////////////////////////////////////////////////////////////////////

    wire       [31:0]      hec_uni_hdr     = {arb_uni_GFC,arb_uni_VPI,arb_uni_VCI,arb_uni_CLP,arb_uni_PT} ;
    wire       [31:0]      hec_nni_hdr     = {arb_nni_VPI,arb_nni_VCI,arb_nni_CLP,arb_nni_PT} ;
    wire       [31:0]      hec_cal_in      = s_state_fwdlkp ? hec_uni_hdr :
               s_state_chksum ? hec_nni_hdr : 32'h0 ;

    wire       [7:0]       hec_cal_out     ;

    hec_cal hec_cal_inst(
                .hec_in  ( hec_cal_in  ),
                .hec_out ( hec_cal_out )
            );


    assign                 uni_hec_err = (arb_uni_HEC != hec_cal_out) & s_state_fwdlkp ;

    //reg        [7:0]       hec_nni ;
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            hec_nni <= 8'h0 ;
        else if(s_state_chksum)
            hec_nni <= hec_cal_out ;

    ////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////

    reg rx_sel_vld_0to7, rx_sel_vld_8to15;

    // assign                 rx_sel_vld_0to7  = |rxreq_sel_vld[7:0]                    ;
    // assign                 rx_sel_vld_8to15 = |rxreq_sel_vld[15:8]                   ;

    always @(posedge clk , negedge rst_n) begin
        if (~rst_n) begin
            rx_sel_vld_0to7     <= 0;
            rx_sel_vld_8to15    <= 0;
        end
        else if (s_state_rxvld) begin
            rx_sel_vld_0to7     <= |rxreq_sel_vld[7:0];
            rx_sel_vld_8to15    <= |rxreq_sel_vld[15:8];
        end
        else begin
            rx_sel_vld_0to7     <= rx_sel_vld_0to7;
            rx_sel_vld_8to15    <= rx_sel_vld_8to15;
        end
    end

    assign                 tx0_nni_VPI      = forward[0] ? arb_nni_VPI      : 'h0    ;
    assign                 tx0_nni_VCI      = forward[0] ? arb_nni_VCI      : 'h0    ;
    assign                 tx0_nni_CLP      = forward[0] ? arb_nni_CLP      : 'h0    ;
    assign                 tx0_nni_PT       = forward[0] ? arb_nni_PT       : 'h0    ;
    assign                 tx0_nni_HEC      = forward[0] ? arb_nni_HEC      : 'h0    ;
    assign                 tx0_nni_Payload  = forward[0] ? arb_nni_Payload  : 'h0    ;


    assign                 tx1_nni_VPI      = (forward[1] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx1_nni_VCI      = (forward[1] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx1_nni_CLP      = (forward[1] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx1_nni_PT       = (forward[1] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx1_nni_HEC      = (forward[1] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx1_nni_Payload  = (forward[1] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx2_nni_VPI      = (forward[2] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx2_nni_VCI      = (forward[2] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx2_nni_CLP      = (forward[2] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx2_nni_PT       = (forward[2] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx2_nni_HEC      = (forward[2] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx2_nni_Payload  = (forward[2] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx3_nni_VPI      = (forward[3] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx3_nni_VCI      = (forward[3] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx3_nni_CLP      = (forward[3] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx3_nni_PT       = (forward[3] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx3_nni_HEC      = (forward[3] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx3_nni_Payload  = (forward[3] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx4_nni_VPI      = (forward[4] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx4_nni_VCI      = (forward[4] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx4_nni_CLP      = (forward[4] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx4_nni_PT       = (forward[4] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx4_nni_HEC      = (forward[4] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx4_nni_Payload  = (forward[4] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx5_nni_VPI      = (forward[5] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx5_nni_VCI      = (forward[5] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx5_nni_CLP      = (forward[5] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx5_nni_PT       = (forward[5] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx5_nni_HEC      = (forward[5] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx5_nni_Payload  = (forward[5] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx6_nni_VPI      = (forward[6] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx6_nni_VCI      = (forward[6] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx6_nni_CLP      = (forward[6] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx6_nni_PT       = (forward[6] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx6_nni_HEC      = (forward[6] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx6_nni_Payload  = (forward[6] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx7_nni_VPI      = (forward[7] & rx_sel_vld_0to7) ? arb_nni_VPI      : 'h0    ;
    assign                 tx7_nni_VCI      = (forward[7] & rx_sel_vld_0to7) ? arb_nni_VCI      : 'h0    ;
    assign                 tx7_nni_CLP      = (forward[7] & rx_sel_vld_0to7) ? arb_nni_CLP      : 'h0    ;
    assign                 tx7_nni_PT       = (forward[7] & rx_sel_vld_0to7) ? arb_nni_PT       : 'h0    ;
    assign                 tx7_nni_HEC      = (forward[7] & rx_sel_vld_0to7) ? arb_nni_HEC      : 'h0    ;
    assign                 tx7_nni_Payload  = (forward[7] & rx_sel_vld_0to7) ? arb_nni_Payload  : 'h0    ;

    assign                 tx8_nni_VPI      = (forward[8] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx8_nni_VCI      = (forward[8] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx8_nni_CLP      = (forward[8] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx8_nni_PT       = (forward[8] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx8_nni_HEC      = (forward[8] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx8_nni_Payload  = (forward[8] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx9_nni_VPI      = (forward[9] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx9_nni_VCI      = (forward[9] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx9_nni_CLP      = (forward[9] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx9_nni_PT       = (forward[9] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx9_nni_HEC      = (forward[9] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx9_nni_Payload  = (forward[9] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx10_nni_VPI      = (forward[10] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx10_nni_VCI      = (forward[10] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx10_nni_CLP      = (forward[10] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx10_nni_PT       = (forward[10] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx10_nni_HEC      = (forward[10] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx10_nni_Payload  = (forward[10] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx11_nni_VPI      = (forward[11] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx11_nni_VCI      = (forward[11] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx11_nni_CLP      = (forward[11] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx11_nni_PT       = (forward[11] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx11_nni_HEC      = (forward[11] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx11_nni_Payload  = (forward[11] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx12_nni_VPI      = (forward[12] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx12_nni_VCI      = (forward[12] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx12_nni_CLP      = (forward[12] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx12_nni_PT       = (forward[12] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx12_nni_HEC      = (forward[12] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx12_nni_Payload  = (forward[12] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx13_nni_VPI      = (forward[13] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx13_nni_VCI      = (forward[13] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx13_nni_CLP      = (forward[13] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx13_nni_PT       = (forward[13] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx13_nni_HEC      = (forward[13] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx13_nni_Payload  = (forward[13] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx14_nni_VPI      = (forward[14] & rx_sel_vld_8to15) ? arb_nni_VPI      : 'h0    ;
    assign                 tx14_nni_VCI      = (forward[14] & rx_sel_vld_8to15) ? arb_nni_VCI      : 'h0    ;
    assign                 tx14_nni_CLP      = (forward[14] & rx_sel_vld_8to15) ? arb_nni_CLP      : 'h0    ;
    assign                 tx14_nni_PT       = (forward[14] & rx_sel_vld_8to15) ? arb_nni_PT       : 'h0    ;
    assign                 tx14_nni_HEC      = (forward[14] & rx_sel_vld_8to15) ? arb_nni_HEC      : 'h0    ;
    assign                 tx14_nni_Payload  = (forward[14] & rx_sel_vld_8to15) ? arb_nni_Payload  : 'h0    ;

    assign                 tx15_nni_VPI      = forward[15] ? arb_nni_VPI      : 'h0    ;
    assign                 tx15_nni_VCI      = forward[15] ? arb_nni_VCI      : 'h0    ;
    assign                 tx15_nni_CLP      = forward[15] ? arb_nni_CLP      : 'h0    ;
    assign                 tx15_nni_PT       = forward[15] ? arb_nni_PT       : 'h0    ;
    assign                 tx15_nni_HEC      = forward[15] ? arb_nni_HEC      : 'h0    ;
    assign                 tx15_nni_Payload  = forward[15] ? arb_nni_Payload  : 'h0    ;

    ////////////////////////////////////////////////////////////////////////////////////
    // reg                    rx0_rxack ;
    // reg                    rx1_rxack ;
    // reg                    rx2_rxack ;
    // reg                    rx3_rxack ;
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx0_rxack <= 1'b0 ;
        else
            rx0_rxack <= rxreq_sel_vld[0] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx1_rxack <= 1'b0 ;
        else
            rx1_rxack <= rxreq_sel_vld[1] ;


    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx2_rxack <= 1'b0 ;
        else
            rx2_rxack <= rxreq_sel_vld[2] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx3_rxack <= 1'b0 ;
        else
            rx3_rxack <= rxreq_sel_vld[3] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx4_rxack <= 1'b0 ;
        else
            rx4_rxack <= rxreq_sel_vld[4] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx5_rxack <= 1'b0 ;
        else
            rx5_rxack <= rxreq_sel_vld[5] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx6_rxack <= 1'b0 ;
        else
            rx6_rxack <= rxreq_sel_vld[6] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx7_rxack <= 1'b0 ;
        else
            rx7_rxack <= rxreq_sel_vld[7] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx8_rxack <= 1'b0 ;
        else
            rx8_rxack <= rxreq_sel_vld[8] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx9_rxack <= 1'b0 ;
        else
            rx9_rxack <= rxreq_sel_vld[9] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx10_rxack <= 1'b0 ;
        else
            rx10_rxack <= rxreq_sel_vld[10] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx11_rxack <= 1'b0 ;
        else
            rx11_rxack <= rxreq_sel_vld[11] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx12_rxack <= 1'b0 ;
        else
            rx12_rxack <= rxreq_sel_vld[12] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx13_rxack <= 1'b0 ;
        else
            rx13_rxack <= rxreq_sel_vld[13] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx14_rxack <= 1'b0 ;
        else
            rx14_rxack <= rxreq_sel_vld[14] ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            rx15_rxack <= 1'b0 ;
        else
            rx15_rxack <= rxreq_sel_vld[15] ;

    ////////////////////////////////////////////////////////////////////////////////////

    wire                   tx0_fwd_req  = s_state_txrdy & forward[0] ;
    wire                   tx1_fwd_req  = s_state_txrdy & forward[1] ;
    wire                   tx2_fwd_req  = s_state_txrdy & forward[2] ;
    wire                   tx3_fwd_req  = s_state_txrdy & forward[3] ;
    wire                   tx4_fwd_req  = s_state_txrdy & forward[4] ;
    wire                   tx5_fwd_req  = s_state_txrdy & forward[5] ;
    wire                   tx6_fwd_req  = s_state_txrdy & forward[6] ;
    wire                   tx7_fwd_req  = s_state_txrdy & forward[7] ;
    wire                   tx8_fwd_req  = s_state_txrdy & forward[8] ;
    wire                   tx9_fwd_req  = s_state_txrdy & forward[9] ;
    wire                   tx10_fwd_req = s_state_txrdy & forward[10] ;
    wire                   tx11_fwd_req = s_state_txrdy & forward[11] ;
    wire                   tx12_fwd_req = s_state_txrdy & forward[12] ;
    wire                   tx13_fwd_req = s_state_txrdy & forward[13] ;
    wire                   tx14_fwd_req = s_state_txrdy & forward[14] ;
    wire                   tx15_fwd_req = s_state_txrdy & forward[15] ;

    // reg                    tx0_txreq ;
    // reg                    tx1_txreq ;
    // reg                    tx2_txreq ;
    // reg                    tx3_txreq ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx0_txreq <= 1'b0 ;
        else if(tx0_txack)
            tx0_txreq <= 1'b0 ;
        else if(tx0_fwd_req)
            tx0_txreq <= 1'b1 ;


    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx1_txreq <= 1'b0 ;
        else if(tx1_txack)
            tx1_txreq <= 1'b0 ;
        else if(tx1_fwd_req)
            tx1_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx2_txreq <= 1'b0 ;
        else if(tx2_txack)
            tx2_txreq <= 1'b0 ;
        else if(tx2_fwd_req)
            tx2_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx3_txreq <= 1'b0 ;
        else if(tx3_txack)
            tx3_txreq <= 1'b0 ;
        else if(tx3_fwd_req)
            tx3_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx4_txreq <= 1'b0 ;
        else if(tx4_txack)
            tx4_txreq <= 1'b0 ;
        else if(tx4_fwd_req)
            tx4_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx5_txreq <= 1'b0 ;
        else if(tx5_txack)
            tx5_txreq <= 1'b0 ;
        else if(tx5_fwd_req)
            tx5_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx6_txreq <= 1'b0 ;
        else if(tx6_txack)
            tx6_txreq <= 1'b0 ;
        else if(tx6_fwd_req)
            tx6_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx7_txreq <= 1'b0 ;
        else if(tx7_txack)
            tx7_txreq <= 1'b0 ;
        else if(tx7_fwd_req)
            tx7_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx8_txreq <= 1'b0 ;
        else if(tx8_txack)
            tx8_txreq <= 1'b0 ;
        else if(tx8_fwd_req)
            tx8_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx9_txreq <= 1'b0 ;
        else if(tx9_txack)
            tx9_txreq <= 1'b0 ;
        else if(tx9_fwd_req)
            tx9_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx10_txreq <= 1'b0 ;
        else if(tx10_txack)
            tx10_txreq <= 1'b0 ;
        else if(tx10_fwd_req)
            tx10_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx11_txreq <= 1'b0 ;
        else if(tx11_txack)
            tx11_txreq <= 1'b0 ;
        else if(tx11_fwd_req)
            tx11_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx12_txreq <= 1'b0 ;
        else if(tx12_txack)
            tx12_txreq <= 1'b0 ;
        else if(tx12_fwd_req)
            tx12_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx13_txreq <= 1'b0 ;
        else if(tx13_txack)
            tx13_txreq <= 1'b0 ;
        else if(tx13_fwd_req)
            tx13_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx14_txreq <= 1'b0 ;
        else if(tx14_txack)
            tx14_txreq <= 1'b0 ;
        else if(tx14_fwd_req)
            tx14_txreq <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx15_txreq <= 1'b0 ;
        else if(tx15_txack)
            tx15_txreq <= 1'b0 ;
        else if(tx15_fwd_req)
            tx15_txreq <= 1'b1 ;

    ////////////////////////////////////////////////////////
    wire      tx0_trig = ((forward[0] & tx0_txack) | (forward[0] == 1'b0)) & s_state_txfwd;
    wire      tx1_trig = ((forward[1] & tx1_txack) | (forward[1] == 1'b0)) & s_state_txfwd;
    wire      tx2_trig = ((forward[2] & tx2_txack) | (forward[2] == 1'b0)) & s_state_txfwd;
    wire      tx3_trig = ((forward[3] & tx3_txack) | (forward[3] == 1'b0)) & s_state_txfwd;
    wire      tx4_trig = ((forward[4] & tx4_txack) | (forward[4] == 1'b0)) & s_state_txfwd;
    wire      tx5_trig = ((forward[5] & tx5_txack) | (forward[5] == 1'b0)) & s_state_txfwd;
    wire      tx6_trig = ((forward[6] & tx6_txack) | (forward[6] == 1'b0)) & s_state_txfwd;
    wire      tx7_trig = ((forward[7] & tx7_txack) | (forward[7] == 1'b0)) & s_state_txfwd;
    wire      tx8_trig = ((forward[8] & tx8_txack) | (forward[8] == 1'b0)) & s_state_txfwd;
    wire      tx9_trig = ((forward[9] & tx9_txack) | (forward[9] == 1'b0)) & s_state_txfwd;
    wire      tx10_trig = ((forward[10] & tx10_txack) | (forward[10] == 1'b0)) & s_state_txfwd;
    wire      tx11_trig = ((forward[11] & tx11_txack) | (forward[11] == 1'b0)) & s_state_txfwd;
    wire      tx12_trig = ((forward[12] & tx12_txack) | (forward[12] == 1'b0)) & s_state_txfwd;
    wire      tx13_trig = ((forward[13] & tx13_txack) | (forward[13] == 1'b0)) & s_state_txfwd;
    wire      tx14_trig = ((forward[14] & tx14_txack) | (forward[14] == 1'b0)) & s_state_txfwd;
    wire      tx15_trig = ((forward[15] & tx15_txack) | (forward[15] == 1'b0)) & s_state_txfwd;

    reg      tx0_done ;
    reg      tx1_done ;
    reg      tx2_done ;
    reg      tx3_done ;
    reg      tx4_done ;
    reg      tx5_done ;
    reg      tx6_done ;
    reg      tx7_done ;
    reg      tx8_done ;
    reg      tx9_done ;
    reg      tx10_done ;
    reg      tx11_done ;
    reg      tx12_done ;
    reg      tx13_done ;
    reg      tx14_done ;
    reg      tx15_done ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx0_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx0_done <= 1'b0 ;
        else if(tx0_trig)
            tx0_done <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx1_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx1_done <= 1'b0 ;
        else if(tx1_trig)
            tx1_done <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx2_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx2_done <= 1'b0 ;
        else if(tx2_trig)
            tx2_done <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx3_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx3_done <= 1'b0 ;
        else if(tx3_trig)
            tx3_done <= 1'b1 ;

    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx4_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx4_done <= 1'b0 ;
        else if(tx4_trig)
            tx4_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx5_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx5_done <= 1'b0 ;
        else if(tx5_trig)
            tx5_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx6_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx6_done <= 1'b0 ;
        else if(tx6_trig)
            tx6_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx7_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx7_done <= 1'b0 ;
        else if(tx7_trig)
            tx7_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx8_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx8_done <= 1'b0 ;
        else if(tx8_trig)
            tx8_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx9_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx9_done <= 1'b0 ;
        else if(tx9_trig)
            tx9_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx10_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx10_done <= 1'b0 ;
        else if(tx10_trig)
            tx10_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx11_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx11_done <= 1'b0 ;
        else if(tx11_trig)
            tx11_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx12_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx12_done <= 1'b0 ;
        else if(tx12_trig)
            tx12_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx13_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx13_done <= 1'b0 ;
        else if(tx13_trig)
            tx13_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx14_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx14_done <= 1'b0 ;
        else if(tx14_trig)
            tx14_done <= 1'b1 ;
    
    always@(posedge clk or negedge rst_n)
        if(~rst_n)
            tx15_done <= 1'b0 ;
        else if(s_state_txfwd == 1'b0)
            tx15_done <= 1'b0 ;
        else if(tx15_trig)
            tx15_done <= 1'b1 ;

    ////////////////////////////////////////////////

    assign	 tx_fwd_done =    tx0_done & tx1_done & tx2_done & tx3_done 
                            & tx4_done & tx5_done & tx6_done & tx7_done 
                            & tx8_done & tx9_done & tx10_done & tx11_done 
                            & tx12_done & tx13_done & tx14_done & tx15_done;

    ////////////////////////////////////////////////

endmodule
