`timescale 1ns / 1ps

module pwm_shift_tb();
reg clk; 
wire [7:0] PWM;


pwm_shiftreg t(clk, PWM);

initial 
begin
//#500
clk=0;
forever #1 clk=~clk;
end

endmodule
