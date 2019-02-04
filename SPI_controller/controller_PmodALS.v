`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:33:49 02/04/2019 
// Design Name: 
// Module Name:    controller_PmodALS 
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
module controller_PmodALS(
    input sw,
    input scl,
    input sdo,
	 input cs,
    output ecs,
    output [15:0] out
    );
		reg [15:0] led;
		reg [3:0] counter;
		reg [15:0] cycle;
		integer i;
	initial 
	   begin
		led = 0;
		counter =0;
		end
	
		always  @(negedge sw or posedge scl or negedge cs)
			begin
			if(!cs) 
				begin 
				if(sw)
					begin
					cycle[counter] =sdo;
					counter = counter +1'd1;
					if (!counter) led = cycle;
					end
				else
				if(!led) led =0;
				else led =16'hFFFF;
				end
			else
			led = 0;
			end
	
		assign ecs = cs;
		assign out = led;
endmodule
