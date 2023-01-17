
module sensor_s (input logic [3:0] sensors, output logic error);

wire w1;
wire w2;
wire w3;
AND2X1 A1 (sensors[1], sensors[2], w1);
AND2X1 A2 (sensors[1], sensors[3], w1);
OR2X1  O1 (w1, w2, w3);
OR2x1  O2 (sensors[0], w3, error);

endmodule