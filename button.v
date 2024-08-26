
// button with debouncing output

module button(
input clk,
input reset_n,
input button_in,
output button_out

);

wire done;

debounce_fsm fsm(
	.clk(clk),
	.reset_n(reset_n),
	.in(button_in),
	.done(done),
	.out(button_out)

);
/*
to make delay of 20ms
suppose we work with 100 micro s clock
then limit = 20m/100M=200
*/
timer_counter #(.limit(200)) timer(
	.clk(clk),
	.reset_n(reset_n),
	.done(done)
);

endmodule