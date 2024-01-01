module AGC
          (clk,
           reset_x,
           In1,
           reset_not,
           Out_rsvd);


  input   clk;
  input   reset_x;
  input   signed [7:0] In1;
  input   reset_not;
  output  signed [7:0] Out_rsvd;


  reg signed [7:0] In1_1;
  wire [15:0] Constant_out1;
  wire [9:0] Constant1_out1;
  wire [9:0] counter_val;
  wire [9:0] clk_counter_switch_out;
  reg [9:0] clk_counter;
  wire sub_frame_start;
  wire signed [8:0] Abs_y;
  wire signed [8:0] Abs_cast;
  wire [7:0] abs_input_val;
  reg  delayed_sub_frame_start;
  wire [16:0] MinMax1_op_stage1;
  wire [15:0] abs_input_val_dtc;
  wire [15:0] current_max;
  reg [15:0] Memory_current_max_out1;
  wire [16:0] MinMax1_op_stage2;
  wire [16:0] MinMax1_stage1_val;
  wire [15:0] MinMax1_out1;
  wire [15:0] pre_clamp_gain;
  wire [15:0] dtc_out;
  wire [15:0] applied_gain;
  reg [15:0] applied_gain_1;
  wire signed [16:0] Product_cast;
  wire signed [24:0] Product_mul_temp;
  wire signed [23:0] Product_cast_1;
  wire signed [7:0] Product_out1;
  reg signed [7:0] Product_out1_1;

  initial begin
    In1_1 = 8'sb00000000;
    clk_counter = 10'b0000000000;
    delayed_sub_frame_start = 1'b0;
    Memory_current_max_out1 = 16'b0000000000000000;
    applied_gain_1 = 16'b0000000000000000;
    Product_out1_1 = 8'sb00000000;
  end

  always @(posedge clk)
    begin : HwModeRegister_process
      In1_1 <= In1;
    end



  assign Constant_out1 = 16'b1111000010100100;


  assign Constant1_out1 = 10'b0000000000;


  assign clk_counter_switch_out = (reset_not == 1'b0 ? Constant1_out1 :
              counter_val);


  always @(posedge clk)
    begin : Memory1_clk_counter_process
      clk_counter <= clk_counter_switch_out;
    end


  assign counter_val = clk_counter + 10'b0000000001;


  assign sub_frame_start = counter_val == 10'b0000000000;


  assign Abs_cast = {In1[7], In1};
  assign Abs_y = (In1 < 8'sb00000000 ?  - (Abs_cast) :
              {In1[7], In1});
  assign abs_input_val = Abs_y[7:0];


  always @(posedge clk)
    begin : Unit_Delay_sub_frame_process
      delayed_sub_frame_start <= sub_frame_start;
    end


  assign MinMax1_op_stage1 = {abs_input_val, 9'b000000000};


  assign abs_input_val_dtc = {abs_input_val[6:0], 9'b000000000};



  always @(posedge clk)
    begin : Memory_current_max_process
      Memory_current_max_out1 <= current_max;
    end


  assign MinMax1_op_stage2 = {1'b0, Memory_current_max_out1};


  // ---- Tree max implementation ----
  assign MinMax1_stage1_val = (MinMax1_op_stage1 >= MinMax1_op_stage2 ? MinMax1_op_stage1 :
              MinMax1_op_stage2);


  assign MinMax1_out1 = MinMax1_stage1_val[15:0];


  assign current_max = (delayed_sub_frame_start == 1'b0 ? MinMax1_out1 :
              abs_input_val_dtc);


  Divide_rsvd divide_rsvd_1_1 (.clk(clk),
                               .reset_x(reset_x),
                               .dividend_in(Constant_out1),
                               .divisor_in(current_max),
                               .quotient(pre_clamp_gain)
                               );
  assign dtc_out = (pre_clamp_gain[15:5] != 11'b00000000000 ? 16'b1111111111111111 :
              {pre_clamp_gain[4:0], 11'b00000000000});



  assign applied_gain = (dtc_out > 16'b1010000000000000 ? 16'b1010000000000000 :
              dtc_out);


  always @(posedge clk)
    begin : HwModeRegister1_process
      applied_gain_1 <= applied_gain;
    end



  assign Product_cast = {1'b0, applied_gain_1};
  assign Product_mul_temp = In1_1 * Product_cast;
  assign Product_cast_1 = Product_mul_temp[23:0];
  assign Product_out1 = Product_cast_1[18:11];


  always @(posedge clk)
    begin : PipelineRegister_process
      Product_out1_1 <= Product_out1;
    end



  assign Out_rsvd = Product_out1_1;

endmodule  // AGC

