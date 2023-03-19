
program automatic test
    #(parameter int NumRx = 4, parameter int NumTx = 4)(
        Utopia.TB_Rx Rx[0:NumRx-1],
        Utopia.TB_Tx Tx[0:NumTx-1],
        cpu_ifc.Test mif,
        input logic clk, rst_n
    );

    CellCfgType lookup [255:0]; // copy of look-up table
    bit [NumTx-1:0] fwd;

    bit [7:0] syndrome[0:255]      ;
    ATMCellType pkt_gen            ;
    ATMCellType pkt_exp            ;
    ATMCellType pkt_cmp            ;

    initial begin

        $display("###################################################################");
        $display("##################  Program Start !!!!!! ##########################");
        $display("###################################################################");

        reset();
        CPU_driver();

        gen();
        send();
        receive();

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

    task Initialize_Host ();
        mif.BusMode <= 1;
        mif.Addr <= 0;
        mif.DataIn <= 0;
        mif.Sel <= 1;
        mif.Rd_DS <= 1;
        mif.Wr_RW <= 1;
    endtask : Initialize_Host


    task HostWrite (int a, CellCfgType d); // configure
        #10 mif.Addr <= a; mif.DataIn <= d; mif.Sel <= 0;
        #10 mif.Wr_RW <= 0;
        while (mif.Rdy_Dtack!==0) #10;
        #10 mif.Wr_RW <= 1; mif.Sel <= 1;
        while (mif.Rdy_Dtack==0) #10;
    endtask : HostWrite


    task HostRead (int a, output CellCfgType d);
        #10 mif.Addr <= a; mif.Sel <= 0;
        #10 mif.Rd_DS <= 0;
        while (mif.Rdy_Dtack!==0) #10;
        #10 d = mif.DataOut; mif.Rd_DS <= 1; mif.Sel <= 1;
        while (mif.Rdy_Dtack==0) #10;
    endtask : HostRead


    task CPU_driver();
        CellCfgType CellFwd;
        Initialize_Host();

        // Configure through Host interface
        // 随机生成转发表
        repeat (10) @(negedge clk);
        $write("Memory: Loading ... ");
        for (int i=0; i<=255; i++) begin
            // CellFwd.FWD = $urandom();
            
            // 固定从 TX[3] 发送
            CellFwd.FWD = 16'b1000;
            $display("CellFwd.FWD[%0d]=%0d (%0b)", i, CellFwd.FWD, CellFwd.FWD);
            CellFwd.VPI = i;
            HostWrite(i, CellFwd);
            lookup[i] = CellFwd;
        end

        // Verify memory
        $write("Verifying ...");
        for (int i=0; i<=255; i++) begin
            HostRead(i, CellFwd);
            if (lookup[i] != CellFwd) begin
                $display("FATAL, Mem Location 0x%x contains 0x%x, expected 0x%x",
                        i, CellFwd, lookup[i]);
                $finish;
            end
        end
        $display("Verified");

    endtask : CPU_driver

    // 生成校验子
    function void generate_syndrome();
        bit [7:0] sndrm;
        for (int i = 0; i < 256; i = i + 1 ) begin
            sndrm = i;
            repeat (8) begin
                if (sndrm[7] === 1'b1)
                sndrm = (sndrm << 1) ^ 8'h07;
                else
                sndrm = sndrm << 1;
            end
            syndrome[i] = sndrm;
        end
    endfunction : generate_syndrome

    //---------------------------------------------------------------------------
    // Function to compute the HEC value
    // 计算 HEC
    function bit [7:0] hec (bit [31:0] hdr);
        bit [7:0] heca;
        heca = 8'h00;
        repeat (4) begin
            heca = syndrome[heca ^ hdr[31:24]];
            hdr = hdr << 8;
        end
        heca = heca ^ 8'h55;
        return heca;
    endfunction : hec

    // 随机生成报文数据
    task gen();
    
        pkt_gen.uni.GFC = $urandom;
        pkt_gen.uni.VPI = $urandom;
        pkt_gen.uni.VCI = $urandom;
        pkt_gen.uni.CLP = $urandom;
        pkt_gen.uni.PT  = $urandom;
        
        generate_syndrome();
        pkt_gen.uni.HEC = hec({pkt_gen.uni.GFC, pkt_gen.uni.VPI, pkt_gen.uni.VCI, pkt_gen.uni.CLP, pkt_gen.uni.PT});

        for(int i=0; i<48;i=i+1) begin
        pkt_gen.uni.Payload[i]= $urandom;
            $display("... Payload Data is %h ............",pkt_gen.uni.Payload[i]);
        end

    endtask

    // 数据送入 Rx[0]
    task send();

        @(Rx[0].cbr);
        Rx[0].cbr.clav <= 1;
        for (int i=0; i<=52; i++) begin
                while (Rx[0].cbr.en === 1'b0) @(Rx[0].cbr);
                Rx[0].cbr.soc  <= (i == 0);
                Rx[0].cbr.data <= pkt_gen.Mem[i];
                @(Rx[0].cbr);
            end
        repeat (2) @(negedge clk)  ;
        Rx[0].cbr.soc  <= 0    ;
        Rx[0].cbr.data <= 8'b0 ;
        Rx[0].cbr.clav <= 1    ;
    endtask

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // 存储 Tx[3]
    task receive();

        int j = 0 ;
        Tx[3].cbt.clav <= 1;
        
        wait(Tx[3].cbt.en);
        wait(Tx[3].cbt.soc);
        while (j<=52) begin
            if (Tx[3].cbt.en == 1'b1)begin
                pkt_cmp.Mem[j] = Tx[3].cbt.data ;
                @(Tx[3].cbt);
                j = j + 1 ;
            end
            else begin 
                @(Tx[3].cbt);
            end
        end
        repeat (2) @(posedge clk);
    endtask : receive

endprogram
