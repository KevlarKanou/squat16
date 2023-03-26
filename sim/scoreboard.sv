
`ifndef SCOREBOARD__SV
`define SCOREBOARD__SV

//`include "atm_cell.sv"

class Expect_cells;
    NNI_cell q[$];
    int iexpect, iactual;
endclass : Expect_cells


class Scoreboard;

    Config cfg ;
    Expect_cells expect_cells[];
    NNI_cell cellq[$];
    int iexpect, iactual;

    extern function new(Config cfg);
    extern virtual function void wrap_up();
    extern function void save_expected(UNI_cell ucell, int rxPortID);
    extern function void check_actual(input NNI_cell ncell, input int portn);
    extern function void display(string prefix="");
   
endclass : Scoreboard


//---------------------------------------------------------------------------
function Scoreboard::new(Config cfg);
   this.cfg = cfg;
   expect_cells = new[cfg.numTx];
   foreach (expect_cells[i])
     expect_cells[i] = new();
endfunction // Scoreboard


//---------------------------------------------------------------------------
// 将 UNI 报文转成 NNI 报文
// 并根据 lookup 表中的 FWD，保存到对应端口的 NNI 期望队列中
// 可判断 UNI 报文来源
function void Scoreboard::save_expected(UNI_cell ucell, int rxPortID);

    CellCfgType CellFwd = env.cpu.lookup[{ucell.VPI, ucell.VCI}] ;
    NNI_cell u2ncell;
    NNI_cell discard;

    u2ncell = new();

    // 模拟UNI转NNI，本测试平台全部透传
    u2ncell = ucell.to_NNI(CellFwd.VPI, CellFwd.VCI);

    discard = new();
    discard.VPI   = 0;
    discard.VCI   = 0;
    discard.CLP   = 0;
    discard.PT    = 0;
    discard.HEC   = 0;
    foreach(discard.Payload[i])
        discard.Payload[i]  = 0;

    $display("@%0t: Scb save: VPI=%0x, VCI=%0x, Forward=%b", $time, CellFwd.VPI, CellFwd.VCI, CellFwd.FWD);

    for (int i=0; i<NumTx; i++)
        if (CellFwd.FWD[i]) begin
            if ((i == 0) || (i == 15) || ((i <= 7) && (rxPortID <= 7)) || ((i >= 8) && (rxPortID >=8))) begin
                expect_cells[i].q.push_back(u2ncell); // Save cell in this forward queue
                // expect_cells[i].iexpect++;
                // iexpect++;
            end
            else begin
                expect_cells[i].q.push_back(discard);
            end
            expect_cells[i].iexpect++;
            iexpect++;
        end
	 
endfunction : save_expected


//-----------------------------------------------------------------------------
// 将收到的 NNI 报文跟本端口期望的 NNI 报文对比中所有报文进行对比
function void Scoreboard::check_actual(input NNI_cell ncell, input int portn);
			
    //ncell.display($psprintf("@%0t: Scb check: ", $time));
                
    if (expect_cells[portn].q.size() == 0) begin
        $display("@%0t: ERROR: %m cell not found because scoreboard for TX%0d empty", $time, portn);
        ncell.display("Not Found: ");
        return;
    end
    
    expect_cells[portn].iactual++;
    iactual++;

    foreach (expect_cells[portn].q[i]) begin
        if (expect_cells[portn].q[i].compare(ncell)) begin
            //$display("@%0t: Match found for cell", $time);
            $display("@%0t: Packet %m Successfully Compare !!!!", $time,ncell);
            //$display("@%0t: Packet %m Successfully Compare !!!!", $time,ncell);
            expect_cells[portn].q.delete(i);
            return;
        end
    end

    //$display("@%0t: ERROR: %m cell not found", $time,ncell);
    $display("@%0t: Packet %m Compare Fail !!!", $time,ncell);
    //$display("@%0t: Packet %d Cell is %m !!!", $time,iactual,ncell);
    ncell.display("Not Found: ");
    $finish; 
					   
 
endfunction : check_actual


//---------------------------------------------------------------------------
// Print end of simulation report
//---------------------------------------------------------------------------
function void Scoreboard::wrap_up();
    $display("@%0t: %m %0d expected cells, %0d actual cells received", $time, iexpect, iactual);

    // Look for leftover cells
    foreach (expect_cells[i]) begin
        if (expect_cells[i].q.size()) begin
            $display("@%0t: %m cells remaining in Tx[%0d] scoreboard at end of test", $time, i);
            this.display("Unclaimed: ");
        end
    end
endfunction : wrap_up


//---------------------------------------------------------------------------
// Print the contents of the scoreboard, mainly for debugging
//---------------------------------------------------------------------------
function void Scoreboard::display(string prefix);
    $display("@%0t: %m so far %0d expected cells, %0d actual cells received", $time, iexpect, iactual);
    foreach (expect_cells[i]) begin
        $display("Tx[%0d]: exp=%0d, act=%0d", i, expect_cells[i].iexpect, expect_cells[i].iactual);
        foreach (expect_cells[i].q[j])
            expect_cells[i].q[j].display($psprintf("%sScoreboard: Tx%0d: ", prefix, i));
    end
endfunction : display

`endif
