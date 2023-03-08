module(
    input logic clk,
    input logic n_rst,
    output logic [15:0] sample_data,
    output logic data_ready,
    output logic new_coefficient_set,
    input logic [1:0] coefficient_num,
    output logic [15:0] fir_coefficient,
    input logic modwait,
    input logic [15:0] fir_out,
    input logic err,
    input logic hsel,
    input store_addr haddr,
    input logic [2:0] hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp,
);

typedef enum logic [3:0] { STATUS=4'h0, RESULT=4'h2, NEWSAMPLE=4'h4, F0COEF=4'h6, F1COEF=4'h8, F2COEF=4'hA, F3COEF=4'hC, CONF=4'hE } store_addr;
typedef enum logic [1:0] { IDLE=2'b00, DELAY=2'b01, NONSEQ=2'b10, SEQ=2'b11 } trans;

reg [7:0] store [15:0];
reg [7:0] nstore [15:0];

store_addr addr;
store_addr naddr;

reg [2:0] size;
reg [2:0] nsize;

always_ff @( posedge clk, negedge n_rst ) begin
    if(~n_rst) begin
        store <= '{default:8'b0};
        addr <= 4'b0;
        size <= 3'b0;
    end else begin
        store <= nstore;
        addr <= naddr;
        size <= nsize;
    end
end

always_comb begin
    nstore = store;
    naddr = haddr;
    nsize = hsize;

    hresp = 1'b0;

    if(hsel) begin
        if(hwrite & addr < NEWSAMPLE) hresp = 1'b1;
        case(addr)
            default: begin
                hresp = 1'b1;
            end
        endcase
    end
end


endmodule