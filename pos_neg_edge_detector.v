
// positive negative edge detection

module edge_detector(
input level,
input clk,
input reset_n,
output pos_edge,neg_edge , edge_
);

reg current_state,next_state;
localparam S0=0,S1=1;

// current state logic

always @(posedge clk,negedge reset_n)
begin
	if(reset_n==0)
		current_state<=S0;
	else
		current_state<=next_state;
end

//next state logic

always @(*)
begin
	case (current_state)
		S0:
		begin
			if(level==0)
				next_state=S0;
			else
				next_state=S1;
		end
		S1:
		begin
			if(level==1)
				next_state=S1;
			else
				next_state=S0;
		end
	endcase
end

// output logic

assign pos_edge = (current_state==S0)&& level==1;
assign neg_edge = (current_state==S1)&& level==0;
assign edge_ = pos_edge | neg_edge;
endmodule
