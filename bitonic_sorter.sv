`timescale 1ns / 1ps

module bitonic_sorter (
    input logic signed [31:0] array_i[8],
    output logic signed [31:0] array_o[8]
);

    logic signed [31:0]
        array_stage1[8], array_stage2[8], array_stage3[8], array_stage4[8], array_stage5[8];

    // stage 1
    assign array_stage1[0] = (array_i[1] > array_i[0]) ? array_i[0] : array_i[1];
    assign array_stage1[1] = (array_i[1] > array_i[0]) ? array_i[1] : array_i[0];
    assign array_stage1[2] = (array_i[3] > array_i[2]) ? array_i[2] : array_i[3];
    assign array_stage1[3] = (array_i[3] > array_i[2]) ? array_i[3] : array_i[2];
    assign array_stage1[4] = (array_i[5] > array_i[4]) ? array_i[4] : array_i[5];
    assign array_stage1[5] = (array_i[5] > array_i[4]) ? array_i[5] : array_i[4];
    assign array_stage1[6] = (array_i[7] > array_i[6]) ? array_i[6] : array_i[7];
    assign array_stage1[7] = (array_i[7] > array_i[6]) ? array_i[7] : array_i[6];

    // stage 2
    assign array_stage2[0] = (array_stage1[3] > array_stage1[0]) ? array_stage1[0] : array_stage1[3];
    assign array_stage2[3] = (array_stage1[3] > array_stage1[0]) ? array_stage1[3] : array_stage1[0];
    assign array_stage2[1] = (array_stage1[2] > array_stage1[1]) ? array_stage1[1] : array_stage1[2];
    assign array_stage2[2] = (array_stage1[2] > array_stage1[1]) ? array_stage1[2] : array_stage1[1];
    assign array_stage2[4] = (array_stage1[7] > array_stage1[4]) ? array_stage1[4] : array_stage1[7];
    assign array_stage2[7] = (array_stage1[7] > array_stage1[4]) ? array_stage1[7] : array_stage1[4];
    assign array_stage2[5] = (array_stage1[6] > array_stage1[5]) ? array_stage1[5] : array_stage1[6];
    assign array_stage2[6] = (array_stage1[6] > array_stage1[5]) ? array_stage1[6] : array_stage1[5];

    // stage 3
    assign array_stage3[0] = (array_stage2[1] > array_stage2[0]) ? array_stage2[0] : array_stage2[1];
    assign array_stage3[1] = (array_stage2[1] > array_stage2[0]) ? array_stage2[1] : array_stage2[0];
    assign array_stage3[2] = (array_stage2[3] > array_stage2[2]) ? array_stage2[2] : array_stage2[3];
    assign array_stage3[3] = (array_stage2[3] > array_stage2[2]) ? array_stage2[3] : array_stage2[2];
    assign array_stage3[4] = (array_stage2[5] > array_stage2[4]) ? array_stage2[4] : array_stage2[5];
    assign array_stage3[5] = (array_stage2[5] > array_stage2[4]) ? array_stage2[5] : array_stage2[4];
    assign array_stage3[6] = (array_stage2[7] > array_stage2[6]) ? array_stage2[6] : array_stage2[7];
    assign array_stage3[7] = (array_stage2[7] > array_stage2[6]) ? array_stage2[7] : array_stage2[6];

    // stage 4
    assign array_stage4[0] = (array_stage3[7] > array_stage3[0]) ? array_stage3[0] : array_stage3[7];
    assign array_stage4[7] = (array_stage3[7] > array_stage3[0]) ? array_stage3[7] : array_stage3[0];
    assign array_stage4[1] = (array_stage3[6] > array_stage3[1]) ? array_stage3[1] : array_stage3[6];
    assign array_stage4[6] = (array_stage3[6] > array_stage3[1]) ? array_stage3[6] : array_stage3[1];
    assign array_stage4[2] = (array_stage3[5] > array_stage3[2]) ? array_stage3[2] : array_stage3[5];
    assign array_stage4[5] = (array_stage3[5] > array_stage3[2]) ? array_stage3[5] : array_stage3[2];
    assign array_stage4[3] = (array_stage3[4] > array_stage3[3]) ? array_stage3[3] : array_stage3[4];
    assign array_stage4[4] = (array_stage3[4] > array_stage3[3]) ? array_stage3[4] : array_stage3[3];

    // stage 5
    assign array_stage5[0] = (array_stage4[2] > array_stage4[0]) ? array_stage4[0] : array_stage4[2];
    assign array_stage5[2] = (array_stage4[2] > array_stage4[0]) ? array_stage4[2] : array_stage4[0];
    assign array_stage5[1] = (array_stage4[3] > array_stage4[1]) ? array_stage4[1] : array_stage4[3];
    assign array_stage5[3] = (array_stage4[3] > array_stage4[1]) ? array_stage4[3] : array_stage4[1];
    assign array_stage5[4] = (array_stage4[6] > array_stage4[4]) ? array_stage4[4] : array_stage4[6];
    assign array_stage5[6] = (array_stage4[6] > array_stage4[4]) ? array_stage4[6] : array_stage4[4];
    assign array_stage5[5] = (array_stage4[7] > array_stage4[5]) ? array_stage4[5] : array_stage4[7];
    assign array_stage5[7] = (array_stage4[7] > array_stage4[5]) ? array_stage4[7] : array_stage4[5];

    // result
    assign array_o[0] = (array_stage5[1] > array_stage5[0]) ? array_stage5[0] : array_stage5[1];
    assign array_o[1] = (array_stage5[1] > array_stage5[0]) ? array_stage5[1] : array_stage5[0];
    assign array_o[2] = (array_stage5[3] > array_stage5[2]) ? array_stage5[2] : array_stage5[3];
    assign array_o[3] = (array_stage5[3] > array_stage5[2]) ? array_stage5[3] : array_stage5[2];
    assign array_o[4] = (array_stage5[5] > array_stage5[4]) ? array_stage5[4] : array_stage5[5];
    assign array_o[5] = (array_stage5[5] > array_stage5[4]) ? array_stage5[5] : array_stage5[4];
    assign array_o[6] = (array_stage5[7] > array_stage5[6]) ? array_stage5[6] : array_stage5[7];
    assign array_o[7] = (array_stage5[7] > array_stage5[6]) ? array_stage5[7] : array_stage5[6];

endmodule
