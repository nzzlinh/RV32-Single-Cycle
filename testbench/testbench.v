module testbench();
reg clk = 0;
always
#1 clk =~ clk;
top_module _test(clk);
endmodule 