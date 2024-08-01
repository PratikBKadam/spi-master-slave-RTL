module tb;
reg clk,rst;
reg data_send_enable;
reg [7:0] data_send_master;
wire cs,sclk;
reg miso;
wire mosi;
wire [7:0] data_receive_master;
wire data_receive_master_enable;
spi_master dut
(
	.data_send_enable(data_send_enable),
	.data_send_master(data_send_master),
	.clk(clk),
	.rst(rst),
	.cs(cs),
	.sclk(sclk),
	.miso(miso),
	.mosi(mosi),
	.data_receive_master(data_receive_master),
	.data_receive_master_enable(data_receive_master_enable)
);

initial begin
	clk=0;
	forever #5 clk=~clk;
	#1000;
	$stop;
end
initial begin
	rst=1'b0;
	miso=1'b0;
	data_send_master=8'h00;
	data_send_enable=1'b0;
	#10;
	rst=1'b1;
	data_send_enable=1'b1;
	data_send_master=8'ha3;
	miso=1'b1;
	#10;
	data_send_enable=1'b0;
	data_send_master=8'h00;
	miso=1'b0;
	#10;
	miso=1'b1;
	#10;
	miso=1'b1;
	#10;
	miso=1'b0;
	#10
	miso=1'b0;
	#10;
	miso=1'b1;
	#10;
	miso=1'b0;
	#10;
	miso=1'b1;
	data_send_enable=1'b1;
	data_send_master=8'h42;
	#10;
	data_send_enable=1'b0;
	data_send_master=8'h00;
	miso=1'b0;
	#10;
	miso=1'b0;
	#10;
	miso=1'b1;
	#10;
	miso=1'b1;
	#10
	miso=1'b0;
	#10;
	miso=1'b1;
	#10;
	miso=1'b1;
	#10;
	miso=1'b0;
	data_send_master=8'h00;
	#5;
	rst=1'b0;
	#10;
	$stop;
end
endmodule
