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
       reg  state;
       
       reg [15:0] led;
       reg [15:0] mem;
       reg [3:0] counter;
       reg [15:0] cycle;
       reg [6:0] delim_freq;
       
       always  @( posedge clk ) // scl generator
           begin
           if(rst)
            begin
                scl <=0;
                delim_freq<=0;
            end
            else
                begin
                   delim_freq <= delim_freq + 1'd1;
                   if(delim_freq == 50)
                       scl <= ~scl;
                    
                   if (delim_freq == 100)
                       begin
                        delim_freq <= 0;
                        scl <= ~scl;
                        end
                end
            end
            
       always @(posedge clk) //reading data
       begin
       if(rst)
        begin
          cs<=1;
                counter <=0;
                mem<=0;
                cycle <=0;
                state <=0;
        end
        else
          begin
               if (delim_freq==100)
                    begin
                        if(state == 1)
                            begin
                                if(counter == 15)
                                    begin
                                        cycle[counter] <= sdo;
                                        counter <= counter + 1'd1;
                                        state <= 0;
                                        cs <= 1;
                                    end
                                else
                                    begin
                                      cycle[counter] <= sdo;
                                      counter <= counter + 1'd1;
                                      if (counter == 0)
                                      mem <= cycle;
                                    end
                            end
                        if(state ==0)
                            begin
                            cs<=0;
                            state <=1;
                            end
                    end
            end
       end
       always @*
           begin
           if(rst)
                  led <= 0;
            if(sw)
          led <= mem;
          else
              begin
              if(mem == 0) led <=16'hffff;
              else led <= 0; 
              end
          end   
       assign out = led;
endmodule