`timescale 1ns / 1ps

module bitonic_sorter_tb;

    logic signed [31:0] input_array [8];
    logic signed [31:0] output_array[8];

    bitonic_sorter bitonic_sorter (
        .array_i(input_array),
        .array_o(output_array)
    );

    initial begin
        foreach (input_array[i]) input_array[i] = i+1;
        #5;
        input_array[0] = 325;
        input_array[1] = 0;
        input_array[2] = -345345;
        input_array[3] = 1;
        input_array[4] = 325;
        input_array[5] = 0;
        input_array[6] = 325;
        input_array[7] = 8;
        #5;
        $stop;

    end

endmodule
