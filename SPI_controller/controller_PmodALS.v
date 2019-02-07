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
   input rst,
   input clk,
   input sdo,
   output reg scl,
   output reg cs,
   output [15:0] out
   
  );
       reg [1:0] auto;
       reg [15:0] led;
       reg [3:0] counter;
       reg [15:0] cycle;
        reg [6:0] delim_freq;
       always  @( posedge clk )
           begin
       if(rst)
       begin
       led  <=0;
       counter <=0;
       cycle <=0;
       delim_freq <=0;
       scl <=0;
       cs <=1;
       auto <=0;
       end
       else
       begin
       
            if(auto != 3)
               begin 
                       cs = 0;     
                        delim_freq <= delim_freq + 1'd1;
                       if(delim_freq == 10)
                           scl <= ~scl;
                        
                       if (delim_freq == 20)
                           begin
                            delim_freq <= 0;
                               scl <= ~scl;
                               cycle[counter] <= sdo;
                               counter <= counter +1'd1;
                               
                               if (!counter)
                               auto <= auto+1;
                                if(sw)
                                led <= cycle;
                                else
                                    begin
                                    if(!cycle) led =16'hffff;
                                    else led = 0; 
                                    end
                                end  
                               
                       
               end
           else 
           begin
           auto <= auto+1;
               cs = 1;
               led <= 0;
               scl <= 0;
           end
           end
           end    
       assign out = led;
endmodule
