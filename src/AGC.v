
`timescale 1 ns / 1 ns

module AGC
          (clk,
           rst_n,
           clk_enable,
           In1,
           reset_not,
           ce_out,
           Out);


  input   clk;
  input   rst_n;
  input   clk_enable;
  input   signed [7:0] In1;
  input   reset_not;
  output  ce_out;
  output  signed [7:0] Out;


  wire enb;
  wire [15:0] Constant_out1;
  wire [9:0] Constant1_out1;
  wire [9:0] counter_val;
  wire [9:0] clk_counter_switch_out;
  reg [9:0] clk_counter;
  wire signed [8:0] Abs_y;
  wire signed [8:0] Abs_cast;
  wire [7:0] abs_input_val;
  wire sub_frame_start;
  wire [16:0] MinMax1_op_stage1;
  wire [15:0] abs_input_val_dtc;
  wire [15:0] current_max;
  reg [15:0] Memory_out1;
  wire [16:0] MinMax1_op_stage2;
  wire [16:0] MinMax1_stage1_val;
  wire [15:0] MinMax1_out1;
  reg [15:0] pre_clamp_gain;
  wire [15:0] dtc_out;
  wire [15:0] applied_gain;
  reg [15:0] delay_applied_gain;
  wire signed [16:0] Product_cast;
  wire signed [24:0] Product_mul_temp;
  wire signed [23:0] Product_cast_1;
  wire signed [7:0] Product_out1;
  reg [15:0] Divide_div_temp;


  assign Constant_out1 = 16'b1111000010100100;


  assign Constant1_out1 = 10'b0000000000;


  assign enb = clk_enable;

  assign clk_counter_switch_out = (reset_not == 1'b0 ? Constant1_out1 :
              counter_val);


  always @(posedge clk or negedge rst_n)
    begin : Memory1_clk_counter_process
      if (rst_n == 1'b0) begin
        clk_counter <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          clk_counter <= clk_counter_switch_out;
        end
      end
    end


  assign counter_val = clk_counter + 10'b0000000001;


  assign Abs_cast = {In1[7], In1};
  assign Abs_y = (In1 < 8'sb00000000 ?  - (Abs_cast) :
              {In1[7], In1});
  assign abs_input_val = Abs_y[7:0];


  assign sub_frame_start = counter_val == 10'b0000000000;


  assign MinMax1_op_stage1 = {abs_input_val, 9'b000000000};


  assign abs_input_val_dtc = {abs_input_val[6:0], 9'b000000000};



  always @(posedge clk or negedge rst_n)
    begin : Memory_process
      if (rst_n == 1'b0) begin
        Memory_out1 <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          Memory_out1 <= current_max;
        end
      end
    end


  assign MinMax1_op_stage2 = {1'b0, Memory_out1};


  assign MinMax1_stage1_val = (MinMax1_op_stage1 >= MinMax1_op_stage2 ? MinMax1_op_stage1 :
              MinMax1_op_stage2);


  assign MinMax1_out1 = MinMax1_stage1_val[15:0];


  assign current_max = (sub_frame_start == 1'b0 ? MinMax1_out1 :
              abs_input_val_dtc);


  always @(Constant_out1, current_max) begin
    Divide_div_temp = 16'b0000000000000000;
    if (current_max == 16'b0000000000000000) begin
      pre_clamp_gain = 16'b1111111111111111;
    end
    else begin
      Divide_div_temp = Constant_out1 / current_max;
      pre_clamp_gain = Divide_div_temp;
    end
  end


  assign dtc_out = (pre_clamp_gain[15:5] != 11'b00000000000 ? 16'b1111111111111111 :
              {pre_clamp_gain[4:0], 11'b00000000000});



  assign applied_gain = (dtc_out > 16'b1010000000000000 ? 16'b1010000000000000 :
              dtc_out);


  always @(posedge clk or negedge rst_n)
    begin : Unit_Delay_process
      if (rst_n == 1'b0) begin
        delay_applied_gain <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          delay_applied_gain <= applied_gain;
        end
      end
    end


  assign Product_cast = {1'b0, delay_applied_gain};
  assign Product_mul_temp = In1 * Product_cast;
  assign Product_cast_1 = Product_mul_temp[23:0];
  assign Product_out1 = Product_cast_1[18:11];


  assign Out = Product_out1;

  assign ce_out = clk_enable;

endmodule   
