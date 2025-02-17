module	busyctr #(
		parameter	[15:0]	MAX_AMOUNT = 22
	) (
		// {{{
		input	wire	i_clk, i_reset,
		//
		input	wire	i_start_signal,
		output	reg	o_busy
		// }}}
	);

	reg	[15:0]	counter;

	initial	counter = 0;
	always @(posedge i_clk)
	if (i_reset)
		counter <= 0;
	else if ((i_start_signal)&&(counter == 0))
		counter <= MAX_AMOUNT-1'b1;
	else if (counter != 0)
		counter <= counter - 1'b1;

	always @(*)
		o_busy <= (counter != 0);

`ifdef	FORMAL
	// Your formal properties would go here
	// i_start_signal to remain high unless busy is low at some point
		reg past_reg;
		initial past_reg = 1'b0;
		always@(posedge i_clk)
		begin
			past_reg <= 1'b1;
			//assume(i_start_signal);
		end
		always@(posedge i_clk)
		begin
			if((past_reg) && ($past(counter !=0) && $past(!i_reset)))
				assume(i_start_signal);
		end
	// property to check whether the busy signal is high whenever the counter is non zero
		always @(*) begin
			if(counter !=0)
				assert(o_busy);
		end
	// property to check whether the busy signal is low whenever the counter is  zero
		always @(*) begin
			if(counter ==0)
				assert(!o_busy);
		end
	// property to check if the counter is non-zero, it should always be counting down unless reset
		always@(posedge i_clk)
		begin
			if((past_reg) && ($past(counter !=0) && $past(!i_reset)))
				assert(counter == ($past(counter) - 1'b1));
		end
`endif
endmodule
