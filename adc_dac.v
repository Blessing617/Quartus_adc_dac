module adc_dac (
    input           clk_50M,
    input           rst_n,
    input   [9:0]   adc_value,
    output          AD_clk,
    output          DA_clk,
    output  [13:0]  dac_data
);

wire clk_65M_t;
wire clk_100M_t;
wire [9:0] dac_data_t;

assign  AD_clk = clk_50M;
assign  DA_clk = clk_100M_t;
assign  dac_data = {dac_data_t,4'b0} + 14'b10_0000_0000_0000;

PLL_100M u_PLL_100M_0 (
	.areset(~rst_n),
	.inclk0(clk_50M),
	.c0(clk_100M_t),
	.locked(locked)
);

adc u_adc_0 (
    .clk_50M(clk_50M),
    .rst_n(rst_n),
    .adc_value(adc_value),
    .clk_65M(clk_65M_t),
    .adc_get(dac_data_t)
);

endmodule
