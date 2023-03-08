module apb_slave(
    input logic clk,
    input logic n_rst,
    input logic [7:0] rx_data,
    input logic data_ready,
    input logic overrun_error,
    input logic framing_error,
    input logic psel,
    input logic [2:0] paddr,
    input logic penable,
    input logic pwrite,
    input logic [7:0] pwdata,
    output logic data_read,
    output logic [7:0] prdata,
    output logic pslverr,
    output logic [3:0] data_size,
    output logic [13:0] bit_period
);

reg [1:0] reading;
logic [1:0] nreading;

assign data_read = reading[1];

reg [7:0] data_status;
reg [7:0] error_status;
reg [7:0] data_size_reg;
reg [15:0] bit_period_reg;
reg [7:0] data_buf;
logic [7:0] ndata_status;
logic [7:0] nerror_status;
logic [7:0] ndata_size;
logic [15:0] nbit_period;
logic [7:0] ndata_buf;

assign data_size = data_size_reg[3:0];
assign bit_period = bit_period_reg[13:0];

always_ff @ (posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        data_status <= 8'b0;
        error_status <= 8'b0;
        data_size_reg <= 8'b0;
        bit_period_reg <= 16'b0;
        data_buf <= 8'b0;
        reading <= 2'b00;
    end else begin
        data_status <= ndata_status;
        error_status <= nerror_status;
        data_size_reg <= ndata_size;
        bit_period_reg <= nbit_period;
        data_buf <= ndata_buf;
        reading <= nreading;
    end
end

always_comb begin

    ndata_status = data_ready;
    nerror_status = overrun_error ? 2 : framing_error ? 1 : 0;
    ndata_size = data_size_reg;
    nbit_period = bit_period_reg;
    ndata_buf = rx_data;

    prdata = 8'b0;
    pslverr = 1'b0;
    nreading = reading;

    if(penable & psel) begin
        nreading = reading[1] ? 2'b0 : { reading[0], data_ready };
        case(paddr)
            3'b000: begin
                if(pwrite) pslverr = 1'b1;
                else prdata = {4'b0, data_status};
            end
            3'b001: begin
                if(pwrite) pslverr = 1'b1;
                else prdata = {4'b0, error_status};
            end
            3'b010: begin
                if(pwrite) nbit_period = {bit_period_reg[15:8], pwdata};
                else prdata = bit_period_reg[7:0];
            end
            3'b011: begin
                if(pwrite) nbit_period = {pwdata, bit_period_reg[7:0]};
                else prdata = bit_period_reg[15:8];
            end
            3'b100: begin
                if(pwrite) ndata_size = {4'b0, pwdata[3:0]};
                else prdata = {4'b0, data_size_reg};
            end
            3'b110: begin
                if(pwrite) pslverr = 1'b1;
                else prdata = data_buf;
            end
            default: pslverr = 1'b1;
        endcase
    end
end

endmodule