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
	reg clk;
	reg sdo;
    reg rst;
	// Outputs
	wire scl;
	wire cs;
	wire [15:0] out;
 
	// Instantiate the Unit Under Test (UUT)
controller_PmodALS uut (
		.sw(sw), 
		.rst(rst),
		.clk(clk),
		.sdo(sdo),  
		.scl(scl),
		.cs(cs), 
		.out(out)	
	);
always begin
 #2 clk = ~clk;
 end
always begin
  #5 sdo = ~sdo;
  end

	initial begin
		// Initialize Inputs
		sw = 1;
		clk = 0;
		sdo = 1;
		
	     rst = 1;      
		// Add stimulus here
		# 3 rst = 0;
		
		# 500000 sw = 0;
 		
	end
      
endmodule

