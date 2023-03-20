
`ifndef GENERATOR__SV
`define GENERATOR__SV
 
//`include "atm_cell.sv"

class UNI_generator;

    UNI_cell blueprint;	// Blueprint for generator
    mailbox  gen2drv;	// Mailbox to driver for cells
    event    drv2gen;	// Event from driver when done with cell
    event    gen_done ;
    int      nCells;	// Number of cells for this generator to create
    int	    PortID;	// Which Rx port are we generating?

    function new(input mailbox gen2drv,
        input event drv2gen,
        input int nCells,
        input int PortID
    );
        this.gen2drv = gen2drv;
        this.drv2gen = drv2gen;
        this.nCells  = nCells;
        this.PortID  = PortID;
        blueprint = new();
        

    endfunction : new   
    
    task run();
        UNI_cell ucell;
        repeat (nCells) begin
            assert(blueprint.randomize());
            $cast(ucell, blueprint.copy());
            //ucell.display($psprintf("@%0t: Gen%0d: ", $time, PortID));
            gen2drv.put(ucell);
            @drv2gen;		// Wait for driver to finish with it
        end
            ->gen_done;

    endtask : run

endclass : UNI_generator   

`endif // GENERATOR__SV
