`timescale 1ns / 1ps

module tb_pattern_detector;
reg CLK, RST, IN;
wire OUT;
pattern_detector dut(.clk(CLK), .rst(RST), .in(IN), .out(OUT));

//Initial Definition
initial begin 
CLK <= 1'b0;
IN <= 0;
end

//Clock Logic
always begin
#5 CLK <= ~CLK;
end

//Input 
initial begin
RST <= 1'b1;
#5 RST <=1'b0;
#10 IN <=1'b1;
#10 IN <=1'b0;
#10 IN <=1'b1;
#10 IN <=1'b1;
#10 IN <=1'b0;
#10 IN <=1'b1;
#10 IN <=1'b0;
#10 IN <=1'b1;
#10 IN <=1'b0;
#10 IN <=1'b0;
#10 IN <=1'b0;
#10 IN <=1'b1;
#10 IN <=1'b0;
#10 IN <=1'b1;
#10; $finish;
end

endmodule
