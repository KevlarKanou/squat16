`include "definitions.sv"
`include "atm_cell.sv"

program automatic test
    #(parameter int NumRx = 4, parameter int NumTx = 4)(
        Utopia.TB_Rx Rx[0:NumRx-1],
        Utopia.TB_Tx Tx[0:NumTx-1],
        cpu_ifc.Test mif,
        input logic clk, rst_n
    );

    `include "generator.sv"
    `include "driver.sv"
    `include "monitor.sv"
    `include "cpu_driver.sv"
    
    virtual Utopia.TB_Rx vRx[0:NumRx-1];
    virtual Utopia.TB_Tx vTx[0:NumTx-1];

    UNI_generator gen;
    mailbox gen2drv;
    event   drv2gen;
    Driver drv;
    Monitor mon;
    //Scoreboard scb;
    int numRx, numTx;
    CPU_driver cpu;

    NNI_cell expect_cells[$]       ;
    // 报文数量
    int         nCells             ;
    // int         nCells_running     ;

    initial begin

        vTx[0] = Tx[0];
        vTx[1] = Tx[1];
        vTx[2] = Tx[2];
        vTx[3] = Tx[3];
        vTx[4] = Tx[4];
        vTx[5] = Tx[5];
        vTx[6] = Tx[6];
        vTx[7] = Tx[7];
        vTx[8] = Tx[8];
        vTx[9] = Tx[9];
        vTx[10] = Tx[10];
        vTx[11] = Tx[11];
        vTx[12] = Tx[12];
        vTx[13] = Tx[13];
        vTx[14] = Tx[14];
        vTx[15] = Tx[15];

        vRx[0] = Rx[0];
        vRx[1] = Rx[1];
        vRx[2] = Rx[2];
        vRx[3] = Rx[3];      
        vRx[4] = Rx[4];
        vRx[5] = Rx[5];
        vRx[6] = Rx[6];
        vRx[7] = Rx[7];
        vRx[8] = Rx[8];
        vRx[9] = Rx[9];
        vRx[10] = Rx[10];
        vRx[11] = Rx[11];
        vRx[12] = Rx[12];
        vRx[13] = Rx[13];
        vRx[14] = Rx[14];
        vRx[15] = Rx[15];

        nCells = 4 ;
        // nCells_running = nCells ;
        
        cpu = new(mif);
        
        gen2drv = new();
        gen = new(gen2drv, drv2gen, nCells, 0);	
        drv = new(gen2drv, drv2gen, vRx[0], 0);
        mon = new(vTx[3], 3);

        $display("###################################################################");
        $display("##################  Program Start !!!!!! ##########################");
        $display("###################################################################");

        reset();

        cpu.run();

        fork 
            gen.run();
            drv.run();
            mon.run();
        join_none

        wait_for_end();

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

    function void refmodel (input UNI_cell ucell);

        CellCfgType CellFwd = cpu.lookup[ucell.VPI] ;
        NNI_cell u2ncell;
        u2ncell = new();
        u2ncell = ucell.to_NNI(CellFwd.VPI);

        expect_cells.push_back(u2ncell);

    endfunction

    function bit compare(ref string message,input NNI_cell ncell);
        foreach(expect_cells[i]) begin
            if(expect_cells[i].compare(ncell)) begin
                message = "Successfully Compared";
                expect_cells.delete(i);
                return(1);
            end
        end
        $display("------------------compare is FAIL------------------------");
        message = "Error, receive packet dismatch send Packet:\n";
        return (0);

    endfunction: compare

    function void check(input NNI_cell ncell);

        string message;
        static int pkts_checked = 0;

        if (!compare(message,ncell)) begin
            $display("\n%m\n[ERROR]%t Packet #%0d %s\n", $realtime, pkts_checked, message);
            $finish;
        end
        $display("[NOTE]%t Packet #%0d %s", $realtime, pkts_checked++, message);

    endfunction: check

    task wait_for_end();
        
        fork : timeout_block
            wait(gen.gen_done.triggered);
            begin
                repeat (1_000_000) @(Rx[0].cbr);
                $display("@%0t: %m ERROR: Timeout while waiting for generators to finish", $time);
            end
        join_any
        disable timeout_block;

        repeat(5000) @(clk);

    endtask: wait_for_end

endprogram
