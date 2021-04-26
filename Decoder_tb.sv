//`ifndef _tb_
//`define _tb_
`include "Decoder_env.sv"

program Decoder_test(intf.Decoder_test inf);
environment env;
initial begin
env = new(inf);
env.env_run();
end
endprogram
//`endif

