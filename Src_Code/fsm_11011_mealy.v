`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2020 01:16:33
// Design Name: 
// Module Name: fsm_11011_moore
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


module fsm_11011_moore(
    input clk_pulse,
    input clear,
    input inp_1,
    output reg out,
    output reg [2:0] present_state
    );
    reg [2:0] next_state;        // reg declaration
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5 =3'b101;
    
    always @(posedge clk_pulse or posedge clear) // 1 always for assigning the present state
        begin
            if (clear == 1'b1)
                present_state <= S0;
            else
                present_state <= next_state;
        end
    always@(*)              // 1 always block for next state combinational logic
        begin
            next_state = present_state;
                case(present_state)
                S0: if(inp_1 == 1'b1)
                       next_state = S1;
                    else
                        next_state = S0;
                S1: if(inp_1 == 1'b1)
                        next_state = S2;
                    else
                        next_state = S0;
                S2: if(inp_1 == 1'b1)
                         next_state = S2;
                     else
                         next_state = S3;
                S3: if(inp_1 == 1'b1)
                         next_state = S4;
                    else
                         next_state = S0;         
                S4: if(inp_1 == 1'b1)
                         next_state = S5;
                     else
                         next_state = S0;
                S5: if(inp_1 == 1'b1)
                         next_state = S1;
                     else
                         next_state = S0;
                endcase
        end
        always @(*) //1 always output assignment block
        begin
            if (present_state == S5)
                out<=1'b1;
            else
                out<=1'b0;    
        end
endmodule
