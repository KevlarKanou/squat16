
program automatic test
  #(parameter int NumRx = 4, parameter int NumTx = 4)
   (Utopia.TB_Rx Rx[0:NumRx-1],
    Utopia.TB_Tx Tx[0:NumTx-1],
    cpu_ifc.Test mif,
    input logic clk, rst_n);
	
	
   initial begin
      
      $display("###################################################################");
      $display("##################  Program Start !!!!!! ##########################");
      $display("###################################################################");
    
      reset();

      $display("###################################################################");
      $display("##################  Program End  !!!!!!! ##########################");
      $display("###################################################################");
   end


task reset();
  mif.BusMode <= 1'b0 ;
  mif.Addr    <= '0   ;
  mif.Sel     <= '1   ;
  mif.DataIn  <= '0   ;
  mif.Rd_DS   <= '1   ;
  mif.Wr_RW   <= '1   ;

  Rx[0].cbr.data  <= 0   ;
  Rx[0].cbr.soc   <= 0   ;
  Rx[0].cbr.clav  <= 0   ;

  Rx[1].cbr.data  <= 0   ;
  Rx[1].cbr.soc   <= 0   ;
  Rx[1].cbr.clav  <= 0   ;

  Rx[2].cbr.data  <= 0   ;
  Rx[2].cbr.soc   <= 0   ;
  Rx[2].cbr.clav  <= 0   ;

  Rx[3].cbr.data  <= 0   ;
  Rx[3].cbr.soc   <= 0   ;
  Rx[3].cbr.clav  <= 0   ;

  Rx[4].cbr.data  <= 0   ;
  Rx[4].cbr.soc   <= 0   ;
  Rx[4].cbr.clav  <= 0   ;

  Rx[5].cbr.data  <= 0   ;
  Rx[5].cbr.soc   <= 0   ;
  Rx[5].cbr.clav  <= 0   ;

  Rx[6].cbr.data  <= 0   ;
  Rx[6].cbr.soc   <= 0   ;
  Rx[6].cbr.clav  <= 0   ;

  Rx[7].cbr.data  <= 0   ;
  Rx[7].cbr.soc   <= 0   ;
  Rx[7].cbr.clav  <= 0   ;

  Rx[8].cbr.data  <= 0   ;
  Rx[8].cbr.soc   <= 0   ;
  Rx[8].cbr.clav  <= 0   ;

  Rx[9].cbr.data  <= 0   ;
  Rx[9].cbr.soc   <= 0   ;
  Rx[9].cbr.clav  <= 0   ;

  Rx[10].cbr.data  <= 0   ;
  Rx[10].cbr.soc   <= 0   ;
  Rx[10].cbr.clav  <= 0   ;

  Rx[11].cbr.data  <= 0   ;
  Rx[11].cbr.soc   <= 0   ;
  Rx[11].cbr.clav  <= 0   ;

  Rx[12].cbr.data  <= 0   ;
  Rx[12].cbr.soc   <= 0   ;
  Rx[12].cbr.clav  <= 0   ;

  Rx[13].cbr.data  <= 0   ;
  Rx[13].cbr.soc   <= 0   ;
  Rx[13].cbr.clav  <= 0   ;

  Rx[14].cbr.data  <= 0   ;
  Rx[14].cbr.soc   <= 0   ;
  Rx[14].cbr.clav  <= 0   ;

  Rx[15].cbr.data  <= 0   ;
  Rx[15].cbr.soc   <= 0   ;
  Rx[15].cbr.clav  <= 0   ;

  Tx[0].cbt.clav  <= 0   ;
  Tx[1].cbt.clav  <= 0   ;
  Tx[2].cbt.clav  <= 0   ;
  Tx[3].cbt.clav  <= 0   ;
  Tx[4].cbt.clav  <= 0   ;
  Tx[5].cbt.clav  <= 0   ;
  Tx[6].cbt.clav  <= 0   ;
  Tx[7].cbt.clav  <= 0   ;
  Tx[8].cbt.clav  <= 0   ;
  Tx[9].cbt.clav  <= 0   ;
  Tx[10].cbt.clav  <= 0   ;
  Tx[11].cbt.clav  <= 0   ;
  Tx[12].cbt.clav  <= 0   ;
  Tx[13].cbt.clav  <= 0   ;
  Tx[14].cbt.clav  <= 0   ;
  Tx[15].cbt.clav  <= 0   ;

  @(posedge rst_n);

  repeat(15) @(posedge clk) ;

  mif.BusMode <= 1'b1    ;

  Rx[0].cbr.clav  <= 1   ;
  Rx[1].cbr.clav  <= 1   ;
  Rx[2].cbr.clav  <= 1   ;
  Rx[3].cbr.clav  <= 1   ;
  Rx[4].cbr.clav  <= 1   ;
  Rx[5].cbr.clav  <= 1   ;
  Rx[6].cbr.clav  <= 1   ;
  Rx[7].cbr.clav  <= 1   ;
  Rx[8].cbr.clav  <= 1   ;
  Rx[9].cbr.clav  <= 1   ;
  Rx[10].cbr.clav  <= 1   ;
  Rx[11].cbr.clav  <= 1   ;
  Rx[12].cbr.clav  <= 1   ;
  Rx[13].cbr.clav  <= 1   ;
  Rx[14].cbr.clav  <= 1   ;
  Rx[15].cbr.clav  <= 1   ;

  Tx[0].cbt.clav  <= 1   ;
  Tx[1].cbt.clav  <= 1   ;
  Tx[2].cbt.clav  <= 1   ;
  Tx[3].cbt.clav  <= 1   ;
  Tx[4].cbt.clav  <= 1   ;
  Tx[5].cbt.clav  <= 1   ;
  Tx[6].cbt.clav  <= 1   ;
  Tx[7].cbt.clav  <= 1   ;
  Tx[8].cbt.clav  <= 1   ;
  Tx[9].cbt.clav  <= 1   ;
  Tx[10].cbt.clav  <= 1   ;
  Tx[11].cbt.clav  <= 1   ;
  Tx[12].cbt.clav  <= 1   ;
  Tx[13].cbt.clav  <= 1   ;
  Tx[14].cbt.clav  <= 1   ;
  Tx[15].cbt.clav  <= 1   ;

endtask: reset

endprogram	
