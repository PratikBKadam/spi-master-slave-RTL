module tb;
reg clk,rst;
reg data_send_enable;
reg [7:0]data_send_master;
reg [7:0]data_send_slave;
wire [7:0]data_receive_master;
wire data_receive_master_enable;
wire [7:0]data_receive_slave;
wire data_receive_slave_enable;
wire cs,sclk,miso,mosi;

spi dut(
.clk(clk),.rst(rst),
.data_send_enable(data_send_enable),
.data_send_master(data_send_master),
.data_send_slave(data_send_slave),
.data_receive_master(data_receive_master),
.data_receive_master_enable(data_receive_master_enable),
.data_receive_slave(data_receive_slave),
.data_receive_slave_enable(data_receive_slave_enable),
.cs(cs),
.sclk(sclk),
.miso(miso),
.mosi(mosi)
);
initial begin
clk=0;
forever #5 clk=~clk;
#1000;
$stop;
end
initial begin
rst=0;
data_send_enable=0;
data_send_master=8'h00;
data_send_slave=8'h00;
#10;
rst=1;
data_send_enable=1;
data_send_master=8'hd3;
data_send_slave=8'hc2;
#10;
data_send_enable=0;
data_send_master=8'h00;
data_send_slave=8'h00;
#70;
data_send_enable=1;
data_send_master=8'ha9;
data_send_slave=8'h35;
#10;
data_send_enable=0;
data_send_master=8'h00;
data_send_slave=8'h00;
#80;
$stop;
end
endmodule
