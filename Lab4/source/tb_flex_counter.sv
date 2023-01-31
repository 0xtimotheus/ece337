`timescale 1ns / 10ps

module tb_flex_counter();

localparam  NUM_BITS = 4;
localparam  CLK_PERIOD    = 1;

// Input Signals
reg tb_clk;
reg tb_nrst;
reg tb_clear;
reg tb_count_enable;
reg [NUM_BITS:0] tb_rollover_val;
reg [NUM_BITS:0] tb_count_out;
reg tb_rollover_flag;

// Output Signals
reg tb_expected_flag;
reg [NUM_BITS:0] tb_expected_count;

// Generate Clock
always
begin
    tb_clk = 1'b0;
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    #(CLK_PERIOD/2.0);
end

flex_counter DUT (.clk(tb_clk), .n_rst(tb_nrst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

task reset_dut;
begin
    tb_nrst = 1'b0;

    @(posedge tb_clk);
    @(posedge tb_clk);

    @(negedge tb_clk);
    tb_nrst = 1'b1;

    @(negedge tb_clk);
    @(negedge tb_clk);
end
endtask

task log;
    input logic res;
    input string message;
begin
    if(res) begin
        $info("🎉 correct output during test case: %s", message);
    end else begin
        $error("❌ incorrect output during test case: %s\n|> nrst: %d\n|> clear: %d\n|> count_enable: %d\n|> rollover_val: %d\n|< count_out: %d\n|< rollover_flag %d", message, tb_nrst, tb_clear, tb_count_enable, tb_rollover_val, tb_count_out, tb_rollover_flag);
    end
end
endtask

initial begin
    // Initialize
    tb_nrst = 1'b1;
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 6;
    #1;

    // test power on reset
    tb_nrst = 1'b0;
    #(CLK_PERIOD * 0.5);

    log(tb_count_out == 'b0, "Power on reset sets count_out to 0");
    log(tb_rollover_flag == 1'b0, "Power on reset sets rollover flag to 0");

    #(CLK_PERIOD * 0.5);
    tb_nrst  = 1'b1;

    // test count
    #1;
    #(CLK_PERIOD * 0.5);
    log(tb_count_out == 1, "Counter counts to 1 after a clock cycle");
    #(CLK_PERIOD * 3);
    log(tb_count_out == 4, "Counter counts to 4 after four clock cycles");
    
    tb_nrst = 1'b1;
    #(CLK_PERIOD * 0.5);

    // test reset
    tb_nrst = 1'b0;
    #(CLK_PERIOD * 0.25);

    log(tb_count_out == 'b0, "Reset async sets count_out to 0");
    log(tb_rollover_flag == 1'b0, "Reset async sets rollover flag to 0");

    #(CLK_PERIOD * 0.75);
    tb_nrst  = 1'b1;

    // test does it count to a certain number < rollover
    #(CLK_PERIOD * (tb_rollover_val - 1));
    log(tb_count_out == tb_rollover_val - 1, "Counter makes it to before rollover value after appropriate clock cycles");
    #CLK_PERIOD;
    log(tb_count_out == tb_rollover_val, "Counter makes it to rollover value as flag is thrown");
    log(tb_rollover_flag == 1'b1, "Counter makes it to rollover value as flag is thrown");
    #CLK_PERIOD;
    log(tb_count_out == 1, "Counter rolls over to 1");
    log(tb_rollover_flag == 1'b0, "Rollover flag is dropped");
    #CLK_PERIOD
    log(tb_count_out == 2, "Counter continues normally");
    #(CLK_PERIOD * 0.5);

    // test clear (make sure syncronous)
    #(CLK_PERIOD * 0.25);
    tb_clear = 1'b1;
    #(CLK_PERIOD * 0.25);
    log(tb_count_out != 0, "Clear does nothing before clock cycle");
    #CLK_PERIOD;
    log(tb_count_out == 0, "Clear sets count to 0 after clock cycle");
    #CLK_PERIOD
    tb_clear = 1'b0;

    // test count enable
    #CLK_PERIOD
    log(tb_count_out == 1, "Count is 1 before count is disabled");
    tb_count_enable = 1'b0;
    #CLK_PERIOD;
    log(tb_count_out == 1, "Count stays 1 without count enabled");
    #CLK_PERIOD;
    tb_count_enable = 1'b1;
    #CLK_PERIOD;
    log(tb_count_out == 2, "Count resumes when reenabled");

    // clear works when count disabled
    tb_count_enable = 1'b0;
    #CLK_PERIOD
    tb_clear = 1'b1;
    #CLK_PERIOD
    log(tb_count_out == 0, "Clear takes priority over count enable");
    #CLK_PERIOD;
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;
end


endmodule