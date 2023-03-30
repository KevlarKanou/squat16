

`ifndef COVERAGE__SV
`define COVERAGE__SV

class Coverage;

    bit [3:0] src;
    bit [NumTx-1:0] fwd;
    // bit [NumTx-1:0] fwd1;
    // bit [NumTx-1:0] fwd2;
    event cov_done;
    real coverage_result = 0.0;

    covergroup CG_Forward;

        coverpoint src
            {bins src[] = {[0:15]};
            option.weight = 0;}
        coverpoint fwd
            {ignore_bins ign = {0};
            option.weight = 0;}
        cross src, fwd;

    endgroup : CG_Forward

    // covergroup CG_Forward;

    //     coverpoint src
    //         {bins src[] = {[0:15]};
    //         option.weight = 0;}
    //     coverpoint fwd1
    //         {bins fwd1[] = {[1:16'h7FFF]};
    //             option.weight = 0;}
    //     coverpoint fwd2
    //         {bins fwd2[] = {[16'h8000:16'hFFFF]};
    //             option.weight = 0;}
    //     cross src, fwd1;
    //     cross src, fwd2;

    // endgroup : CG_Forward

    // covergroup CG_Forward;

    //     x_cp: coverpoint src
    //     {bins src[] = {[0:15]};
    //         option.weight = 0;}

    //     y1_cp: coverpoint fwd1
    //     {bins fwd1[] = {[1:16'h7FFF]};
    //         option.weight = 0;}

    //     y2_cp: coverpoint fwd2
    //     {bins fwd2[] = {[16'h8000:16'hFFFF]};
    //         option.weight = 0;}
        
    //     x_y1_cross : cross x_cp, y1_cp{
    //        ignore_bins ignore_fwd1 = x_y1_cross with (((y1_cp >> x_cp) & 1) == 0);
    //     }

    //     x_y2_cross : cross x_cp, y2_cp{
    //        ignore_bins ignore_fwd2 = x_y2_cross with (((y2_cp >> x_cp) & 1) == 0);
    //     }

    // endgroup : CG_Forward

        // Instantiate the covergroup
    function new;
        CG_Forward = new;
    endfunction : new

    // Sample input data
    function void sample(input bit [3:0] src,
        input bit [NumTx-1:0] fwd);
            
        $display("@%0t: Coverage: src=%d. FWD=%b", $time, src, fwd);
        this.src = src;
        this.fwd = fwd;
        // if (fwd < 16'h8000)
        //     this.fwd1 = fwd;
        // else begin
        //     this.fwd2 = fwd;
        // end
        CG_Forward.sample();
        coverage_result = $get_coverage();
        $display("###################################################################################");
        $display("@%0t: Coverage: src=%d. FWD=%b. Coverage = %3.2f", $time, src, fwd, coverage_result);
        $display("###################################################################################");

        if(coverage_result == 100) begin
            ->this.cov_done ;
            $display("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!coverage done !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        end
    endfunction : sample

endclass : Coverage


`endif // COVERAGE__SV
