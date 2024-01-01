module Divide_rsvd
          (clk,
           reset_x,
           dividend_in,
           divisor_in,
           quotient);


  input   clk;
  input   reset_x;
  input   [15:0] dividend_in;
  input   [15:0] divisor_in;
  output  [15:0] quotient;


  wire trueFlag_1;
  wire [5:0] latencyValueConstantSignal;
  wire [5:0] initFlagAddDataOut;
  reg [5:0] initFlagAddDataOutDelay_1;
  wire Relational_Operator_relop1;
  reg  initFlagDelay_1;
  wire initFlagDelayData;
  wire [5:0] initFlagDelayData_1;
  wire [4:0] Add_add_cast;
  wire [4:0] Add_add_cast_1;
  wire [4:0] Add_add_temp;
  reg [15:0] dividend_in_reg;
  wire signed [33:0] In1_dtc_1;
  reg signed [33:0] corrected_z_p_1;
  reg [15:0] divisor_in_reg;
  wire signed [18:0] In2_dtc_1;
  reg signed [18:0] corrected_d_p_1;
  wire signed [18:0] iteration_temp;
  wire signed [18:0] iteration_add_cast;
  wire [18:0] iteration_1;
  wire signed [18:0] iteration_2;
  wire [33:0] iteration_3;
  wire signed [19:0] iteration_4;
  wire signed [19:0] iteration_5;
  wire signed [33:0] r1;
  wire signed [18:0] d1;
  reg signed [33:0] r1_p;
  reg signed [18:0] d1_p;
  wire signed [18:0] iteration_y;
  wire signed [18:0] iteration_temp_1;
  wire signed [19:0] iteration_in1;
  wire [18:0] iteration_7;
  wire signed [18:0] iteration_8;
  wire [33:0] iteration_9;
  wire signed [19:0] iteration_10;
  wire signed [33:0] r2;
  wire signed [18:0] d2;
  reg signed [33:0] r2_p;
  reg signed [18:0] d2_p;
  wire signed [18:0] iteration_y_1;
  wire signed [18:0] iteration_temp_2;
  wire signed [19:0] iteration_in1_1;
  wire [18:0] iteration_12;
  wire signed [18:0] iteration_13;
  wire [33:0] iteration_14;
  wire signed [19:0] iteration_15;
  wire signed [33:0] r3;
  wire signed [18:0] d3;
  reg signed [33:0] r3_p;
  reg signed [18:0] d3_p;
  wire signed [18:0] iteration_y_2;
  wire signed [18:0] iteration_temp_3;
  wire signed [19:0] iteration_in1_2;
  wire [18:0] iteration_17;
  wire signed [18:0] iteration_18;
  wire [33:0] iteration_19;
  wire signed [19:0] iteration_20;
  wire signed [33:0] r4;
  wire signed [18:0] d4;
  reg signed [33:0] r4_p;
  reg signed [18:0] d4_p;
  wire signed [18:0] iteration_y_3;
  wire signed [18:0] iteration_temp_4;
  wire signed [19:0] iteration_in1_3;
  wire [18:0] iteration_22;
  wire signed [18:0] iteration_23;
  wire [33:0] iteration_24;
  wire signed [19:0] iteration_25;
  wire signed [33:0] r5;
  wire signed [18:0] d5;
  reg signed [33:0] r5_p;
  reg signed [18:0] d5_p;
  wire signed [18:0] iteration_y_4;
  wire signed [18:0] iteration_temp_5;
  wire signed [19:0] iteration_in1_4;
  wire [18:0] iteration_27;
  wire signed [18:0] iteration_28;
  wire [33:0] iteration_29;
  wire signed [19:0] iteration_30;
  wire signed [33:0] r6;
  wire signed [18:0] d6;
  reg signed [33:0] r6_p;
  reg signed [18:0] d6_p;
  wire signed [18:0] iteration_y_5;
  wire signed [18:0] iteration_temp_6;
  wire signed [19:0] iteration_in1_5;
  wire [18:0] iteration_32;
  wire signed [18:0] iteration_33;
  wire [33:0] iteration_34;
  wire signed [19:0] iteration_35;
  wire signed [33:0] r7;
  wire signed [18:0] d7;
  reg signed [33:0] r7_p;
  reg signed [18:0] d7_p;
  wire signed [18:0] iteration_y_6;
  wire signed [18:0] iteration_temp_7;
  wire signed [19:0] iteration_in1_6;
  wire [18:0] iteration_37;
  wire signed [18:0] iteration_38;
  wire [33:0] iteration_39;
  wire signed [19:0] iteration_40;
  wire signed [33:0] r8;
  wire signed [18:0] d8;
  reg signed [33:0] r8_p;
  reg signed [18:0] d8_p;
  wire signed [18:0] iteration_y_7;
  wire signed [18:0] iteration_temp_8;
  wire signed [19:0] iteration_in1_7;
  wire [18:0] iteration_42;
  wire signed [18:0] iteration_43;
  wire [33:0] iteration_44;
  wire signed [19:0] iteration_45;
  wire signed [33:0] r9;
  wire signed [18:0] d9;
  reg signed [33:0] r9_p;
  reg signed [18:0] d9_p;
  wire signed [18:0] iteration_y_8;
  wire signed [18:0] iteration_temp_9;
  wire signed [19:0] iteration_in1_8;
  wire [18:0] iteration_47;
  wire signed [18:0] iteration_48;
  wire [33:0] iteration_49;
  wire signed [19:0] iteration_50;
  wire signed [33:0] r10;
  wire signed [18:0] d10;
  reg signed [33:0] r10_p;
  reg signed [18:0] d10_p;
  wire signed [18:0] iteration_y_9;
  wire signed [18:0] iteration_temp_10;
  wire signed [19:0] iteration_in1_9;
  wire [18:0] iteration_52;
  wire signed [18:0] iteration_53;
  wire [33:0] iteration_54;
  wire signed [19:0] iteration_55;
  wire signed [33:0] r11;
  wire signed [18:0] d11;
  reg signed [33:0] r11_p;
  reg signed [18:0] d11_p;
  wire signed [18:0] iteration_y_10;
  wire signed [18:0] iteration_temp_11;
  wire signed [19:0] iteration_in1_10;
  wire [18:0] iteration_57;
  wire signed [18:0] iteration_58;
  wire [33:0] iteration_59;
  wire signed [19:0] iteration_60;
  wire signed [33:0] r12;
  wire signed [18:0] d12;
  reg signed [33:0] r12_p;
  reg signed [18:0] d12_p;
  wire signed [18:0] iteration_y_11;
  wire signed [18:0] iteration_temp_12;
  wire signed [19:0] iteration_in1_11;
  wire [18:0] iteration_62;
  wire signed [18:0] iteration_63;
  wire [33:0] iteration_64;
  wire signed [19:0] iteration_65;
  wire signed [33:0] r13;
  wire signed [18:0] d13;
  reg signed [33:0] r13_p;
  reg signed [18:0] d13_p;
  wire signed [18:0] iteration_y_12;
  wire signed [18:0] iteration_temp_13;
  wire signed [19:0] iteration_in1_12;
  wire [18:0] iteration_67;
  wire signed [18:0] iteration_68;
  wire [33:0] iteration_69;
  wire signed [19:0] iteration_70;
  wire signed [33:0] r14;
  wire signed [18:0] d14;
  reg signed [33:0] r14_p;
  reg signed [18:0] d14_p;
  wire signed [18:0] iteration_y_13;
  wire signed [18:0] iteration_temp_14;
  wire signed [19:0] iteration_in1_13;
  wire [18:0] iteration_72;
  wire signed [18:0] iteration_73;
  wire [33:0] iteration_74;
  wire signed [19:0] iteration_75;
  wire signed [33:0] r15;
  wire signed [18:0] d15;
  reg signed [33:0] r15_p;
  reg signed [18:0] d15_p;
  wire signed [18:0] iteration_y_14;
  wire signed [18:0] iteration_temp_15;
  wire signed [19:0] iteration_in1_14;
  wire [18:0] iteration_77;
  wire signed [18:0] iteration_78;
  wire [33:0] iteration_79;
  wire signed [19:0] iteration_80;
  wire signed [33:0] r16;
  wire signed [18:0] d16;
  reg signed [33:0] r16_p;
  wire [15:0] qTemp;
  reg [15:0] qtempExt_p_1;
  wire [15:0] ConstantSignal_1;
  wire [15:0] qtempPost;
  wire [15:0] qoutDTC;
  reg [15:0] quotient_1;

  initial begin
    initFlagDelay_1 = 1'b0;
    dividend_in_reg = 16'b0000000000000000;
    corrected_z_p_1 = 34'sh000000000;
    divisor_in_reg = 16'b0000000000000000;
    corrected_d_p_1 = 19'sb0000000000000000000;
    r1_p = 34'sh000000000;
    d1_p = 19'sb0000000000000000000;
    r2_p = 34'sh000000000;
    d2_p = 19'sb0000000000000000000;
    r3_p = 34'sh000000000;
    d3_p = 19'sb0000000000000000000;
    r4_p = 34'sh000000000;
    d4_p = 19'sb0000000000000000000;
    r5_p = 34'sh000000000;
    d5_p = 19'sb0000000000000000000;
    r6_p = 34'sh000000000;
    d6_p = 19'sb0000000000000000000;
    r7_p = 34'sh000000000;
    d7_p = 19'sb0000000000000000000;
    r8_p = 34'sh000000000;
    d8_p = 19'sb0000000000000000000;
    r9_p = 34'sh000000000;
    d9_p = 19'sb0000000000000000000;
    r10_p = 34'sh000000000;
    d10_p = 19'sb0000000000000000000;
    r11_p = 34'sh000000000;
    d11_p = 19'sb0000000000000000000;
    r12_p = 34'sh000000000;
    d12_p = 19'sb0000000000000000000;
    r13_p = 34'sh000000000;
    d13_p = 19'sb0000000000000000000;
    r14_p = 34'sh000000000;
    d14_p = 19'sb0000000000000000000;
    r15_p = 34'sh000000000;
    d15_p = 19'sb0000000000000000000;
    r16_p = 34'sh000000000;
    qtempExt_p_1 = 16'b0000000000000000;
    quotient_1 = 16'b0000000000000000;
  end

  assign trueFlag_1 = 1'b1;



  assign latencyValueConstantSignal = 6'b010011;



  always @(posedge clk or negedge reset_x)
    begin : initFlagAddDataOutDelay_process
      if (reset_x == 1'b0) begin
        initFlagAddDataOutDelay_1 <= 6'b000001;
      end
      else begin
        initFlagAddDataOutDelay_1 <= initFlagAddDataOut;
      end
    end



  always @(posedge clk)
    begin : initFlagDelay_process
      initFlagDelay_1 <= Relational_Operator_relop1;
    end



  assign initFlagDelayData = initFlagDelay_1 & trueFlag_1;



  assign initFlagDelayData_1 = {5'b0, initFlagDelayData};



  assign Add_add_cast = initFlagDelayData_1[4:0];
  assign Add_add_cast_1 = initFlagAddDataOutDelay_1[4:0];
  assign Add_add_temp = Add_add_cast + Add_add_cast_1;
  assign initFlagAddDataOut = {1'b0, Add_add_temp};



  assign Relational_Operator_relop1 = initFlagAddDataOut <= latencyValueConstantSignal;



  always @(posedge clk)
    begin : z_p_process
      dividend_in_reg <= dividend_in;
    end



  assign In1_dtc_1 = {18'b0, dividend_in_reg};



  always @(posedge clk)
    begin : corrected_z_p_process
      corrected_z_p_1 <= In1_dtc_1;
    end



  always @(posedge clk)
    begin : d_p_process
      divisor_in_reg <= divisor_in;
    end



  assign In2_dtc_1 = {3'b0, divisor_in_reg};



  always @(posedge clk)
    begin : corrected_d_p_process
      corrected_d_p_1 <= In2_dtc_1;
    end



  // non Restore iteration stage 1
  assign iteration_4 = {corrected_d_p_1[18], corrected_d_p_1};
  assign iteration_5 =  - (iteration_4);
  assign iteration_add_cast = iteration_5[18:0];
  assign iteration_1 = corrected_z_p_1[33:15];
  assign iteration_2 = iteration_1;
  assign iteration_temp = iteration_2 + iteration_add_cast;
  assign iteration_3 = {iteration_temp[17:0], corrected_z_p_1[14:0],  ~ iteration_temp[17]};
  assign r1 = iteration_3;
  assign d1 = corrected_d_p_1;



  always @(posedge clk)
    begin : r_reg_process
      r1_p <= r1;
    end



  always @(posedge clk)
    begin : d_reg_process
      d1_p <= d1;
    end



  // non Restore iteration stage 2
  assign iteration_10 = {d1_p[18], d1_p};
  assign iteration_in1 =  - (iteration_10);
  assign iteration_y = (( ~ r1_p[33]) == 1'b0 ? d1_p :
              $signed(iteration_in1[18:0]));
  assign iteration_7 = r1_p[33:15];
  assign iteration_8 = iteration_7;
  assign iteration_temp_1 = iteration_8 + iteration_y;
  assign iteration_9 = {iteration_temp_1[17:0], r1_p[14:0],  ~ iteration_temp_1[17]};
  assign r2 = iteration_9;
  assign d2 = d1_p;



  always @(posedge clk)
    begin : r_reg_1_process
      r2_p <= r2;
    end



  always @(posedge clk)
    begin : d_reg_1_process
      d2_p <= d2;
    end



  // non Restore iteration stage 3
  assign iteration_15 = {d2_p[18], d2_p};
  assign iteration_in1_1 =  - (iteration_15);
  assign iteration_y_1 = (( ~ r2_p[33]) == 1'b0 ? d2_p :
              $signed(iteration_in1_1[18:0]));
  assign iteration_12 = r2_p[33:15];
  assign iteration_13 = iteration_12;
  assign iteration_temp_2 = iteration_13 + iteration_y_1;
  assign iteration_14 = {iteration_temp_2[17:0], r2_p[14:0],  ~ iteration_temp_2[17]};
  assign r3 = iteration_14;
  assign d3 = d2_p;



  always @(posedge clk)
    begin : r_reg_2_process
      r3_p <= r3;
    end



  always @(posedge clk)
    begin : d_reg_2_process
      d3_p <= d3;
    end



  // non Restore iteration stage 4
  assign iteration_20 = {d3_p[18], d3_p};
  assign iteration_in1_2 =  - (iteration_20);
  assign iteration_y_2 = (( ~ r3_p[33]) == 1'b0 ? d3_p :
              $signed(iteration_in1_2[18:0]));
  assign iteration_17 = r3_p[33:15];
  assign iteration_18 = iteration_17;
  assign iteration_temp_3 = iteration_18 + iteration_y_2;
  assign iteration_19 = {iteration_temp_3[17:0], r3_p[14:0],  ~ iteration_temp_3[17]};
  assign r4 = iteration_19;
  assign d4 = d3_p;



  always @(posedge clk)
    begin : r_reg_3_process
      r4_p <= r4;
    end



  always @(posedge clk)
    begin : d_reg_3_process
      d4_p <= d4;
    end



  // non Restore iteration stage 5
  assign iteration_25 = {d4_p[18], d4_p};
  assign iteration_in1_3 =  - (iteration_25);
  assign iteration_y_3 = (( ~ r4_p[33]) == 1'b0 ? d4_p :
              $signed(iteration_in1_3[18:0]));
  assign iteration_22 = r4_p[33:15];
  assign iteration_23 = iteration_22;
  assign iteration_temp_4 = iteration_23 + iteration_y_3;
  assign iteration_24 = {iteration_temp_4[17:0], r4_p[14:0],  ~ iteration_temp_4[17]};
  assign r5 = iteration_24;
  assign d5 = d4_p;



  always @(posedge clk)
    begin : r_reg_4_process
      r5_p <= r5;
    end



  always @(posedge clk)
    begin : d_reg_4_process
      d5_p <= d5;
    end



  // non Restore iteration stage 6
  assign iteration_30 = {d5_p[18], d5_p};
  assign iteration_in1_4 =  - (iteration_30);
  assign iteration_y_4 = (( ~ r5_p[33]) == 1'b0 ? d5_p :
              $signed(iteration_in1_4[18:0]));
  assign iteration_27 = r5_p[33:15];
  assign iteration_28 = iteration_27;
  assign iteration_temp_5 = iteration_28 + iteration_y_4;
  assign iteration_29 = {iteration_temp_5[17:0], r5_p[14:0],  ~ iteration_temp_5[17]};
  assign r6 = iteration_29;
  assign d6 = d5_p;



  always @(posedge clk)
    begin : r_reg_5_process
      r6_p <= r6;
    end



  always @(posedge clk)
    begin : d_reg_5_process
      d6_p <= d6;
    end



  // non Restore iteration stage 7
  assign iteration_35 = {d6_p[18], d6_p};
  assign iteration_in1_5 =  - (iteration_35);
  assign iteration_y_5 = (( ~ r6_p[33]) == 1'b0 ? d6_p :
              $signed(iteration_in1_5[18:0]));
  assign iteration_32 = r6_p[33:15];
  assign iteration_33 = iteration_32;
  assign iteration_temp_6 = iteration_33 + iteration_y_5;
  assign iteration_34 = {iteration_temp_6[17:0], r6_p[14:0],  ~ iteration_temp_6[17]};
  assign r7 = iteration_34;
  assign d7 = d6_p;



  always @(posedge clk)
    begin : r_reg_6_process
      r7_p <= r7;
    end



  always @(posedge clk)
    begin : d_reg_6_process
      d7_p <= d7;
    end



  // non Restore iteration stage 8
  assign iteration_40 = {d7_p[18], d7_p};
  assign iteration_in1_6 =  - (iteration_40);
  assign iteration_y_6 = (( ~ r7_p[33]) == 1'b0 ? d7_p :
              $signed(iteration_in1_6[18:0]));
  assign iteration_37 = r7_p[33:15];
  assign iteration_38 = iteration_37;
  assign iteration_temp_7 = iteration_38 + iteration_y_6;
  assign iteration_39 = {iteration_temp_7[17:0], r7_p[14:0],  ~ iteration_temp_7[17]};
  assign r8 = iteration_39;
  assign d8 = d7_p;



  always @(posedge clk)
    begin : r_reg_7_process
      r8_p <= r8;
    end



  always @(posedge clk)
    begin : d_reg_7_process
      d8_p <= d8;
    end



  // non Restore iteration stage 9
  assign iteration_45 = {d8_p[18], d8_p};
  assign iteration_in1_7 =  - (iteration_45);
  assign iteration_y_7 = (( ~ r8_p[33]) == 1'b0 ? d8_p :
              $signed(iteration_in1_7[18:0]));
  assign iteration_42 = r8_p[33:15];
  assign iteration_43 = iteration_42;
  assign iteration_temp_8 = iteration_43 + iteration_y_7;
  assign iteration_44 = {iteration_temp_8[17:0], r8_p[14:0],  ~ iteration_temp_8[17]};
  assign r9 = iteration_44;
  assign d9 = d8_p;



  always @(posedge clk)
    begin : r_reg_8_process
      r9_p <= r9;
    end



  always @(posedge clk)
    begin : d_reg_8_process
      d9_p <= d9;
    end



  // non Restore iteration stage 10
  assign iteration_50 = {d9_p[18], d9_p};
  assign iteration_in1_8 =  - (iteration_50);
  assign iteration_y_8 = (( ~ r9_p[33]) == 1'b0 ? d9_p :
              $signed(iteration_in1_8[18:0]));
  assign iteration_47 = r9_p[33:15];
  assign iteration_48 = iteration_47;
  assign iteration_temp_9 = iteration_48 + iteration_y_8;
  assign iteration_49 = {iteration_temp_9[17:0], r9_p[14:0],  ~ iteration_temp_9[17]};
  assign r10 = iteration_49;
  assign d10 = d9_p;



  always @(posedge clk)
    begin : r_reg_9_process
      r10_p <= r10;
    end



  always @(posedge clk)
    begin : d_reg_9_process
      d10_p <= d10;
    end



  // non Restore iteration stage 11
  assign iteration_55 = {d10_p[18], d10_p};
  assign iteration_in1_9 =  - (iteration_55);
  assign iteration_y_9 = (( ~ r10_p[33]) == 1'b0 ? d10_p :
              $signed(iteration_in1_9[18:0]));
  assign iteration_52 = r10_p[33:15];
  assign iteration_53 = iteration_52;
  assign iteration_temp_10 = iteration_53 + iteration_y_9;
  assign iteration_54 = {iteration_temp_10[17:0], r10_p[14:0],  ~ iteration_temp_10[17]};
  assign r11 = iteration_54;
  assign d11 = d10_p;



  always @(posedge clk)
    begin : r_reg_10_process
      r11_p <= r11;
    end



  always @(posedge clk)
    begin : d_reg_10_process
      d11_p <= d11;
    end



  // non Restore iteration stage 12
  assign iteration_60 = {d11_p[18], d11_p};
  assign iteration_in1_10 =  - (iteration_60);
  assign iteration_y_10 = (( ~ r11_p[33]) == 1'b0 ? d11_p :
              $signed(iteration_in1_10[18:0]));
  assign iteration_57 = r11_p[33:15];
  assign iteration_58 = iteration_57;
  assign iteration_temp_11 = iteration_58 + iteration_y_10;
  assign iteration_59 = {iteration_temp_11[17:0], r11_p[14:0],  ~ iteration_temp_11[17]};
  assign r12 = iteration_59;
  assign d12 = d11_p;



  always @(posedge clk)
    begin : r_reg_11_process
      r12_p <= r12;
    end



  always @(posedge clk)
    begin : d_reg_11_process
      d12_p <= d12;
    end



  // non Restore iteration stage 13
  assign iteration_65 = {d12_p[18], d12_p};
  assign iteration_in1_11 =  - (iteration_65);
  assign iteration_y_11 = (( ~ r12_p[33]) == 1'b0 ? d12_p :
              $signed(iteration_in1_11[18:0]));
  assign iteration_62 = r12_p[33:15];
  assign iteration_63 = iteration_62;
  assign iteration_temp_12 = iteration_63 + iteration_y_11;
  assign iteration_64 = {iteration_temp_12[17:0], r12_p[14:0],  ~ iteration_temp_12[17]};
  assign r13 = iteration_64;
  assign d13 = d12_p;



  always @(posedge clk)
    begin : r_reg_12_process
      r13_p <= r13;
    end



  always @(posedge clk)
    begin : d_reg_12_process
      d13_p <= d13;
    end



  // non Restore iteration stage 14
  assign iteration_70 = {d13_p[18], d13_p};
  assign iteration_in1_12 =  - (iteration_70);
  assign iteration_y_12 = (( ~ r13_p[33]) == 1'b0 ? d13_p :
              $signed(iteration_in1_12[18:0]));
  assign iteration_67 = r13_p[33:15];
  assign iteration_68 = iteration_67;
  assign iteration_temp_13 = iteration_68 + iteration_y_12;
  assign iteration_69 = {iteration_temp_13[17:0], r13_p[14:0],  ~ iteration_temp_13[17]};
  assign r14 = iteration_69;
  assign d14 = d13_p;



  always @(posedge clk)
    begin : r_reg_13_process
      r14_p <= r14;
    end



  always @(posedge clk)
    begin : d_reg_13_process
      d14_p <= d14;
    end



  // non Restore iteration stage 15
  assign iteration_75 = {d14_p[18], d14_p};
  assign iteration_in1_13 =  - (iteration_75);
  assign iteration_y_13 = (( ~ r14_p[33]) == 1'b0 ? d14_p :
              $signed(iteration_in1_13[18:0]));
  assign iteration_72 = r14_p[33:15];
  assign iteration_73 = iteration_72;
  assign iteration_temp_14 = iteration_73 + iteration_y_13;
  assign iteration_74 = {iteration_temp_14[17:0], r14_p[14:0],  ~ iteration_temp_14[17]};
  assign r15 = iteration_74;
  assign d15 = d14_p;



  always @(posedge clk)
    begin : r_reg_14_process
      r15_p <= r15;
    end



  always @(posedge clk)
    begin : d_reg_14_process
      d15_p <= d15;
    end



  // non Restore iteration stage 16
  assign iteration_80 = {d15_p[18], d15_p};
  assign iteration_in1_14 =  - (iteration_80);
  assign iteration_y_14 = (( ~ r15_p[33]) == 1'b0 ? d15_p :
              $signed(iteration_in1_14[18:0]));
  assign iteration_77 = r15_p[33:15];
  assign iteration_78 = iteration_77;
  assign iteration_temp_15 = iteration_78 + iteration_y_14;
  assign iteration_79 = {iteration_temp_15[17:0], r15_p[14:0],  ~ iteration_temp_15[17]};
  assign r16 = iteration_79;
  assign d16 = d15_p;



  always @(posedge clk)
    begin : r_reg_15_process
      r16_p <= r16;
    end



  assign qTemp = r16_p[15:0];



  always @(posedge clk)
    begin : qtempExt_p_process
      qtempExt_p_1 <= qTemp;
    end



  assign ConstantSignal_1 = 16'b0000000000000000;



  assign qtempPost = (Relational_Operator_relop1 == 1'b0 ? qtempExt_p_1 :
              ConstantSignal_1);



  assign qoutDTC = qtempPost;



  always @(posedge clk)
    begin : q_q_process
      quotient_1 <= qoutDTC;
    end



  assign quotient = quotient_1;

endmodule  // Divide_rsvd

