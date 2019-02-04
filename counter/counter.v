`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:52 02/01/2019 
// Design Name: 
// Module Name:    counter 
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

// basic counter
module counter(
    input clk,
    output [3:0] out1
    );
	 
	 reg [3:0] counter;
initial counter = 0;	
always @(posedge clk)
begin
counter <= counter + 1'd1;
end
assign out1 = counter;
endmodule




















