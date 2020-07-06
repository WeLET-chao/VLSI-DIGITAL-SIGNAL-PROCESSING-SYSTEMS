# VC709 xdc
# define clock and period
create_clock -period 4.000 -name clk -waveform {0.000 2.000} [get_ports clk]
set_false_path -from [get_ports rst_n]