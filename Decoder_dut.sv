module Decoder_dut(intf.Decoder_dut inf);
  initial begin
$display("inf.enable = %b, inf.A = %4b", inf.enable, inf.A); end
assign inf.Y = (inf.enable)?(1<<inf.A):16'b0;
endmodule