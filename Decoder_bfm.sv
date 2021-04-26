//Decoder BFM
`ifndef _bfm_
`define _bfm_
`include "Decoder_bp.sv"

class bfm;
basepacket pkt;
mailbox drv2bfm, bfm2sb;


function new(basepacket pkt, mailbox drv2bfm, bfm2sb);
this.pkt = pkt;
this.drv2bfm = drv2bfm;
this.bfm2sb = bfm2sb;
endfunction

task bfm_run();
begin
drv2bfm.get(pkt);
pkt.Y = ((pkt.enable)?(1<<pkt.A):16'b0);
$display ("Enable = %b, A = %16b, Y= %4b", pkt.enable, pkt.A, pkt.Y);
bfm2sb.put(pkt);
end
endtask
endclass
`endif
