interface intf();
logic [3:0] A;
logic [15:0]Y;
logic enable;

modport Decoder_dut(input A, enable, output Y);
modport Decoder_test(output Y, input A, enable);
endinterface
