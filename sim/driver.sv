`ifndef DRIVER__SV
`define DRIVER__SV


//`include "atm_cell.sv"
//`include "Utopia.sv"

/////////////////////////////////////////////////////////////////////////////
class Driver;

   mailbox gen2drv;	// For cells sent from generator
   event   drv2gen;	// Tell generator when I am done with cell
   vUtopiaRx Rx;	// Virtual interface for transmitting cells

   int PortID;
   
   extern function new(input mailbox gen2drv, 
                       input event drv2gen, 
		               input vUtopiaRx Rx, 
					   input int PortID);
   extern task run();
   extern task send (input UNI_cell ucell);

endclass : Driver


//---------------------------------------------------------------------------
// new(): Construct a driver object
//---------------------------------------------------------------------------
function Driver::new(input mailbox gen2drv,
		             input event drv2gen,
		             input vUtopiaRx Rx,
		             input int PortID);
   this.gen2drv = gen2drv;
   this.drv2gen = drv2gen;
   this.Rx      = Rx;
   this.PortID  = PortID;
endfunction : new 


//---------------------------------------------------------------------------
// run(): Run the driver. 
// Get transaction from generator, send into DUT
//---------------------------------------------------------------------------
task Driver::run();
   UNI_cell ucell;

   // Initialize ports
   Rx.cbr.data  <= 0;
   Rx.cbr.soc   <= 0;
   Rx.cbr.clav  <= 0;

   forever begin
      // Read the cell at the front of the mailbox
      gen2drv.peek(ucell);

      begin: Tx
      //ucell.display($psprintf("@%0t: Drv%0d: ", $time, PortID));
      send(ucell);
      refmodel(ucell);
      end: Tx

      gen2drv.get(ucell);      // Remove cell from the mailbox
      ->drv2gen;	       // Tell the generator we are done with this cell
   end
endtask : run

//---------------------------------------------------------------------------
// send(): Send a cell into the DUT
//---------------------------------------------------------------------------

task Driver::send(input UNI_cell ucell);
 
   ATMCellType pkt_gen ;	
   
   ucell.pack(pkt_gen);     

   //////////////////////////////////////

   $write("Sending cell: "); 
   foreach (pkt_gen.Mem[i]) 
       $write("%x ", pkt_gen.Mem[i]); $display;
   
   // Iterate through bytes of cell, deasserting Start Of Cell indicater
   @(Rx.cbr);
   Rx.cbr.clav <= 1;
   for (int i=0; i<=52; i++) begin
        while (Rx.cbr.en === 1'b0) 
		   @(Rx.cbr);
		
        Rx.cbr.soc  <= (i == 0);
        Rx.cbr.data <= pkt_gen.Mem[i];
        @(Rx.cbr);
   end
	 
   repeat (1) @(negedge clk)  ;
	 
   Rx.cbr.soc  <= 0    ;
   Rx.cbr.data <= 8'b0 ;
   Rx.cbr.clav <= 1    ;
   
endtask


`endif // DRIVER__SV
