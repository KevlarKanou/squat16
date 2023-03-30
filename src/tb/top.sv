`timescale 1ns/1ns

//`define SYNTHESIS	// conditional compilation flag for synthesis
//`define FWDALL		// conditional compilation flag to forward cells

`define TxPorts 16  // set number of transmit ports
`define RxPorts 16  // set number of receive ports


module top;

  parameter int NumRx = `RxPorts;
  parameter int NumTx = `TxPorts;

  logic rst_n, clk;

  // System Clock and Reset
  initial begin
    rst_n = 1;
    #500
    rst_n = 0;
    #500
    rst_n = 1;

  end

initial begin
  clk = 0;
  forever 
    #5ns clk = ~clk;
end


  Utopia Rx[0:NumRx-1] (clk);	// NumRx x Level 1 Utopia Rx Interface
  Utopia Tx[0:NumTx-1] (clk);	// NumTx x Level 1 Utopia Tx Interface
  cpu_ifc mif();	  // Intel-style Utopia parallel management interface
  
  squat16 squat16(			
			    .clk                 ( clk                    ), 
			    .rst_n               ( rst_n                  ),	
				
                                .BusMode             ( mif.BusMode            ),
				.Addr                ( mif.Addr               ), 
				.Sel                 ( mif.Sel                ), 
				.DataIn              ( mif.DataIn             ), 
				.Rd_DS               ( mif.Rd_DS              ), 
				.Wr_RW               ( mif.Wr_RW              ),
		        .DataOut             ( mif.DataOut            ), 
				.Rdy_Dtack           ( mif.Rdy_Dtack          ),
				 
                .rx0_soc             ( Rx[0].soc              ),
				.rx0_data            ( Rx[0].data             ),
				.rx0_clav            ( Rx[0].clav             ),
				.rx0_en              ( Rx[0].en               ),
				 
                .rx1_soc             ( Rx[1].soc              ),
				.rx1_data            ( Rx[1].data             ),
				.rx1_clav            ( Rx[1].clav             ),
				.rx1_en              ( Rx[1].en               ),
				 
                .rx2_soc             ( Rx[2].soc              ),
				.rx2_data            ( Rx[2].data             ),
				.rx2_clav            ( Rx[2].clav             ),
				.rx2_en              ( Rx[2].en               ),
			 
                .rx3_soc             ( Rx[3].soc              ),
				.rx3_data            ( Rx[3].data             ),
				.rx3_clav            ( Rx[3].clav             ),
				.rx3_en              ( Rx[3].en               ),
				 
                .rx4_soc             ( Rx[4].soc              ),
                .rx4_data            ( Rx[4].data             ),
                .rx4_clav            ( Rx[4].clav             ),
                .rx4_en              ( Rx[4].en               ),

                .rx5_soc             ( Rx[5].soc              ),
                .rx5_data            ( Rx[5].data             ),
                .rx5_clav            ( Rx[5].clav             ),
                .rx5_en              ( Rx[5].en               ),

                .rx6_soc             ( Rx[6].soc              ),
                .rx6_data            ( Rx[6].data             ),
                .rx6_clav            ( Rx[6].clav             ),
                .rx6_en              ( Rx[6].en               ),

                .rx7_soc             ( Rx[7].soc              ),
                .rx7_data            ( Rx[7].data             ),
                .rx7_clav            ( Rx[7].clav             ),
                .rx7_en              ( Rx[7].en               ),

                .rx8_soc             ( Rx[8].soc              ),
                .rx8_data            ( Rx[8].data             ),
                .rx8_clav            ( Rx[8].clav             ),
                .rx8_en              ( Rx[8].en               ),

                .rx9_soc             ( Rx[9].soc              ),
                .rx9_data            ( Rx[9].data             ),
                .rx9_clav            ( Rx[9].clav             ),
                .rx9_en              ( Rx[9].en               ),

                .rx10_soc             ( Rx[10].soc              ),
                .rx10_data            ( Rx[10].data             ),
                .rx10_clav            ( Rx[10].clav             ),
                .rx10_en              ( Rx[10].en               ),

                .rx11_soc             ( Rx[11].soc              ),
                .rx11_data            ( Rx[11].data             ),
                .rx11_clav            ( Rx[11].clav             ),
                .rx11_en              ( Rx[11].en               ),

                .rx12_soc             ( Rx[12].soc              ),
                .rx12_data            ( Rx[12].data             ),
                .rx12_clav            ( Rx[12].clav             ),
                .rx12_en              ( Rx[12].en               ),

                .rx13_soc             ( Rx[13].soc              ),
                .rx13_data            ( Rx[13].data             ),
                .rx13_clav            ( Rx[13].clav             ),
                .rx13_en              ( Rx[13].en               ),

                .rx14_soc             ( Rx[14].soc              ),
                .rx14_data            ( Rx[14].data             ),
                .rx14_clav            ( Rx[14].clav             ),
                .rx14_en              ( Rx[14].en               ),

                .rx15_soc             ( Rx[15].soc              ),
                .rx15_data            ( Rx[15].data             ),
                .rx15_clav            ( Rx[15].clav             ),
                .rx15_en              ( Rx[15].en               ),

				.tx0_soc             ( Tx[0].soc              ),
				.tx0_data            ( Tx[0].data             ),
				.tx0_en              ( Tx[0].en               ),
				.tx0_clav            ( Tx[0].clav             ),
			 
				.tx1_soc             ( Tx[1].soc              ),
				.tx1_data            ( Tx[1].data             ),
				.tx1_en              ( Tx[1].en               ),
				.tx1_clav            ( Tx[1].clav             ),
			 
				.tx2_soc             ( Tx[2].soc              ),
				.tx2_data            ( Tx[2].data             ),
				.tx2_en              ( Tx[2].en               ),
				.tx2_clav            ( Tx[2].clav             ),
				 
				.tx3_soc             ( Tx[3].soc              ),
				.tx3_data            ( Tx[3].data             ),
				.tx3_en              ( Tx[3].en               ),
				.tx3_clav            ( Tx[3].clav             ),

                .tx4_soc             ( Tx[4].soc              ),
                .tx4_data            ( Tx[4].data             ),
                .tx4_en              ( Tx[4].en               ),
                .tx4_clav            ( Tx[4].clav             ),

                .tx5_soc             ( Tx[5].soc              ),
                .tx5_data            ( Tx[5].data             ),
                .tx5_en              ( Tx[5].en               ),
                .tx5_clav            ( Tx[5].clav             ),

                .tx6_soc             ( Tx[6].soc              ),
                .tx6_data            ( Tx[6].data             ),
                .tx6_en              ( Tx[6].en               ),
                .tx6_clav            ( Tx[6].clav             ),

                .tx7_soc             ( Tx[7].soc              ),
                .tx7_data            ( Tx[7].data             ),
                .tx7_en              ( Tx[7].en               ),
                .tx7_clav            ( Tx[7].clav             ),

                .tx8_soc             ( Tx[8].soc              ),
                .tx8_data            ( Tx[8].data             ),
                .tx8_en              ( Tx[8].en               ),
                .tx8_clav            ( Tx[8].clav             ),

                .tx9_soc             ( Tx[9].soc              ),
                .tx9_data            ( Tx[9].data             ),
                .tx9_en              ( Tx[9].en               ),
                .tx9_clav            ( Tx[9].clav             ),

                .tx10_soc             ( Tx[10].soc              ),
                .tx10_data            ( Tx[10].data             ),
                .tx10_en              ( Tx[10].en               ),
                .tx10_clav            ( Tx[10].clav             ),

                .tx11_soc             ( Tx[11].soc              ),
                .tx11_data            ( Tx[11].data             ),
                .tx11_en              ( Tx[11].en               ),
                .tx11_clav            ( Tx[11].clav             ),

                .tx12_soc             ( Tx[12].soc              ),
                .tx12_data            ( Tx[12].data             ),
                .tx12_en              ( Tx[12].en               ),
                .tx12_clav            ( Tx[12].clav             ),

                .tx13_soc             ( Tx[13].soc              ),
                .tx13_data            ( Tx[13].data             ),
                .tx13_en              ( Tx[13].en               ),
                .tx13_clav            ( Tx[13].clav             ),

                .tx14_soc             ( Tx[14].soc              ),
                .tx14_data            ( Tx[14].data             ),
                .tx14_en              ( Tx[14].en               ),
                .tx14_clav            ( Tx[14].clav             ),

                .tx15_soc             ( Tx[15].soc              ),
                .tx15_data            ( Tx[15].data             ),
                .tx15_en              ( Tx[15].en               ),
                .tx15_clav            ( Tx[15].clav             )
				);	// DUT
				
  test  #(NumRx, NumTx) t1(Rx, Tx, mif, clk, rst_n);	// Test




  initial begin

        $vcdpluson; 
	$timeformat(-9, 1, "ns", 10);
	//$fsdbDumpvars;
	
  end


endmodule : top
