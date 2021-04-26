
`include "Decoder_bp.sv"
`include "Decoder_cov.sv"


class scoreboard;
basepacket pkt1, pkt2;
mailbox bfm2sb, mon2sb;

function new(basepacket pkt1, pkt2, mailbox bfm2sb, mon2sb);
this.pkt1 = pkt1;
this.pkt2 = pkt2;
this.bfm2sb = bfm2sb;
this.mon2sb = mon2sb;
pkt1 = new();
pkt2 = new();
bfm2sb = new();
mon2sb = new();
endfunction

task sb_run();
begin
  #10
bfm2sb.get(pkt1);
mon2sb.get(pkt2);
if (pkt1.Y == pkt2.Y) 
$display("Data matched! bfm Y = %16b, dut Y = %16b", pkt1.Y, pkt2.Y);
else
$display("Data not Matched! bfm Y = %16b, dut Y = %16b", pkt1.Y, pkt2.Y);
end
endtask
endclass
