module spi(
input clk,rst,
input data_send_enable,
input [7:0]data_send_master,
input [7:0]data_send_slave,
output [7:0]data_receive_master,
output data_receive_master_enable,
output [7:0]data_receive_slave,
output data_receive_slave_enable,
output cs,sclk,miso,mosi
);

spi_master u1(
.data_send_enable(data_send_enable),
.data_send_master(data_send_master),
.clk(clk),
.rst(rst),
.miso(miso),
.mosi(mosi),
.sclk(sclk),
.cs(cs),
.data_receive_master(data_receive_master),
.data_receive_master_enable(data_receive_master_enable)
);
spi_slave u2(
.data_send_enable(data_send_enable),
.data_send_slave(data_send_slave),
.miso(miso),
.mosi(mosi),
.sclk(sclk),
.cs(cs),
.data_receive_slave(data_receive_slave),
.data_receive_slave_enable(data_receive_slave_enable)
);
endmodule
