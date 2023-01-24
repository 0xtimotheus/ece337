
module sensor_b (input logic [3:0] sensors, output logic error);

always_comb begin
    if(sensors[0] | (sensors[1] & sensors[2]) | (sensors[1] & sensors[3])) error <= 1;
    else error <= 0;
end
endmodule