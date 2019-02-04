`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:04:49 02/01/2019
// Design Name:   counter
// Module Name:   /home/ise/projects/cnt/counter/c_test.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module c_test;

	// Inputs
	reg clk;
	wire [3:0] out1;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.out1(out1)
	);
	always #(5)
    clk =  ~ clk;    // clk
	initial begin
		// Initialize Inputs
		clk = 0;
	

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

  
	end
      
endmodule

