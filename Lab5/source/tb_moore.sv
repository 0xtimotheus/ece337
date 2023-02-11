`timescale 1ns / 10ps

module tb_moore();

    localparam CLK_PERIOD = 2.5;

    logic tb_clk;
    logic tb_n_rst;
    logic tb_i;
    logic tb_o;

    logic [15:0] test_bits;

    integer tests_total = 0;
    integer tests_failed = 0;


     // Clock generation block
    always begin
        tb_clk = 1'b0;
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        #(CLK_PERIOD/2.0);
    end

    moore m (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

    // Logger
    task log;
        input logic res;
        input string message;
    begin
        tests_total = tests_total + 1;
        if(res) begin
            $info("🎉 correct output during test case: %s", message);
        end else begin
            tests_failed = tests_failed + 1;
            $error("❌ incorrect output during test case: %s\n|> nrst: %d\n|> i: %d\n|> o: %d", message, tb_n_rst, tb_i, tb_o);
        end
    end
    endtask

    task test_stream;
        input [15:0] stream;
    begin
        tb_n_rst = 1'b0;
        #CLK_PERIOD;
        tb_n_rst = 1'b1;
        $info("⛵ Testing stream: %b", stream);
        #(CLK_PERIOD*3.0/4.0);
        for(integer i = 15; i >= 0; i--) begin 
            tb_i = stream[i];
            #(CLK_PERIOD*1.0/2.0);
            if(i <= 11) log((stream[i+4] && stream[i+3] && ~stream[i+2] && stream[i+1]) == tb_o, $sformatf("--stream index: %d ;;; last four bits: %b%b%b%b", i, stream[i+4], stream[i+3], stream[i+2], stream[i+1]));
            else        log((i <= 11 && stream[i+4] && stream[i+3] && ~stream[i+2] && stream[i+1]) == tb_o, $sformatf("--stream index: %d", i));
            #(CLK_PERIOD*1.0/2.0);
        end
        #(CLK_PERIOD*1.0/4.0);
    end
    endtask

    // Tests
    initial begin
        tb_n_rst = 1'b1;
        tb_i = 1'b1;

        // Wait a clock period before starting
        #(CLK_PERIOD);

        tb_n_rst = 1'b0;

        // Test: Power on Reset
        #(CLK_PERIOD/2.0);
        log(tb_o == 1'b0, "Power on Reset");
        #(CLK_PERIOD/2.0);
        tb_n_rst = 1'b1;
        
        /*
        // Test: Correctly Id Empty Stream
        test_stream(16'b0);

        // Test: Correctly Id Discrete Correct stream
        test_stream(16'b0000001101000000);

        // Test: Correctly Id Discrete Repeated streams
        test_stream(16'b1101001101001101);

        // Test: Correctly Id Overlapping Streams
        test_stream(16'b1101101000011010);

        // Test: Correctly Break Streams
        test_stream(16'b101111001110110);
        */

        test_bits = 'b0;
        for(integer i = 0; i < 4096; i++) begin
            test_bits = test_bits + 1;
            test_stream(test_bits);
        end

        // Output Results
        $info("%s %d/%d tests passed", 0 == tests_failed ? ":)" : ":(", tests_total - tests_failed, tests_total);
        if(tests_total != tests_failed) $info("🛑 %d tests failed", tests_failed);
    end

endmodule