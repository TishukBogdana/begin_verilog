`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:38 02/04/2019
// Design Name:   controller_PmodALS
// Module Name:   /home/ise/projects/SPI_controller/spi_test.v
// Project Name:  SPI_controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_PmodALS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spi_test;

	// Inputs
	reg sw;
	reg scl;
	reg sdo;
	reg cs;

	// Outputs
	wire ecs;
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	controller_PmodALS uut (
		.sw(sw), 
		.scl(scl), 
		.sdo(sdo), 
		.cs(cs), 
		.ecs(ecs), 
		.out(out)
	);
always begin
 #5 scl = ~scl;
 end
 always begin
#7 sdo = ~sdo;
 end
	initial begin
		// Initialize Inputs
		sw = 1;
		scl = 0;
		sdo = 1;
		cs = 0;
	           
		// Add stimulus here
		# 55 cs = 0;
		# 300 sw = 0;
 		# 100 cs = 1;
	end
      
endmodule

