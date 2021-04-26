`ifndef _env_
`define _env_
`include "Decoder_bp.sv"
`include "Decoder_txgen.sv"
`include "Decoder_drv.sv"
`include "Decoder_bfm.sv"
`include "Decoder_mon.sv"
`include "Decoder_sb.sv"

class environment;
basepacket pkt1, pkt2;
mailbox tx2drv, drv2bfm, bfm2sb, mon2sb;

txgen tx;
driver drv;
bfm fm;
monitor mon;
scoreboard sb;
virtual intf inf;

function new(virtual intf inf);
pkt1 = new();
pkt2 = new();
tx2drv = new();
drv2bfm = new();
bfm2sb = new();
mon2sb = new();
tx = new(pkt1, tx2drv);
drv = new(pkt1, tx2drv, drv2bfm, inf);
fm = new(pkt1, drv2bfm, bfm2sb);
mon = new(pkt2, mon2sb, inf);
sb = new(pkt1, pkt2, bfm2sb, mon2sb);
endfunction

task env_run();
begin
repeat(100)
begin
//fork 
tx.tx_run();
drv.drv_run();
fm.bfm_run();
mon.mon_run();
sb.sb_run();
#2;
//join
end
end
endtask
endclass
`endif

