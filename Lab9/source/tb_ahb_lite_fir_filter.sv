`timescale 1ns / 10ps

module tb_ahb_lite_fir_filter();

typedef enum logic [3:0] { STATUS=4'h0, RESULT=4'h2, SAMPLE=4'h4, F0COEF=4'h6, F1COEF=4'h8, F2COEF=4'hA, F3COEF=4'hC, COCONF=4'hE } store_addr;
typedef enum logic [1:0] { IDLE=2'b00, DELAY=2'b01, NONSEQ=2'b10, SEQ=2'b11 } transfer;

localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay
localparam DATA_WIDTH      = 2;
localparam ADDR_WIDTH      = 4;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Testing Controls
integer tests_failed;

// System Signals
logic tb_clk;
logic tb_n_rst;

// Transaction signals
logic                      tb_enqueue_transaction;
logic                      tb_transaction_write;
logic                      tb_transaction_fake;
logic [ADDR_MAX_BIT:0]     tb_transaction_addr;
logic [DATA_MAX_BIT:0]     tb_transaction_data;
logic                      tb_transaction_error;
logic [2:0]                tb_transaction_size;

logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_current_transaction_error;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

// AHB Signals
logic                  tb_hsel;
logic [1:0]            tb_htrans;
logic [ADDR_MAX_BIT:0] tb_haddr;
logic [2:0]            tb_hsize;
logic                  tb_hwrite;
logic [DATA_MAX_BIT:0] tb_hwdata;
logic [DATA_MAX_BIT:0] tb_hrdata;
logic                  tb_hresp;

// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*************************************
// Instances
//*************************************
ahb_lite_bus BFM (
    .clk(tb_clk),
    // Testing setup signals
    .enqueue_transaction(tb_enqueue_transaction),
    .transaction_write(tb_transaction_write),
    .transaction_fake(tb_transaction_fake),
    .transaction_addr(tb_transaction_addr),
    .transaction_data(tb_transaction_data),
    .transaction_error(tb_transaction_error),
    .transaction_size(tb_transaction_size),
    // Testing controls
    .model_reset(tb_model_reset),
    .enable_transactions(tb_enable_transactions),
    .current_transaction_num(tb_current_transaction_num),
    .current_transaction_error(tb_current_transaction_error),
    // AHB-Lite-Slave Side
    .hsel(tb_hsel),
    .htrans(tb_htrans),
    .haddr(tb_haddr),
    .hsize(tb_hsize),
    .hwrite(tb_hwrite),
    .hwdata(tb_hwdata),
    .hrdata(tb_hrdata),
    .hresp(tb_hresp)
);

ahb_lite_fir_filter DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .hsel(tb_hsel),
    .haddr(tb_haddr),
    .hsize(tb_hsize),
    .htrans(tb_htrans),
    .hwrite(tb_hwrite),
    .hwdata(tb_hwdata),
    .hrdata(tb_hrdata),
    .hresp(tb_hresp)
);

// ************************************
// Tasks
// ************************************

// Reset
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cycle
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Transactions
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
  input logic size;
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
  tb_transaction_size  = {2'b00,size};

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions (all but last one overlap 1 out of 2 cycles
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
  end

  // Run out the last one (currently in data phase)
  @(posedge tb_clk);

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

task check;
    input actual;
    input expected;
    input string message;
begin
    if(actual == expected) $info("Passed-- %s; expected %d got %d", message, expected, actual);
    else $error("FAILED-- %s; expected %d got %d", message, expected, actual);
end
endtask

initial begin
    tb_n_rst = 1'b1;
    tb_hsel = 1'b0;
    tb_haddr = 4'b0;
    tb_hsize = 1'b0;
    tb_htrans = 2'b0;
    tb_hwrite = 1'b0;
    tb_hwdata = 16'b0;

    #(0.25);

    reset_model();
    reset_dut();

    #CLK_PERIOD;

    // Power on Reset
    enqueue_transaction(1'b1, 1'b0, STATUS, 16'b0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, RESULT, 16'b0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'b0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, F0COEF, 16'b0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, F1COEF, 16'b0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, F2COEF, 16'h0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, F3COEF, 16'h0, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, COCONF, 16'h0, 1'b0, 1'b0);

    execute_transactions(1);
    check(16'b0, tb_hrdata, "power on reset- status");
    
    execute_transactions(1);
    check(16'b0, tb_hrdata, "power on reset- result");
    
    execute_transactions(1);
    check(16'b0, tb_hrdata, "power on reset- sample");
    
    execute_transactions(1);
    check(16'b0, tb_hrdata, "power on reset- f0 coefficient");
    
    execute_transactions(1);
    check(16'b0, tb_hrdata, "power on reset- f1 coefficient");
    
    execute_transactions(1);
    check(16'h0, tb_hrdata, "power on reset- f2 coefficient");

    execute_transactions(1);
    check(16'h0, tb_hrdata, "power on reset- f3 coefficient");

    execute_transactions(1);
    check(16'h0, tb_hrdata, "power on reset- coefficient confirmation");

    #(2*CLK_PERIOD);

end

endmodule