`include "Decoder_interface.sv"
`include "Decoder_dut.sv"
`include "Decoder_tb.sv"

module Decoder_top();
intf inf();
Decoder_dut Decoder_dut(inf);
Decoder_test Decoder_test(inf);
endmodule