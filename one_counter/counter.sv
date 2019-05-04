
module counter #(
parameter WIDTH  =8,
parameter WIDTH2 =$clog2(WIDTH)
)(
input        [WIDTH-1:0] data_i,
input                    data_val_i,
input                    clk_i,
input                    srst_i,
output logic [WIDTH2:0]  data_o,
output logic data_val_o
);



integer             i;
logic    [WIDTH2:0] counter;

always_comb
  begin 
    counter = 0;
	   for(i = 0; i < WIDTH; i = i + 1)
		  begin
		    if( data_i[i] == 1 )
			 counter = counter+1;
			 else 
			 counter = counter;
			 end
		   end

always_ff @(posedge clk_i)
  begin
   if(srst_i)   begin
     data_o<=0;
     data_val_o<=0;
	end else  begin
	   if(data_val_i)  begin
	      data_o <= counter;
         data_val_o<=1;
		  end
		else  begin
		  data_val_o<=0;
		  end
	  end
	end

endmodule
