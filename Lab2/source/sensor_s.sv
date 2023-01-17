
module sensor_s (input logic [3:0] sensors, output logic error);

logic w1;
logic w2;
logic w3;
AND2X1 A1 (.A(sensors[1]), .B(sensors[2]), .Y(w1));
AND2X1 A2 (.A(sensors[1]), .B(sensors[3]), .Y(w2));
OR2X1  O1 (.A(w1), .B(w2), .Y(w3));
OR2X1  O2 (.A(sensors[0]), .B(w3), .Y(error));

endmodule