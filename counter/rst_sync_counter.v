`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:57:02 02/04/2019 
// Design Name: 
// Module Name:    rst_sync_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//counter with sychronous reset, rst low active
module rst_sync_counter(input rst, input clk, output [3:0] out);
reg [3:0] counter;
initial counter = 0;
	always @(posedge clk)
	begin
	if(!rst) 
   counter <= 0;
	else 
	counter <= counter + 1'd1;
	end
	assign out = counter;
endmodule
