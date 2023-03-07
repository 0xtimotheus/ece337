`timescale 1ns / 10ps

module tb_apb_uart_rx();

localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

localparam DATA_WIDTH      = 1;
localparam ADDR_WIDTH      = 3;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

localparam ADDR_DATA_SR  = 3'd0;
localparam ADDR_ERROR_SR = 3'd1;
localparam ADDR_BIT_CR0  = 3'd2;
localparam ADDR_BIT_CR1  = ADDR_BIT_CR0 + 1;
localparam ADDR_DATA_CR  = 3'd4;
localparam ADDR_RX_DATA  = 3'd6;

localparam TEST_BIT_PERIOD = 14'hA;
localparam TEST_DATA_SIZE  = 8'h5;

localparam RESET_BIT_PERIOD = '0;
localparam RESET_DATA_SIZE  = '0;

integer tests_failed;

// Bus
logic                          tb_enqueue_transaction;
logic                          tb_transaction_write;
logic                          tb_transaction_fake;
logic [(ADDR_WIDTH - 1):0]     tb_transaction_addr;
logic [((DATA_WIDTH*8) - 1):0] tb_transaction_data;
logic                          tb_transaction_error;
// Bus Controls
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
integer  tb_tests_failed;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

// System
logic tb_clk;
logic tb_n_rst;
logic tb_serial_in;

// APB
logic                          tb_psel;
logic [(ADDR_WIDTH - 1):0]     tb_paddr;
logic                          tb_penable;
logic                          tb_pwrite;
logic [((DATA_WIDTH*8) - 1):0] tb_pwdata;
logic [((DATA_WIDTH*8) - 1):0] tb_prdata;
logic                          tb_pslverr;
logic                          tb_data_ready;

// ------------------------------------
// DUTs
// ------------------------------------

apb_bus BFM ( .clk(tb_clk),
    // Testing setup signals
    .enqueue_transaction(tb_enqueue_transaction),
    .transaction_write(tb_transaction_write),
    .transaction_fake(tb_transaction_fake),
    .transaction_addr(tb_transaction_addr),
    .transaction_data(tb_transaction_data),
    .transaction_error(tb_transaction_error),
    // Testing controls
    .model_reset(tb_model_reset),
    .enable_transactions(tb_enable_transactions),
    .current_transaction_num(tb_current_transaction_num),
    // APB-Slave Side
    .psel(tb_psel),
    .paddr(tb_paddr),
    .penable(tb_penable),
    .pwrite(tb_pwrite),
    .pwdata(tb_pwdata),
    .prdata(tb_prdata),
    .pslverr(tb_pslverr)
);

apb_uart_rx APB (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .serial_in(tb_serial_in),
    .penable(tb_penable),
    .psel(tb_psel),
    .paddr(tb_paddr),
    .pwrite(tb_pwrite),
    .pwdata(tb_pwdata),
    .prdata(tb_prdata),
    .pslverr(tb_pslverr)
);

// ------------------------------------
// Tasks
// ------------------------------------

task reset_dut;
begin
    // Activate the design's reset (does not need to be synchronize with clock)
    tb_n_rst = 1'b0;

    // Wait for a couple clock cycles
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Release the reset
    @(negedge tb_clk);
    tb_n_rst = 1;

    // Wait for a while before activating the design
    @(posedge tb_clk);
    @(posedge tb_clk);
end
endtask

task send_packet;
    input  [7:0] data;
    input  stop_bit;

    integer i;
begin
    // First synchronize to away from clock's rising edge
    @(negedge tb_clk)

    // Send start bit
    enqueue_transaction(1'b1, 1'b0, 3'b000, 8'h0, 1'b0);
    execute_transactions(1);
    tb_serial_in = 1'b0;
    #(TEST_BIT_PERIOD * CLK_PERIOD);

    // Send data bits
    for(i = 0; i < TEST_DATA_SIZE; i = i + 1)
    begin
        tb_serial_in = data[i];
        #((TEST_BIT_PERIOD - 2) * CLK_PERIOD);
        enqueue_transaction(1'b1, 1'b0, 3'b000, 8'b0, 1'b0);
        execute_transactions(1);
        check(8'b0, tb_prdata, "sending packet-- data ready");

    end

    // Send stop bit
    tb_serial_in = stop_bit;
    #(TEST_BIT_PERIOD * CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, 3'b000, {7'b0, stop_bit}, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b001, {7'b0, ~stop_bit}, 1'b0);
    if (stop_bit) enqueue_transaction(1'b1, 1'b0, 3'b110, data, 1'b0);
    execute_transactions(1);
    check({7'b0, stop_bit}, tb_prdata, "finished packet-- data ready");
    execute_transactions(1);
    check({7'b0, ~stop_bit}, tb_prdata, "finished packet-- error status");
    if(stop_bit) begin
      execute_transactions(1);
      check(data, tb_prdata, "finished packet-- packet data");
    end
end
endtask

task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  //@(posedge tb_clk);

  // Process the transactions
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
    @(posedge tb_clk);
  end

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

task check;
    input integer expected;
    input integer actual;
    input string message;
begin
    if(expected == actual) begin
        $info("Passed Test: %s", message);
    end else begin
        tests_failed = tests_failed + 1;
        $error("Failed Test: %s; expected: %d; got %d", message, expected, actual);
    end
end
endtask


// ------------------------------------
// Clock Gen
// ------------------------------------
always
begin : CLK_GEN
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
end

// ------------------------------------
// Test process
// ------------------------------------
initial begin

    tests_failed = 0;
    tb_serial_in    = 1'b1;

    tb_model_reset = 1'b0;
    tb_enable_transactions  = 1'b0;
    tb_enqueue_transaction  = 1'b0;
    tb_transaction_write    = 1'b0;
    tb_transaction_fake     = 1'b0;
    tb_transaction_addr     = '0;
    tb_transaction_data     = '0;
    tb_transaction_error    = 1'b0;

    #(0.25);

    reset_model();

    // Power on Reset
    reset_dut();
    // Read values
    enqueue_transaction(1'b1, 1'b0, 3'b000, 8'b0, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b001, 8'b0, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b010, 8'b0, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b011, 8'b0, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b100, 8'b0, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b110, 8'hff, 1'b0);
    
    execute_transactions(1);
    check(8'b0, tb_prdata, "power on reset- data_ready");
    
    execute_transactions(1);
    check(8'b0, tb_prdata, "power on reset- error_status");
    
    execute_transactions(1);
    check(8'b0, tb_prdata, "power on reset- bit period lower half");
    
    execute_transactions(1);
    check(8'b0, tb_prdata, "power on reset- bit period upper half");
    
    execute_transactions(1);
    check(8'b0, tb_prdata, "power on reset- data size");
    
    execute_transactions(1);
    check(8'hff, tb_prdata, "power on reset- data buffer");

    #(2*CLK_PERIOD);

    // Load Bit Period
    enqueue_transaction(1'b1, 1'b1, 3'b010, TEST_BIT_PERIOD[7:0], 1'b0);
    enqueue_transaction(1'b1, 1'b1, 3'b011, { 2'b0, TEST_BIT_PERIOD[13:8] }, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b010, TEST_BIT_PERIOD[7:0], 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b011, { 2'b0, TEST_BIT_PERIOD[13:8] }, 1'b0);

    execute_transactions(2);

    execute_transactions(1);
    check(TEST_BIT_PERIOD[7:0], tb_prdata, "load config- bit period lower half");
    execute_transactions(1);
    check(TEST_BIT_PERIOD[13:8], tb_prdata, "load config- bit period upper half");

    #(2*CLK_PERIOD);

    // Load Data Size
    enqueue_transaction(1'b1, 1'b1, 3'b100, TEST_DATA_SIZE, 1'b0);
    enqueue_transaction(1'b1, 1'b0, 3'b100, TEST_DATA_SIZE, 1'b0);

    execute_transactions(1);

    execute_transactions(1);
    check(TEST_DATA_SIZE, tb_prdata, "load config- data size");

    #(2*CLK_PERIOD);

    // Trigger pslverr
    enqueue_transaction(1'b1, 1'b1, 3'b000, 8'h0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, 3'b001, 8'h0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, 3'b110, 8'h0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, 3'b111, 8'h0, 1'b1);

    execute_transactions(1);
    check(1'b1, tb_pslverr, "pslverr triggered- write to data_status");
    execute_transactions(1);
    check(1'b1, tb_pslverr, "pslverr triggered- write to error_status");
    execute_transactions(1);
    check(1'b1, tb_pslverr, "pslverr triggered- write to data_buf");
    execute_transactions(1);
    check(1'b1, tb_pslverr, "pslverr triggered- write to unused addr");

    #(2*CLK_PERIOD);

    // Writing Data
    send_packet(8'b00000110, 1'b1);
    send_packet(8'b00010011, 1'b1);
    send_packet(8'b00010101, 1'b1);
    send_packet(8'b00001010, 1'b1);
    send_packet(8'b00001010, 1'b0);

    tb_serial_in = 1'b1;
    #CLK_PERIOD;
    #CLK_PERIOD;

    send_packet(8'b00000000, 1'b0);

    tb_serial_in = 1'b1;
    #CLK_PERIOD;
    #CLK_PERIOD;

    send_packet(8'b00001010, 1'b1);

    $info("Failed: %d tests", tests_failed);

end

endmodule