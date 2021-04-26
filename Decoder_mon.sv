`ifndef _mon_
`define _mon_
`include "Decoder_bp.sv"

class monitor;
basepacket pkt;
mailbox mon2sb;
virtual intf inf;

function new(basepacket pkt, mailbox mon2sb, virtual intf inf);
this.pkt = pkt;
this.mon2sb = mon2sb;
this.inf = inf;
endfunction

task mon_run();
begin
  #5
pkt.Y = inf.Y;
mon2sb.put(pkt);
$display("MON::pkt.Y=%16b", pkt.Y);
end
endtask
endclass
`endif

