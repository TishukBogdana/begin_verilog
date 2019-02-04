`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:01:25 02/04/2019
// Design Name:   rst_sync_counter
// Module Name:   /home/ise/projects/cnt/counter/rst_s_test.v
// Project Name:  counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rst_sync_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rst_s_test;
   reg rst;
	reg clk;
	// Outputs
	wire [3:0] out_test  ;

	// Instantiate the Unit Under Test (UUT)
	rst_sync_counter uut (
		.rst(rst),
		.clk(clk),
		.out(out_test)
	);
  always 
  #50 clk =~clk;
	initial begin
		// Initialize Inputs
      rst =1;
	   clk =0;
       #145 rst =0 ;
			#175 rst =1;
		// Add stimulus here

	end
      
endmodule

