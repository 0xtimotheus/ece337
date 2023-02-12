module rcv_block(
    input logic clk, 
    input logic n_rst,
    input logic serial_in, 
    input logic data_read, 
    output logic [7:0] rx_data, 
    output logic data_ready, 
    output logic overrun_error,
    output logic framing_error
);

    // System signals
    logic strobe;
    logic enable_timer;

    logic load_buffer;
    logic [7:0] packet_data;

    logic sync_in;
    logic [1:0] syncing;

    // Flags
    logic new_packet_detected;
    logic packet_done;
    logic sbc_enable;
    logic sbc_clear;
    logic stop_bit;

    // Syncronizer
    assign sync_in = syncing;
    always_ff @ (posedge clk, negedge n_rst) begin
        if(~n_rst) syncing <= 2'b00;
        else syncing <= {syncing[1], serial_in};
    end

    // Buffer
    rx_data_buff buff(
        .clk(clk),
        .n_rst(n_rst),
        .load_buffer(load_buffer),
        .packet_data(packet_data),
        .data_read(data_read),
        .rx_data(rx_data),
        .data_ready(data_ready),
        .overrun_error(overrun_error)
    );

    // Reciever Control
    rcu rc(
        .clk(clk),
        .n_rst(n_rst),
        .new_packet_detected(new_packet_detected),
        .packet_done(packet_done),
        .framing_error(framing_error),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .load_buffer(load_buffer),
        .enable_timer(enable_timer)
    );

    // Shift Register
    sr_9bit sr(
        .clk(clk),
        .n_rst(n_rst),
        .shift_strobe(strobe),
        .serial_in(sync_in),
        .packet_data(packet_data),
        .stop_bit(stop_bit)
    );

    // Timer
    timer t(
        .clk(clk),
        .n_rst(n_rst),
        .enable_timer(enable_timer),
        .shift_strobe(strobe),
        .packet_done(packet_done)
    );

    start_bit_det det(
        .clk(clk),
        .n_rst(n_rst),
        .serial_in(sync_in),
        .new_packet_detected(new_packet_detected)
    );

    stop_bit_chk chker(
        .clk(clk),
        .n_rst(n_rst),
        .sbc_clear(sbc_clear),
        .sbc_enable(sbc_enable),
        .stop_bit(stop_bit),
        .framing_error(framing_error)
    );
endmodule