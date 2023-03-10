module ahb_lite_slave (
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
    input [3:0] haddr,
    input logic hsize, // 0 -> 1byte; 1 -> 1byte
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

typedef enum logic [3:0] { 
    STATUS=4'h0, 
    RESULT=4'h2, 
    SAMPLE=4'h4, 
    F0COEF=4'h6, 
    F1COEF=4'h8, 
    F2COEF=4'hA, 
    F3COEF=4'hC, 
    COCONF=4'hE 
} store_addr;
typedef enum logic [1:0] { IDLE=2'b00, DELAY=2'b01, NONSEQ=2'b10, SEQ=2'b11 } transfer;

reg [15:0] store [15:0];
reg [15:0] nstore [15:0];

// Transfer Logic
store_addr addr;
store_addr naddr;
reg size;
reg nsize;
transfer trans;
transfer ntrans; 
reg write;
reg nwrite;

// Filter Logic
logic wsample;
logic wcoeffs;

always_ff @( posedge clk, negedge n_rst ) begin
    if(~n_rst) begin
        store <= '{default:8'b0};

        addr <= STATUS;
        size <= 3'b0;
        trans <= IDLE;
        write <= 1'b0;
        data_ready <= 1'b0;
        new_coefficient_set <= 1'b0;
    end else begin
        store <= nstore;

        addr <= naddr;
        size <= nsize;
        trans <= ntrans;
        write <= nwrite;

        data_ready <= wsample;
        new_coefficient_set <= wcoeffs;
    end
end

always_comb begin
    // Store
    nstore = store;
    hrdata = 16'b0;

    // Transfer
    naddr = store_addr'(haddr);
    nsize = hsize;
    ntrans = transfer'(htrans);
    nwrite = hwrite;

    //Passive
    nstore[STATUS] = {modwait | data_ready | new_coefficient_set, 7'b0, err, 7'b0}; // Status
    nstore[RESULT] = fir_out; // Result
    sample_data = store[SAMPLE];
    fir_coefficient = store[F0COEF + (coefficient_num << 1)]; // Active Fir Coefficient
    nstore[COCONF] = coefficient_num == 2'b11 ? 1'b0 : nstore[COCONF];

    //Signals
    hresp = 1'b0;
    wsample = data_ready ? ~modwait : data_ready;
    wcoeffs = 1'b0;

    // Transactions
    if(hsel) begin
        case(trans)
            NONSEQ: begin
                if(
                    (write & (addr < SAMPLE)) // writing to readonly
                    | haddr == 4'h1 | haddr == 4'h3 | haddr == 4'h5 | haddr == 4'h7 // unwritable registers
                    | haddr == 4'h9 | haddr == 4'hB | haddr == 4'hD | haddr == 4'hF
                ) begin
                    hresp = 1'b1;
                end else begin
                    if(write) begin
                        if(size) nstore[addr] = hwdata;
                        else nstore[addr][7:0] = hwdata[7:0];

                        if(addr == SAMPLE) wsample = 1'b1;
                        if(addr == COCONF) wcoeffs = 1'b1;
                    end
                    if(size) hrdata = store[addr];
                    else hrdata[7:0] = store[addr][7:0];
                end
            end
        endcase
        
    end
end


endmodule