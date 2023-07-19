`timescale 1ns / 1ps

module pwm_basic_tb();

reg clk;
reg reset;
reg [7:0] duty_cycle;
wire PWM;

pwm_basic t(clk, reset, duty_cycle,PWM);

initial 
begin
clk=1;
duty_cycle=8'b00010100;
forever #5 clk=~clk;
end

initial 
begin
reset=0;
#10;
reset=1;
#8000;
end
endmodule
