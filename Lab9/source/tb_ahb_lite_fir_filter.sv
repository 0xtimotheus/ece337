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

localparam COEFF1 		= 16'h8000; // 1.0
localparam COEFF_5 		= 16'h4000; // 0.5
localparam COEFF_25 	= 16'h2000; // 0.25
localparam COEFF_125 	= 16'h1000; // 0.125
localparam COEFF0  		= 16'h0000; // 0.0

// Testing Controls
integer tests_failed;
string  current_test;

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
  //@(posedge tb_clk);

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
    if(actual == expected) begin
        $info("Passed-- %s; expected %d got %d", message, expected, actual);
    end else begin
        $error("FAILED-- %s; expected %d got %d", message, expected, actual);
        tests_failed = tests_failed + 1;
    end
end
endtask

initial begin
    tests_failed = 0;
    current_test = "";

    tb_n_rst = 1'b1;
    tb_hsel = 1'b0;
    tb_haddr = 4'b0;
    tb_hsize = 1'b0;
    tb_htrans = 2'b0;
    tb_hwrite = 1'b0;
    tb_hwdata = 16'b0;

    #(0.25);

    // Power on Reset
    current_test = "Power on Reset";

    reset_model();
    reset_dut();

    #CLK_PERIOD;

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

    #CLK_PERIOD;
    current_test = "Load Coefficients for Stream 1";
    #CLK_PERIOD;

    // Load Coefficients
    enqueue_transaction(1'b1, 1'b1, F0COEF, COEFF_5, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F1COEF, COEFF1, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F2COEF, COEFF1, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F3COEF, COEFF_5, 1'b0, 1'b1);

    execute_transactions(4);

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F0COEF, COEFF_5, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF_5, tb_hrdata, "loading coefficients 1.0- loaded correct f0 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F1COEF, COEFF1, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF1, tb_hrdata, "loading coefficients 1.1- loaded correct f1 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F2COEF, COEFF1, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF1, tb_hrdata, "loading coefficients 1.2- loaded correct f2 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F3COEF, COEFF_5, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF_5, tb_hrdata, "loading coefficients 1.3- loaded correct f3 coefficients");

    #CLK_PERIOD;
    current_test = "Confirm Coefficients for Stream 1";
    #CLK_PERIOD;

    // Confirm Coefficients
    enqueue_transaction(1'b1, 1'b1, COCONF, 16'b1, 1'b0, 1'b0);
    execute_transactions(1);

    #(12*CLK_PERIOD);

    #CLK_PERIOD;
    current_test = "Error when writing to readonly";
    #CLK_PERIOD;
    
    // Cannot Write to a readonly register
    enqueue_transaction(1'b1, 1'b1, RESULT, 16'd50, 1'b1, 1'b1);
    execute_transactions(1);
    check(1'b1, tb_hresp, "checking result- correctly throws err when trying to write");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 1.1";
    #CLK_PERIOD;

    // Sample Processing Stream 1.1
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 1.1- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd50, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd50, tb_hrdata, "sample processing stream 1.1- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 1.2";
    #CLK_PERIOD;

    // Sample Processing Stream 1.2
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 1.2- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd50, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd50, tb_hrdata, "sample processing stream 1.2- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 1.3";
    #CLK_PERIOD;

    // Sample Processing Stream 1.3
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 1.3- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd50, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd50, tb_hrdata, "sample processing stream 1.3- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 1.4";
    #CLK_PERIOD;

    // Sample Processing Stream 1.4
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 1.4- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd0, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd0, tb_hrdata, "sample processing stream 1.4- correctly calculated result");

    reset_dut();

    #CLK_PERIOD;
    current_test = "Load Coefficients for Stream 2";
    #CLK_PERIOD;

    // Load Coefficients for Stream 2
    enqueue_transaction(1'b1, 1'b1, F0COEF, COEFF_5, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F1COEF, COEFF1, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F2COEF, COEFF1, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b1, F3COEF, COEFF_5, 1'b0, 1'b1);

    execute_transactions(4);

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F0COEF, COEFF_5, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF_5, tb_hrdata, "loading coefficients 2.0- loaded correct f0 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F1COEF, COEFF1, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF1, tb_hrdata, "loading coefficients 2.1- loaded correct f1 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F2COEF, COEFF1, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF1, tb_hrdata, "loading coefficients 2.2- loaded correct f2 coefficients");

    #(2*CLK_PERIOD);
    enqueue_transaction(1'b1, 1'b0, F3COEF, COEFF_5, 1'b0, 1'b1);
    execute_transactions(1);
    check(COEFF_5, tb_hrdata, "loading coefficients 2.3- loaded correct f3 coefficients");

    #CLK_PERIOD;
    current_test = "Confirm Coefficients for Stream 2";
    #CLK_PERIOD;

    // Confirm Coefficients
    enqueue_transaction(1'b1, 1'b1, COCONF, 16'b1, 1'b0, 1'b0);
    execute_transactions(1);

    #(12*CLK_PERIOD);

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 2.1";
    #CLK_PERIOD;

    // Sample Processing Stream 2.1
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 2.1- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd50, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd50, tb_hrdata, "sample processing stream 2.1- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 2.2";
    #CLK_PERIOD;

    // Sample Processing Stream 2.2
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd100, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd100, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd100, tb_hrdata, "sample processing stream 2.2- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd50, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd50, tb_hrdata, "sample processing stream 2.2- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 2.3";
    #CLK_PERIOD;

    // Sample Processing Stream 2.3
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd1000, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd1000, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd1000, tb_hrdata, "sample processing stream 2.3- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd500, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd500, tb_hrdata, "sample processing stream 2.3- correctly calculated result");

    #CLK_PERIOD;
    current_test = "Sample Processing Stream 2.4";
    #CLK_PERIOD;

    // Sample Processing Stream 2.4
    enqueue_transaction(1'b1, 1'b1, SAMPLE, 16'd1000, 1'b0, 1'b1);
    enqueue_transaction(1'b1, 1'b0, SAMPLE, 16'd1000, 1'b0, 1'b1);

    execute_transactions(2);
    check(16'd1000, tb_hrdata, "sample processing stream 2.4- loaded correct value");

    #(12*CLK_PERIOD);

    enqueue_transaction(1'b1, 1'b0, RESULT, 16'd450, 1'b0, 1'b1);
    execute_transactions(1);
    check(16'd450, tb_hrdata, "sample processing stream 2.4- correctly calculated result");

    #(2*CLK_PERIOD);

    if(tests_failed == 0) $info("All Tests Passed :)");
    else $info("Failed %d tests :(", tests_failed);

end

endmodule