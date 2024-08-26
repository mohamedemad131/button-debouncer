
module debounce_fsm(

input clk,
input reset_n,
input in,
input done,
output out
);

reg [1:0] current_state,next_state;
localparam s0=0,s1=1,s2=2,s3=3;

always @(posedge clk,negedge reset_n)
begin

	if(reset_n==0)
		current_state<=s0;
	else
		current_state<=next_state;

end

always @(*)
begin
	case (current_state)
		s0:
		begin
			if(in==0)
				next_state=s0;
			else
				next_state=s1;
		end	
		s1:
		begin
			if(in==0)
				next_state=s0;
			else if(in==1 && done==0)
				next_state=s1;
			else
				next_state=s2;
		end
		s2:
		begin
			if(in==1)
				next_state=s2;
			else
				next_state=s3;
		end
		s3:
		begin
			if(in==1)
				next_state=s2;
			else if(in==0 && done==0)
				next_state=s3;
			else
				next_state=s0;
		end
	endcase
end

assign out = current_state==s2;

endmodule
