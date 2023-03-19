
module utopia1_atm_rx(
                       clk            ,
					   rst_n          ,
							          
                       soc            ,
					   data           ,
					   clav           ,
					   en             ,
							          
					   rxreq          ,
					   rxack          ,
					   uni_GFC        ,
					   uni_VPI        ,
					   uni_VCI        ,
					   uni_CLP        ,
					   uni_PT         ,
					   uni_HEC        ,
					   uni_Payload
					        
                      );

input                  clk                ;
input                  rst_n              ;
								          
input                  soc                ;
input      [7:0]       data               ;
input                  clav               ;
output                 en                 ;
								          
output                 rxreq              ;
input                  rxack              ;

output     [3:0]       uni_GFC            ;
output     [7:0]       uni_VPI            ;
output     [15:0]      uni_VCI            ;
output                 uni_CLP            ;
output     [2:0]       uni_PT             ;
output     [7:0]       uni_HEC            ;
output     [8*48-1:0]  uni_Payload        ;

///////////////////////////////////////////////////	

reg        [3:0]       uni_GFC            ;
reg        [7:0]       uni_VPI            ;
reg        [15:0]      uni_VCI            ;
reg                    uni_CLP            ;
reg        [2:0]       uni_PT             ;
reg        [7:0]       uni_HEC            ;
reg        [8*48-1:0]  uni_Payload        ;

///////////////////////////////////////////////////	

reg        [5:0]       PayloadIndex   ;
  
///////////////////////////////////////////////////	
  
parameter              reset      = 4'h0   ,
                       soc_frm    = 4'h1   ,
					   vpi_vci    = 4'h2   ,
					   vci        = 4'h3   ,
					   vci_clp_pt = 4'h4   ,
					   hec        = 4'h5   ,
					   payload    = 4'h6   ,
					   req        = 4'h7   ,
					   ack        = 4'h8   ;

reg    [3:0]           UtopiaStatus ;
reg                    rxreq        ;
reg                    en           ;

  always @(posedge clk, negedge rst_n)
    if (~rst_n) begin
      rxreq          <= 0;
      en             <= 0;
      UtopiaStatus   <= reset;
    end
    else begin
      case (UtopiaStatus)
        reset       :  begin
                          rxreq         <= 0    ;
                          UtopiaStatus  <= soc_frm  ;
                          en            <= 1    ;
                       end
        soc_frm         :  if (soc && clav) begin
                          {uni_GFC,
                           uni_VPI[7:4]} <= data;
                           UtopiaStatus  <= vpi_vci;
                           //Rx.en <= 0;
                       end
        vpi_vci     :  if (clav) begin
                          {uni_VPI[3:0],
                           uni_VCI[15:12]} <= data;
                           UtopiaStatus    <= vci;
                       end
        vci         :  if (clav) begin
                          uni_VCI[11:4]    <= data;
                          UtopiaStatus     <= vci_clp_pt;
                       end
        vci_clp_pt  : if (clav) begin
                         {uni_VCI[3:0], uni_CLP,
                          uni_PT}          <= data    ;
                          UtopiaStatus     <= hec     ;
                      end
        hec         : if (clav) begin
                          uni_HEC          <= data    ;
                          UtopiaStatus     <= payload ; 
                          PayloadIndex     <= 0       ;  
                      end
        payload     : if (clav) begin
                          //uni_Payload[PayloadIndex*8 +7:PayloadIndex*8] <= data;
                          uni_Payload <= {data,uni_Payload[48*8-1:8]};
                          if (PayloadIndex==47) begin
                              UtopiaStatus <= req;
                              en <= 0;
                          end
                          PayloadIndex <= PayloadIndex + 1;
                      end
        req         : begin
                         UtopiaStatus <= ack   ;
			             rxreq        <= 1     ;
	                  end
        ack         : if(rxack) begin
		                 UtopiaStatus <= reset ; 
				 rxreq        <= 0     ;        
                                 en        <= 1     ;
		       end	 
        default     : UtopiaStatus <= reset;
      endcase
    end
  


endmodule					  
