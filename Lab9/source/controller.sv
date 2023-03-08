module controller(
    input logic clk,
    input logic n_rst,
    input logic dr,
    input logic lc,
    input logic overflow,
    output logic cnt_up,
    output logic clear,
    output logic modwait,
    output logic[2:0] op,
    output logic [3:0] src1,
    output logic [3:0] src2,
    output logic [3:0] dest,
    output logic err
);

typedef enum reg [3:0] { IDLE=0, EIDLE=1, LOADC=2, LOADD=3, M=4, A=5, DONE=6 } state;

state s;
state n;

logic [1:0] i;  // sample offset, indicates most recent sample
logic [1:0] ni; 
logic [1:0] d;  // counter while iterating through samples
logic [1:0] nd;
logic [1:0] j; // coeff offset
logic [1:0] nj; 

// Data processing

always_ff @( posedge clk, negedge n_rst ) begin
    if(~n_rst) begin
        s <= IDLE;
        i <= 2'b0;
        d <= 2'b0;
        j <= 2'b0;
    end else begin 
        s <= n;
        i <= ni;
        d <= nd;
        j <= nj;
    end
end

always_comb begin
    // defaults
    cnt_up  = 1'b0;
    clear   = 1'b0;
    modwait = s != IDLE && s != EIDLE;
    op      = 2'b0;
    src1    = 4'b0;
    src2    = 4'b0;
    dest    = 4'b0;
    err     = 0;

    n       = s;
    ni      = i;
    nd      = d;
    nj      = j;

    case(s)
        IDLE: begin
            n      = dr ? LOADD : 
                        lc ? LOADC : 
                        IDLE;
        end
        EIDLE: begin
            n     = dr ? LOADD : 
                        lc ? LOADC : 
                        EIDLE;;
            err   = 1;
        end
        LOADC: begin
            n      = IDLE;
            nj     = j + 1;

            op     = 3'b011;
            dest   = j + 5;
            clear  = 1'b1;
        end
        LOADD: begin
            if(dr) begin
                n      = M;
                nd     = 0;
                ni     = i == 0 ? 2'b11 : i - 1;
                
                cnt_up = 1'b1;
                op     = 3'b010;
                dest   = (i % 4) + 1;
            end else begin
                n      = EIDLE; 
            end
        end
        M: begin
                n = overflow ? EIDLE : A;
                
                op     = 3'b110;
                src1   = ((i + 1 + d) % 4) + 1;
                src2   = d + 5;
                dest   = 4'hA;
        end
        A: begin
                n      = overflow ? EIDLE : &d ? DONE : M;
                nd     = d + 1;
                
                op     = (d % 2) == 1 ? 3'b101 :  3'b100;
                src1   = d == 0 ? 4'hF : 4'h9;
                src2   = 4'hA;
                dest   = 4'h9;
        end
        DONE: begin
                n      = overflow ? EIDLE : IDLE;
                nd     = 0;

                op     = 3'b001;
                src1   = 4'h9;
                dest   = 4'h0;
        end
    endcase
end

endmodule