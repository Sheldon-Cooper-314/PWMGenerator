`timescale 1ns / 1ps


module pwm_sinne(input clk, input increase, input decrease, output pwm);

reg [6:0] threshold=7'b0010100;
reg [6:0] counter=7'b0000000;

always @(increase)
begin
threshold<=threshold+10;
end

always @(decrease)
begin
threshold<=threshold-10;
end

always @(posedge clk, threshold)
begin

if(counter<7'b1100100)
counter <= counter + 1;
else counter <= 0;
end

assign pwm =(counter<threshold) ?1:0;
endmodule
