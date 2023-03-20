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
    `include "scoreboard.sv"
    `include "cpu_driver.sv"
    `include "coverage.sv"

    /////////////////////////////////////////////////////////
    // Call scoreboard from Driver using callbacks
    /////////////////////////////////////////////////////////
    class Scb_Driver_cbs extends Driver_cbs;
        Scoreboard scb;

        function new(Scoreboard scb);
            this.scb = scb;
        endfunction : new

        // Send received cell to scoreboard
        virtual task post_tx(input Driver drv,
                        input UNI_cell ucell);
            scb.save_expected(ucell);
        endtask : post_tx
    endclass : Scb_Driver_cbs


    /////////////////////////////////////////////////////////
    // Call scoreboard from Monitor using callbacks
    /////////////////////////////////////////////////////////
    class Scb_Monitor_cbs extends Monitor_cbs;
        Scoreboard scb;

        function new(Scoreboard scb);
            this.scb = scb;
        endfunction : new

        // Send received cell to scoreboard
        virtual task post_rx(input Monitor mon,
                        input NNI_cell ncell);
            scb.check_actual(ncell, mon.PortID);
        endtask : post_rx
    endclass : Scb_Monitor_cbs

    /////////////////////////////////////////////////////////
    // Call coverage from Monitor using callbacks
    /////////////////////////////////////////////////////////
    class Cov_Monitor_cbs extends Monitor_cbs;
        Coverage cov;

        function new(Coverage cov);
            this.cov = cov;
        endfunction : new

        // Send received cell to coverage
        virtual task post_rx(input Monitor mon,
                        input NNI_cell ncell);
            // CellCfgType CellCfg = top.squat.fwdtable.lut.read(ncell.VPI);
            CellCfgType CellCfg = top.squat16.fwdtable.lut.Mem[ncell.VPI];
            cov.sample(mon.PortID, CellCfg.FWD);
        endtask : post_rx
    endclass : Cov_Monitor_cbs

  //////////////////////////////////////////////////////////////////////////////////////////////////

    virtual Utopia.TB_Rx vRx[0:NumRx-1];
    virtual Utopia.TB_Tx vTx[0:NumTx-1];

    UNI_generator gen[];
    mailbox gen2drv[];
    event   drv2gen[];
    Driver drv[];
    Monitor mon[];
    Coverage cov;
    Scoreboard scb;
    int numRx, numTx;
    CPU_driver cpu;

    NNI_cell expect_cells[$]       ;
    // 报文数量
    int         nCells[]           ;
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

        cpu = new(mif);

        // gen2drv = new[NumRx];
        // drv2gen = new[NumRx];
        // gen=new[NumRx];
        // drv=new[NumRx];

        gen2drv = new[8];
        drv2gen = new[8];
        gen=new[8];
        drv=new[8];

        nCells = new[8];

        foreach(gen[i]) begin
            nCells[i] = $urandom_range(20,40);
            $display("%h Port Send %h Packets",i,nCells[i]);
            gen2drv[i] = new();
            gen[i] = new(gen2drv[i], drv2gen[i], nCells[i], i);
            drv[i] = new(gen2drv[i], drv2gen[i], vRx[i], i);
        end

        scb = new();
        cov = new();
        mon = new[NumTx];
        // mon = new[4];
        foreach (mon[i])
            mon[i] = new(vTx[i], i);
        
        begin
            Scb_Driver_cbs sdc = new(scb);
            Scb_Monitor_cbs smc = new(scb);
            foreach (drv[i]) drv[i].cbsq.push_back(sdc);  // Add scb to every driver
            foreach (mon[i]) mon[i].cbsq.push_back(smc);  // Add scb to every monitor
        end

        // Connect coverage with callbacks
        begin
            Cov_Monitor_cbs smc = new(cov);
            foreach (mon[i]) mon[i].cbsq.push_back(smc);  // Add cov to every monitor
        end

        $display("###################################################################");
        $display("##################  Program Start !!!!!! ##########################");
        $display("###################################################################");

        reset();

        cpu.run();

        foreach(gen[i])  begin
            int j=i;
            fork 
                gen[j].run();
                drv[j].run();
            join_none
        end

        
        foreach(mon[i]) begin
            int j=i;
            fork
                mon[j].run();
            join_none
        end

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

    task wait_for_end();
        
        fork : timeout_block
            begin
                wait(cov.cov_done.triggered);
            end

            begin
                repeat (1_000_000) @(Rx[0].cbr);
                $display("@%0t: %m ERROR: Timeout while waiting for generators to finish", $time);
            end
        join_any
        disable timeout_block;

        repeat(5000) @(clk);

    endtask: wait_for_end

endprogram
