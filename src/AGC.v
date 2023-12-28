
`timescale 1 ns / 1 ns

module AGC
          (clk,
           rst_n,
           clk_enable,
           In1,
           reset_not,
           ce_out,
           Out3);


  input   clk;
  input   rst_n;
  input   clk_enable;
  input   signed [7:0] In1;
  input   reset_not;
  output  ce_out;
  output  signed [7:0] Out3;


  wire enb;
  wire [15:0] Constant_out1;
  wire [9:0] Constant1_out1;
  wire [9:0] counter_val;
  wire [9:0] Reset1_out1;
  reg [9:0] clk_counter;
  wire sub_frame_start;
  wire signed [8:0] Abs_y;
  wire signed [8:0] Abs_cast;
  wire signed [7:0] Abs_out1;
  wire signed [7:0] current_max;
  reg signed [7:0] Memory_out1;
  wire signed [7:0] MinMax1_out1;
  reg signed [15:0] pre_clamp_gain;
  wire signed [15:0] applied_gain;
  wire signed [23:0] Product_mul_temp;
  wire signed [7:0] Product_out1;
  reg signed [16:0] Divide_div_temp;
  reg signed [16:0] Divide_cast;


  assign Constant_out1 = 16'b0111100001010010;


  assign Constant1_out1 = 10'b0000000000;


  assign enb = clk_enable;

  assign Reset1_out1 = (reset_not == 1'b0 ? Constant1_out1 :
              counter_val);


  always @(posedge clk or negedge rst_n)
    begin : Memory1_clk_counter_process
      if (rst_n == 1'b0) begin
        clk_counter <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          clk_counter <= Reset1_out1;
        end
      end
    end


  assign counter_val = clk_counter + 10'b0000000001;


  assign sub_frame_start = counter_val == 10'b0000000000;


  assign Abs_cast = {In1[7], In1};
  assign Abs_y = (In1 < 8'sb00000000 ?  - (Abs_cast) :
              {In1[7], In1});
  assign Abs_out1 = Abs_y[7:0];


  always @(posedge clk or negedge rst_n)
    begin : Memory_process
      if (rst_n == 1'b0) begin
        Memory_out1 <= 8'sb00000000;
      end
      else begin
        if (enb) begin
          Memory_out1 <= current_max;
        end
      end
    end


  MinMax1 u_MinMax1 (.in0(Abs_out1),
                     .in1(Memory_out1),
                     .out0(MinMax1_out1)
                     );
  assign current_max = (sub_frame_start == 1'b0 ? MinMax1_out1 :
              Abs_out1);


  always @(Constant_out1, current_max) begin
    Divide_div_temp = 17'sb00000000000000000;
    Divide_cast = 17'sb00000000000000000;
    if (current_max == 8'sb00000000) begin
      pre_clamp_gain = 16'sb0111111111111111;
    end
    else begin
      Divide_cast = {1'b0, Constant_out1};
      Divide_div_temp = Divide_cast / current_max;
      if ((Divide_div_temp[16] == 1'b0) && (Divide_div_temp[15] != 1'b0)) begin
        pre_clamp_gain = 16'sb0111111111111111;
      end
      else if ((Divide_div_temp[16] == 1'b1) && (Divide_div_temp[15] != 1'b1)) begin
        pre_clamp_gain = 16'sb1000000000000000;
      end
      else begin
        pre_clamp_gain = Divide_div_temp[15:0];
      end
    end
  end


  assign applied_gain = (pre_clamp_gain > 16'sb0001010000000000 ? 16'sb0001010000000000 :
              (pre_clamp_gain < 16'sb0000000000000000 ? 16'sb0000000000000000 :
              pre_clamp_gain));


  assign Product_mul_temp = In1 * applied_gain;
  assign Product_out1 = Product_mul_temp[15:8];


  assign Out3 = Product_out1;

  assign ce_out = clk_enable;

endmodule   
