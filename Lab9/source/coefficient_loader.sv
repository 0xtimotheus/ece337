module coefficient_loader (
    input logic clk,
    input logic n_rst,
    input logic new_coefficient_set,
    input logic modwait,
    output logic load_coeff,
    output logic [1:0] coefficient_num
);

typedef enum logic { IDLE=1'b0, LOAD=1'b1 } state;

state s;
state ns;
logic [1:0] ncoeff_num;

always_ff @ (posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        coefficient_num <= 0;
        s <= IDLE;
    end else begin
        coefficient_num <= ncoeff_num;
        s <= ns;
    end
end

always_comb begin
    ns = s;
    ncoeff_num = coefficient_num;
    load_coeff = 0;

    case(s)
        // Wait for new coefficient set
        IDLE: begin
            ns = new_coefficient_set ? LOAD : IDLE;
            ncoeff_num = 2'b0;
        end
        // Loading set
        LOAD: begin
            // If busy do nothing
            if(~modwait) begin
                // If loaded all coefficients => go back to IDLE
                if(coefficient_num == 2'b11) begin
                    ns = IDLE;
                    ncoeff_num = 2'b0;
                end else begin
                    // Otherwise set load signal high and increment the coeff number
                    load_coeff = 1;
                    ncoeff_num = coefficient_num + 1;
                end
            end
        end
    endcase
end

endmodule