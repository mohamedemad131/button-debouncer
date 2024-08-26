

// counter as timer

module timer_counter
#(parameter limit=100)
(
input clk,
input reset_n,
output done
);

reg [$clog2(limit)-1:0] Q_current,Q_next;

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		Q_current=1'b0;
	else
		Q_current<=Q_next;
end
assign done=Q_current==limit?1'b1:1'b0;
always @(Q_current,limit)
begin
	if(Q_current==limit)
		Q_next=0;
	else
		Q_next=Q_current+1;
end
endmodule
