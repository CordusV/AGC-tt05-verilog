
`timescale 1 ns / 1 ns

module MinMax1
          (in0,
           in1,
           out0);


  input   signed [7:0] in0;
  input   signed [7:0] in1;
  output  signed [7:0] out0;


  wire signed [7:0] MinMax1_muxout [0:1];
  wire signed [7:0] MinMax1_stage1_val;


  assign MinMax1_muxout[0] = in0;
  assign MinMax1_muxout[1] = in1;
  assign MinMax1_stage1_val = (MinMax1_muxout[0] >= MinMax1_muxout[1] ? MinMax1_muxout[0] :
              MinMax1_muxout[1]);


  assign out0 = MinMax1_stage1_val;
endmodule   
