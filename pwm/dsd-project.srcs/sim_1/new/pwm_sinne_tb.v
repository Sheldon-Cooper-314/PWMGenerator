`timescale 1ns / 1ps

module pwm_sinne_tb();

reg clk;
reg increase, decrease;
wire PWM;

pwm_sinne t(clk, increase, decrease, PWM);

initial 
begin
clk=1;
forever #5 clk=~clk;
end

initial 
begin
increase=0;
decrease=0;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
increase=increase+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
decrease=decrease+1;
#1000
$finish;
end

endmodule
