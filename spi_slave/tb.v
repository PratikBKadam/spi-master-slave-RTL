module tb;
reg data_send_enable;
reg [7:0] data_send_slave;
reg cs,sclk,mosi;
wire miso;
wire [7:0] data_receive_slave;
wire data_receive_slave_enable;
spi_slave dut
(
	.data_send_enable(data_send_enable),
	.data_send_slave(data_send_slave),
	.cs(cs),
	.sclk(sclk),
	.mosi(mosi),
	.miso(miso),
	.data_receive_slave(data_receive_slave),
	.data_receive_slave_enable(data_receive_slave_enable)
);

initial begin
	sclk=0;
	forever #5 sclk=~sclk;
	#1000;
	$stop;
end
initial begin
	cs=1'b1;
	mosi=1'b0;
	data_send_slave=8'h00;
	data_send_enable=1'b0;
	#10;
	cs=1'b0;
	data_send_enable=1'b1;
	data_send_slave=8'ha3;
	mosi=1'b1;
	#10;
	data_send_enable=1'b0;
	data_send_slave=8'h00;
	mosi=1'b0;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b0;
	#10
	mosi=1'b0;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b0;
	#10;
	mosi=1'b1;
	data_send_enable=1'b1;
	data_send_slave=8'h42;
	#10;
	data_send_enable=1'b0;
	data_send_slave=8'h00;
	mosi=1'b0;
	#10;
	mosi=1'b0;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b1;
	#10
	mosi=1'b0;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b1;
	#10;
	mosi=1'b0;
	data_send_slave=8'h00;
	#5;
	cs=1'b1;
	#10;
	$stop;
end
endmodule
