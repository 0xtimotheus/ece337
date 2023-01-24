
module sensor_d (input logic [3:0] sensors, output logic error);

assign error = sensors[0] | (sensors[1] & sensors[2]) | (sensors[1] & sensors[3]);

endmodule