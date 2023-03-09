module ahb_lite_fir_filter (
    input logic clk,
    input logic n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

// Filter
wire modwait; // Output
wire err;
wire [15:0] fir_out;
wire new_coefficient_set; // Coefficients
wire load_coeff;
wire [1:0] coefficient_num;
wire [15:0] fir_coefficient;
wire data_ready; // Sample
wire [15:0] sample_data;


ahb_lite_slave ahb (
    .clk(clk),
    .n_rst(n_rst),
    // Transactions
    .hsel(hsel),
    .haddr(haddr),
    .hsize(hsize),
    .htrans(htrans),
    .hwrite(hwrite),
    .hwdata(hwdata),
    .hrdata(hrdata),
    .hresp(hresp),
    // Filter
    .modwait(modwait), // Output
    .err(err),
    .fir_out(fir_out),
    .new_coefficient_set(new_coefficient_set), // Coefficients
    .coefficient_num(coefficient_num),
    .fir_coefficient(fir_coefficient),
    .data_ready(data_ready), // Sample
    .sample_data(sample_data)
);

coefficient_loader cldr (
    .clk(clk),
    .n_rst(n_rst),
    .modwait(modwait),
    .new_coefficient_set(new_coefficient_set),
    .load_coeff(load_coeff),
    .coefficient_num(coefficient_num)
);

fir_filter fir (
    .clk(clk),
    .n_reset(n_rst),
    .modwait(modwait), // Output
    .err(err),
    .fir_out(fir_out),
    //.new_coefficient_set(new_coefficient_set), // Coefficients
    .load_coeff(load_coeff),
    .fir_coefficient(fir_coefficient),
    .data_ready(data_ready), // Sample
    .sample_data(sample_data)
);

endmodule;