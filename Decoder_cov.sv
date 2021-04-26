`ifndef COVER
`define COVER
`include "Decoder_bp.sv"

class coverage;
basepacket pkt1, pkt2;

covergroup cg;
option.per_instance=1;
coverpoint pkt1.A;
coverpoint pkt1.enable;
endgroup

function new();
  cg = new();
endfunction

task run_cov(basepacket pkt1, pkt2);
this.pkt1 = pkt1;
this.pkt2 = pkt2;
cg.sample();
endtask
endclass
`endif

