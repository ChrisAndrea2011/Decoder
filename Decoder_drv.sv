`ifndef _drv_
`define _drv_
`include "Decoder_bp.sv";


class driver;
basepacket pkt;
mailbox tx2drv, drv2bfm;
virtual intf inf;

function new(basepacket pkt, mailbox tx2drv, drv2bfm, virtual intf inf);
this.pkt = pkt;
this.tx2drv = tx2drv;
this.drv2bfm = drv2bfm;
this.inf = inf;
endfunction


task drv_run;
begin
  #5
tx2drv.get(pkt);
inf.enable = pkt.enable;
inf.A = pkt.A;
drv2bfm.put(pkt);
end
endtask
endclass
`endif
