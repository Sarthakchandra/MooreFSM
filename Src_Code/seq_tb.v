`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 01:40:08
// Design Name: 
// Module Name: seq_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_tb(

    );
    reg clk_pulse, clear, inp_1;
    wire out;
    wire [2:0] present_state;
    
    fsm_11011_moore tb1 (.clk_pulse(clk_pulse),.clear(clear),.inp_1(inp_1),.out(out),.present_state(present_state));
    initial
        begin
            clk_pulse = 1'b0;
            clear= 1'b1;
            inp_1 = 1'b0;
        end
        
        initial
            begin
            #10 clear = 1'b0;
            @(negedge clk_pulse) inp_1 = 1'b1;
            @(negedge clk_pulse) inp_1 = 1'b1;
            @(negedge clk_pulse) inp_1 = 1'b0;
            @(negedge clk_pulse) inp_1 = 1'b1;
            @(negedge clk_pulse) inp_1 = 1'b1;  //pattern completes here #1
            @(negedge clk_pulse) inp_1 = 1'b0;
            @(negedge clk_pulse) inp_1 = 1'b1;
            @(negedge clk_pulse) inp_1 = 1'b1;  
            @(negedge clk_pulse) inp_1 = 1'b0;
            @(negedge clk_pulse) inp_1 = 1'b1;
            @(negedge clk_pulse) inp_1 = 1'b1;  //pattern completes here #2
        end
        always #5 clk_pulse = ~clk_pulse;
endmodule


