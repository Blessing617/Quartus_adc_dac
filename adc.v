module adc (
    input   clk_50M,
    input   rst_n,
    input   [9:0]   adc_value,
    output  clk_65M,
    output  [9:0]  adc_get
);

wire   clk_t;
assign clk_65M = clk_t;
assign adc_get = adc_value;

PLL_65M  u_PLL_65M_0 (
	.areset(~rst_n),
	.inclk0(clk_50M),
	.c0(clk_t),
	.locked(locked)
);

endmodule
