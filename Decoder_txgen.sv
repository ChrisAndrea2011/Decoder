`ifndef tx_gen
`define tx_gen
`include "Decoder_bp.sv"
class txgen;
basepacket pkt;
mailbox tx2drv;

function new(basepacket pkt, mailbox tx2drv);
  this.pkt = pkt;
  this.tx2drv = tx2drv;
endfunction

task tx_run;

begin
  pkt.randomize();
  tx2drv.put(pkt);
  
end
endtask
endclass
`endif

