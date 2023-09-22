`timescale 1ns / 1ps

module pattern_detector(
input clk, rst,
input in,
output out );
//State Definition
parameter State_A = 2'b00;
parameter State_B = 2'b01;
parameter State_C = 2'b10;

reg [1:0] present_state, next_state;

//Initial State Logic
always @(posedge clk or posedge rst) begin
if(rst)begin present_state <= State_A; end
else begin present_state <= next_state; end
end

//Transition Logic
always @(present_state or in) begin
case (present_state) 
    State_A:begin
        if(in == 1) begin next_state <= State_B; end
        else begin next_state <= State_A; end 
        end
    State_B:begin
        if(in == 1) begin next_state <= State_B; end
        else begin next_state <= State_C; end
        end 
    State_C:begin
        if(in == 1) begin 
        next_state <= State_B;
        //next_state <= State_A;  //Non-overlapping case
        end
        else begin next_state <= State_A; end
        end 
    default:next_state <= State_A;
    endcase 
end
//Output Logic
assign out = ((present_state == State_C)&&(in == 1))? 1:0;

endmodule
