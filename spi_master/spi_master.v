module spi_master
(
// input [1:0] mode, // mode[1]=CPOL, mode[0]=CPHA
input data_send_enable,
input [7:0] data_send_master,
input clk,rst,miso,
output reg mosi,
output sclk,cs,
output [7:0] data_receive_master,
output reg data_receive_master_enable
);
reg [7:0]data_receive;
reg [7:0]data_sent;
reg [2:0]count_receive=3'b000;
reg [2:0]count_send=3'b000;
// mode 0
assign data_receive_master=data_receive_master_enable?data_receive:8'h00;

assign sclk=clk;
assign cs=~rst;
always @(posedge sclk or posedge cs)
begin
	if(cs)
	begin
		data_receive=8'h00;
		data_receive_master_enable=1'b0;
	end
	else
	begin
		if(count_receive==3'b111)
		begin
			data_receive[0]=miso;
			count_receive=3'b000;
			data_receive_master_enable=1'b1;
		end
		else
		begin
			data_receive[3'b111-count_receive]=miso;
			count_receive=count_receive+1'b1;
			data_receive_master_enable=1'b0;
		end
	end
end
always @(negedge clk or negedge rst)
begin
	if(!rst)
	begin
		data_sent=8'h00;
	end
	else
	begin
		if(data_send_enable)
		begin
			data_sent=data_send_master;
		end
		else
		begin
			data_sent=data_sent;
		end
	end
end
always @(negedge clk or negedge rst)
begin
	if(!rst)
	begin
		mosi=1'b0;
	end
	else
	begin
		if(count_send==3'b111)
		begin
			mosi=data_sent[0];
			count_send=3'b000;
		end
		else
		begin
			mosi=data_sent[3'b111-count_send];
			count_send=count_send+1'b1;
		end
	end
end
endmodule
