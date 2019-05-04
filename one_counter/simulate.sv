module test_bench;

parameter WIDTH     = 64;
parameter WIDTH2    = $clog2( WIDTH );
parameter SRST_LEN  = 1;
parameter TEST_ITER = 32;
logic [WIDTH - 1 : 0] data_i;
logic                 data_val_i;
logic                 clk_i;
logic                 srst_i;
logic                 data_val_o;
logic [WIDTH2    : 0] data_o;
logic                 er_flag;
logic [WIDTH2 :0] test_ch;

task gen_data_input  (
    output logic [WIDTH - 1 : 0] data_in ,
    output logic                 data_val_in
  );
   @( posedge clk_i )
   begin
    if(WIDTH<32)
      data_in       = $urandom_range(2**WIDTH-1, 0);
    else
      data_in       = {$urandom_range(2**(WIDTH-32)-1, 0), $urandom()};
      data_val_in   = 1;
    end
endtask

task check_value(
    input  logic [WIDTH2 : 0]    data_out,
    input  logic                 data_val_out,
    input  logic [WIDTH - 1 : 0] test_data, 
    output logic                 data_val_in
  );
   automatic logic tst;
   @( posedge clk_i )
   begin
   data_val_in = 0;
   test_ch = $countones(test_data);
   if( !(data_out == $countones(test_data))  )  begin
     er_flag = 1;
     $stop();
   end
   end
endtask

task gen_srst();
  @( posedge clk_i )
  srst_i = 1;
  repeat ( SRST_LEN )
    @ ( posedge clk_i ) ;
  srst_i = 0;
endtask


counter #(
    .WIDTH       ( WIDTH         ),
    .WIDTH2      ( $clog2(WIDTH) )
  ) tst (
    .data_i      ( data_i     ),
    .data_val_i  ( data_val_i ),
    .clk_i       ( clk_i      ),
    .srst_i      ( srst_i     ),
    .data_o      ( data_o     ),
    .data_val_o  ( data_val_o )
  );

initial
  begin
    er_flag = 0;
    clk_i   = 0;
    srst_i  = 0;
    forever #5 clk_i = ~clk_i;
  end

initial
  begin
  gen_srst();
  repeat ( TEST_ITER )
     begin
    gen_data_input(.data_in( data_i ), .data_val_in( data_val_i));
    while( ! data_val_o)
    @ ( posedge clk_i) ;
    check_value(.test_data( data_i), .data_out(data_o), .data_val_out(data_val_o),.data_val_in(data_val_i));
    while (data_val_o)
    @ ( posedge clk_i) ;
     end
  if( ! er_flag)
    $monitor("OK");
    $stop;
  end
endmodule
