`include "../src/rtl/squat.vh"

module LookupTable #(parameter Asize = 8) ( 
                    clk          ,
                    rst_n        ,
                    host_wren    ,
                    host_rden    ,
                    host_addr    ,
                    host_wdata   ,
                    host_rdata   ,
                    fwd_rden     ,
                    fwd_addr     ,
                    fwd_rdata    
                   );

//////////////////////////////////////////////////////

input               			clk          ;
input               			rst_n        ;
input               			host_wren    ;
input               			host_rden    ;
input    [23:0]      			host_addr    ;
input    [`PORT_NUM+28-1:0]     host_wdata   ;
output   [`PORT_NUM+28-1:0] 	host_rdata   ;
input               			fwd_rden     ;
input    [23:0]      			fwd_addr     ;
output   [`PORT_NUM+28-1:0]     fwd_rdata    ;

//////////////////////////////////////////////////////
                   
    parameter  Arange = 1<<Asize;

    reg   [`PORT_NUM+28-1:0] Mem [0:Arange-1];
    integer i;
    always@(posedge clk or negedge rst_n)
        if(~rst_n) begin
            for(i=0;i<256;i=i+1)
                Mem[i] <= 'h0 ;
        end
        else if(host_wren)
            Mem[host_addr] <= host_wdata ;
            
    assign   host_rdata = Mem[host_addr]  ;

    assign   fwd_rdata  = Mem[fwd_addr]   ;

endmodule				   
