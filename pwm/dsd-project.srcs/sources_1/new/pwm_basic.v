`timescale 1ns / 1ps

module pwm_basic(
  input clk,
  input reset,
  input [7:0] duty_cycle,
  output PWM
);

reg [1:0] curr_state, next_state;
reg pwm;
reg [7:0] count;

parameter S0 = 2'b00, S1 = 2'b01;

always @(posedge clk , negedge reset) begin
  if (!reset) begin
    curr_state <= S0;
    count <= 8'b00000000;
    pwm <= 1'b0;
  end else begin
    curr_state <= next_state;
    case(curr_state)
        S0: pwm<=1'b0;
        S1:
          begin
            if(count<duty_cycle)
              pwm<=1;
            else
              pwm<=0;
          end
    endcase

    if (count == 8'b01100101)
      count <= 8'b00000000;
    else
      count <= count + 1'b1;
  end
end

always @(*) begin
  case (curr_state)
    S0: begin
      next_state = S1;
    end
    S1: begin
      if(count == 8'b01100101)
        next_state =S0;
      else
        next_state=S1;
    end
  endcase
end

assign PWM=pwm;
endmodule
