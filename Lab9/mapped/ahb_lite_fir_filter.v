/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Mar  9 10:11:51 2023
/////////////////////////////////////////////////////////////


module ahb_lite_slave ( clk, n_rst, sample_data, data_ready, 
        new_coefficient_set, coefficient_num, fir_coefficient, modwait, 
        fir_out, err, hsel, haddr, hsize, htrans, hwrite, hwdata, hrdata, 
        hresp );
  output [15:0] sample_data;
  input [1:0] coefficient_num;
  output [15:0] fir_coefficient;
  input [15:0] fir_out;
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, modwait, err, hsel, hsize, hwrite;
  output data_ready, new_coefficient_set, hresp;
  wire   N59, N60, N61, N62, N63, N64, \store[15][15] , \store[15][14] ,
         \store[15][13] , \store[15][12] , \store[15][11] , \store[15][10] ,
         \store[15][9] , \store[15][8] , \store[15][7] , \store[15][6] ,
         \store[15][5] , \store[15][4] , \store[15][3] , \store[15][2] ,
         \store[15][1] , \store[15][0] , \store[14][15] , \store[14][14] ,
         \store[14][13] , \store[14][12] , \store[14][11] , \store[14][10] ,
         \store[14][9] , \store[14][8] , \store[14][7] , \store[14][6] ,
         \store[14][5] , \store[14][4] , \store[14][3] , \store[14][2] ,
         \store[14][1] , \store[14][0] , \store[13][15] , \store[13][14] ,
         \store[13][13] , \store[13][12] , \store[13][11] , \store[13][10] ,
         \store[13][9] , \store[13][8] , \store[13][7] , \store[13][6] ,
         \store[13][5] , \store[13][4] , \store[13][3] , \store[13][2] ,
         \store[13][1] , \store[13][0] , \store[12][15] , \store[12][14] ,
         \store[12][13] , \store[12][12] , \store[12][11] , \store[12][10] ,
         \store[12][9] , \store[12][8] , \store[12][7] , \store[12][6] ,
         \store[12][5] , \store[12][4] , \store[12][3] , \store[12][2] ,
         \store[12][1] , \store[12][0] , \store[11][15] , \store[11][14] ,
         \store[11][13] , \store[11][12] , \store[11][11] , \store[11][10] ,
         \store[11][9] , \store[11][8] , \store[11][7] , \store[11][6] ,
         \store[11][5] , \store[11][4] , \store[11][3] , \store[11][2] ,
         \store[11][1] , \store[11][0] , \store[10][15] , \store[10][14] ,
         \store[10][13] , \store[10][12] , \store[10][11] , \store[10][10] ,
         \store[10][9] , \store[10][8] , \store[10][7] , \store[10][6] ,
         \store[10][5] , \store[10][4] , \store[10][3] , \store[10][2] ,
         \store[10][1] , \store[10][0] , \store[9][15] , \store[9][14] ,
         \store[9][13] , \store[9][12] , \store[9][11] , \store[9][10] ,
         \store[9][9] , \store[9][8] , \store[9][7] , \store[9][6] ,
         \store[9][5] , \store[9][4] , \store[9][3] , \store[9][2] ,
         \store[9][1] , \store[9][0] , \store[8][15] , \store[8][14] ,
         \store[8][13] , \store[8][12] , \store[8][11] , \store[8][10] ,
         \store[8][9] , \store[8][8] , \store[8][7] , \store[8][6] ,
         \store[8][5] , \store[8][4] , \store[8][3] , \store[8][2] ,
         \store[8][1] , \store[8][0] , \store[7][15] , \store[7][14] ,
         \store[7][13] , \store[7][12] , \store[7][11] , \store[7][10] ,
         \store[7][9] , \store[7][8] , \store[7][7] , \store[7][6] ,
         \store[7][5] , \store[7][4] , \store[7][3] , \store[7][2] ,
         \store[7][1] , \store[7][0] , \store[6][15] , \store[6][14] ,
         \store[6][13] , \store[6][12] , \store[6][11] , \store[6][10] ,
         \store[6][9] , \store[6][8] , \store[6][7] , \store[6][6] ,
         \store[6][5] , \store[6][4] , \store[6][3] , \store[6][2] ,
         \store[6][1] , \store[6][0] , \store[5][15] , \store[5][14] ,
         \store[5][13] , \store[5][12] , \store[5][11] , \store[5][10] ,
         \store[5][9] , \store[5][8] , \store[5][7] , \store[5][6] ,
         \store[5][5] , \store[5][4] , \store[5][3] , \store[5][2] ,
         \store[5][1] , \store[5][0] , \store[2][15] , \store[2][14] ,
         \store[2][13] , \store[2][12] , \store[2][11] , \store[2][10] ,
         \store[2][9] , \store[2][8] , \store[2][7] , \store[2][6] ,
         \store[2][5] , \store[2][4] , \store[2][3] , \store[2][2] ,
         \store[2][1] , \store[2][0] , \store[0][15] , \store[0][7] , size,
         write, \nstore[2][15] , \nstore[2][14] , \nstore[2][13] ,
         \nstore[2][12] , \nstore[2][11] , \nstore[2][10] , \nstore[2][9] ,
         \nstore[2][8] , \nstore[2][7] , \nstore[2][6] , \nstore[2][5] ,
         \nstore[2][4] , \nstore[2][3] , \nstore[2][2] , \nstore[2][1] ,
         \nstore[2][0] , \nstore[0][15] , \nstore[0][7] , N1041, N1042, N1043,
         N1044, N1045, N1046, N1047, N1048, N1057, N1058, N1059, N1060, N1061,
         N1062, N1063, N1064, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n1, n2, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041;
  wire   [1:0] trans;
  assign \nstore[2][15]  = fir_out[15];
  assign \nstore[2][14]  = fir_out[14];
  assign \nstore[2][13]  = fir_out[13];
  assign \nstore[2][12]  = fir_out[12];
  assign \nstore[2][11]  = fir_out[11];
  assign \nstore[2][10]  = fir_out[10];
  assign \nstore[2][9]  = fir_out[9];
  assign \nstore[2][8]  = fir_out[8];
  assign \nstore[2][7]  = fir_out[7];
  assign \nstore[2][6]  = fir_out[6];
  assign \nstore[2][5]  = fir_out[5];
  assign \nstore[2][4]  = fir_out[4];
  assign \nstore[2][3]  = fir_out[3];
  assign \nstore[2][2]  = fir_out[2];
  assign \nstore[2][1]  = fir_out[1];
  assign \nstore[2][0]  = fir_out[0];
  assign \nstore[0][7]  = err;

  DFFSR \store_reg[2][15]  ( .D(\nstore[2][15] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][15] ) );
  DFFSR \store_reg[2][14]  ( .D(\nstore[2][14] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][14] ) );
  DFFSR \store_reg[2][13]  ( .D(\nstore[2][13] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][13] ) );
  DFFSR \store_reg[2][12]  ( .D(\nstore[2][12] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][12] ) );
  DFFSR \store_reg[2][11]  ( .D(\nstore[2][11] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][11] ) );
  DFFSR \store_reg[2][10]  ( .D(\nstore[2][10] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[2][10] ) );
  DFFSR \store_reg[2][9]  ( .D(\nstore[2][9] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][9] ) );
  DFFSR \store_reg[2][8]  ( .D(\nstore[2][8] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][8] ) );
  DFFSR \store_reg[2][7]  ( .D(\nstore[2][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][7] ) );
  DFFSR \store_reg[2][6]  ( .D(\nstore[2][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][6] ) );
  DFFSR \store_reg[2][5]  ( .D(\nstore[2][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][5] ) );
  DFFSR \store_reg[2][4]  ( .D(\nstore[2][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][4] ) );
  DFFSR \store_reg[2][3]  ( .D(\nstore[2][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][3] ) );
  DFFSR \store_reg[2][2]  ( .D(\nstore[2][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][2] ) );
  DFFSR \store_reg[2][1]  ( .D(\nstore[2][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][1] ) );
  DFFSR \store_reg[2][0]  ( .D(\nstore[2][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[2][0] ) );
  DFFSR \store_reg[0][7]  ( .D(\nstore[0][7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\store[0][7] ) );
  DFFSR \addr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N64)
         );
  DFFSR \addr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N63)
         );
  DFFSR \addr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N62)
         );
  DFFSR \addr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(N61)
         );
  DFFSR size_reg ( .D(hsize), .CLK(clk), .R(n_rst), .S(1'b1), .Q(size) );
  DFFSR \trans_reg[1]  ( .D(htrans[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        trans[1]) );
  DFFSR \trans_reg[0]  ( .D(htrans[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        trans[0]) );
  DFFSR write_reg ( .D(hwrite), .CLK(clk), .R(n_rst), .S(1'b1), .Q(write) );
  DFFSR \store_reg[15][7]  ( .D(n624), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][7] ) );
  DFFSR \store_reg[15][6]  ( .D(n625), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][6] ) );
  DFFSR \store_reg[15][5]  ( .D(n626), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][5] ) );
  DFFSR \store_reg[15][4]  ( .D(n627), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][4] ) );
  DFFSR \store_reg[15][3]  ( .D(n628), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][3] ) );
  DFFSR \store_reg[15][2]  ( .D(n629), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][2] ) );
  DFFSR \store_reg[15][1]  ( .D(n630), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][1] ) );
  DFFSR \store_reg[15][0]  ( .D(n631), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][0] ) );
  DFFSR \store_reg[14][7]  ( .D(n640), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][7] ) );
  DFFSR \store_reg[14][6]  ( .D(n641), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][6] ) );
  DFFSR \store_reg[14][5]  ( .D(n642), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][5] ) );
  DFFSR \store_reg[14][4]  ( .D(n643), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][4] ) );
  DFFSR \store_reg[14][3]  ( .D(n644), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][3] ) );
  DFFSR \store_reg[14][2]  ( .D(n645), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][2] ) );
  DFFSR \store_reg[14][1]  ( .D(n646), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][1] ) );
  DFFSR \store_reg[14][0]  ( .D(n647), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][0] ) );
  DFFSR new_coefficient_set_reg ( .D(n1041), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(new_coefficient_set) );
  DFFSR \store_reg[13][7]  ( .D(n656), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][7] ) );
  DFFSR \store_reg[13][6]  ( .D(n657), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][6] ) );
  DFFSR \store_reg[13][5]  ( .D(n658), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][5] ) );
  DFFSR \store_reg[13][4]  ( .D(n659), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][4] ) );
  DFFSR \store_reg[13][3]  ( .D(n660), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][3] ) );
  DFFSR \store_reg[13][2]  ( .D(n661), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][2] ) );
  DFFSR \store_reg[13][1]  ( .D(n662), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][1] ) );
  DFFSR \store_reg[13][0]  ( .D(n663), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][0] ) );
  DFFSR \store_reg[12][7]  ( .D(n672), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][7] ) );
  DFFSR \store_reg[12][6]  ( .D(n673), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][6] ) );
  DFFSR \store_reg[12][5]  ( .D(n674), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][5] ) );
  DFFSR \store_reg[12][4]  ( .D(n675), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][4] ) );
  DFFSR \store_reg[12][3]  ( .D(n676), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][3] ) );
  DFFSR \store_reg[12][2]  ( .D(n677), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][2] ) );
  DFFSR \store_reg[12][1]  ( .D(n678), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][1] ) );
  DFFSR \store_reg[12][0]  ( .D(n679), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][0] ) );
  DFFSR \store_reg[11][7]  ( .D(n688), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][7] ) );
  DFFSR \store_reg[11][6]  ( .D(n689), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][6] ) );
  DFFSR \store_reg[11][5]  ( .D(n690), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][5] ) );
  DFFSR \store_reg[11][4]  ( .D(n691), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][4] ) );
  DFFSR \store_reg[11][3]  ( .D(n692), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][3] ) );
  DFFSR \store_reg[11][2]  ( .D(n693), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][2] ) );
  DFFSR \store_reg[11][1]  ( .D(n694), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][1] ) );
  DFFSR \store_reg[11][0]  ( .D(n695), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][0] ) );
  DFFSR \store_reg[10][7]  ( .D(n704), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][7] ) );
  DFFSR \store_reg[10][6]  ( .D(n705), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][6] ) );
  DFFSR \store_reg[10][5]  ( .D(n706), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][5] ) );
  DFFSR \store_reg[10][4]  ( .D(n707), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][4] ) );
  DFFSR \store_reg[10][3]  ( .D(n708), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][3] ) );
  DFFSR \store_reg[10][2]  ( .D(n709), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][2] ) );
  DFFSR \store_reg[10][1]  ( .D(n710), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][1] ) );
  DFFSR \store_reg[10][0]  ( .D(n711), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][0] ) );
  DFFSR \store_reg[9][7]  ( .D(n720), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][7] ) );
  DFFSR \store_reg[9][6]  ( .D(n721), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][6] ) );
  DFFSR \store_reg[9][5]  ( .D(n722), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][5] ) );
  DFFSR \store_reg[9][4]  ( .D(n723), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][4] ) );
  DFFSR \store_reg[9][3]  ( .D(n724), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][3] ) );
  DFFSR \store_reg[9][2]  ( .D(n725), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][2] ) );
  DFFSR \store_reg[9][1]  ( .D(n726), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][1] ) );
  DFFSR \store_reg[9][0]  ( .D(n727), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][0] ) );
  DFFSR \store_reg[8][7]  ( .D(n736), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][7] ) );
  DFFSR \store_reg[8][6]  ( .D(n737), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][6] ) );
  DFFSR \store_reg[8][5]  ( .D(n738), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][5] ) );
  DFFSR \store_reg[8][4]  ( .D(n739), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][4] ) );
  DFFSR \store_reg[8][3]  ( .D(n740), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][3] ) );
  DFFSR \store_reg[8][2]  ( .D(n741), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][2] ) );
  DFFSR \store_reg[8][1]  ( .D(n742), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][1] ) );
  DFFSR \store_reg[8][0]  ( .D(n743), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][0] ) );
  DFFSR \store_reg[7][7]  ( .D(n752), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][7] ) );
  DFFSR \store_reg[7][6]  ( .D(n753), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][6] ) );
  DFFSR \store_reg[7][5]  ( .D(n754), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][5] ) );
  DFFSR \store_reg[7][4]  ( .D(n755), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][4] ) );
  DFFSR \store_reg[7][3]  ( .D(n756), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][3] ) );
  DFFSR \store_reg[7][2]  ( .D(n757), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][2] ) );
  DFFSR \store_reg[7][1]  ( .D(n758), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][1] ) );
  DFFSR \store_reg[7][0]  ( .D(n759), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][0] ) );
  DFFSR \store_reg[6][7]  ( .D(n768), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][7] ) );
  DFFSR \store_reg[6][6]  ( .D(n769), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][6] ) );
  DFFSR \store_reg[6][5]  ( .D(n770), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][5] ) );
  DFFSR \store_reg[6][4]  ( .D(n771), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][4] ) );
  DFFSR \store_reg[6][3]  ( .D(n772), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][3] ) );
  DFFSR \store_reg[6][2]  ( .D(n773), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][2] ) );
  DFFSR \store_reg[6][1]  ( .D(n774), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][1] ) );
  DFFSR \store_reg[6][0]  ( .D(n775), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][0] ) );
  DFFSR \store_reg[5][7]  ( .D(n784), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][7] ) );
  DFFSR \store_reg[5][6]  ( .D(n785), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][6] ) );
  DFFSR \store_reg[5][5]  ( .D(n786), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][5] ) );
  DFFSR \store_reg[5][4]  ( .D(n787), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][4] ) );
  DFFSR \store_reg[5][3]  ( .D(n788), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][3] ) );
  DFFSR \store_reg[5][2]  ( .D(n789), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][2] ) );
  DFFSR \store_reg[5][1]  ( .D(n790), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][1] ) );
  DFFSR \store_reg[5][0]  ( .D(n791), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][0] ) );
  DFFSR \store_reg[4][7]  ( .D(n800), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[7]) );
  DFFSR \store_reg[4][6]  ( .D(n801), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[6]) );
  DFFSR \store_reg[4][5]  ( .D(n802), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[5]) );
  DFFSR \store_reg[4][4]  ( .D(n803), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[4]) );
  DFFSR \store_reg[4][3]  ( .D(n804), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[3]) );
  DFFSR \store_reg[4][2]  ( .D(n805), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[2]) );
  DFFSR \store_reg[4][1]  ( .D(n806), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[1]) );
  DFFSR \store_reg[4][0]  ( .D(n807), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[0]) );
  DFFSR \store_reg[4][15]  ( .D(n792), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[15]) );
  DFFSR \store_reg[4][14]  ( .D(n793), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[14]) );
  DFFSR \store_reg[4][13]  ( .D(n794), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[13]) );
  DFFSR \store_reg[4][12]  ( .D(n795), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[12]) );
  DFFSR \store_reg[4][11]  ( .D(n796), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[11]) );
  DFFSR \store_reg[4][10]  ( .D(n797), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[10]) );
  DFFSR \store_reg[4][9]  ( .D(n798), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[9]) );
  DFFSR \store_reg[4][8]  ( .D(n799), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sample_data[8]) );
  DFFSR \store_reg[15][15]  ( .D(n616), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][15] ) );
  DFFSR \store_reg[15][14]  ( .D(n617), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][14] ) );
  DFFSR \store_reg[15][13]  ( .D(n618), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][13] ) );
  DFFSR \store_reg[15][12]  ( .D(n619), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][12] ) );
  DFFSR \store_reg[15][11]  ( .D(n620), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][11] ) );
  DFFSR \store_reg[15][10]  ( .D(n621), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][10] ) );
  DFFSR \store_reg[15][9]  ( .D(n622), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][9] ) );
  DFFSR \store_reg[15][8]  ( .D(n623), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[15][8] ) );
  DFFSR \store_reg[14][15]  ( .D(n632), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][15] ) );
  DFFSR \store_reg[14][14]  ( .D(n633), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][14] ) );
  DFFSR \store_reg[14][13]  ( .D(n634), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][13] ) );
  DFFSR \store_reg[14][12]  ( .D(n635), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][12] ) );
  DFFSR \store_reg[14][11]  ( .D(n636), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][11] ) );
  DFFSR \store_reg[14][10]  ( .D(n637), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][10] ) );
  DFFSR \store_reg[14][9]  ( .D(n638), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][9] ) );
  DFFSR \store_reg[14][8]  ( .D(n639), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[14][8] ) );
  DFFSR \store_reg[13][15]  ( .D(n648), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][15] ) );
  DFFSR \store_reg[13][14]  ( .D(n649), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][14] ) );
  DFFSR \store_reg[13][13]  ( .D(n650), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][13] ) );
  DFFSR \store_reg[13][12]  ( .D(n651), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][12] ) );
  DFFSR \store_reg[13][11]  ( .D(n652), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][11] ) );
  DFFSR \store_reg[13][10]  ( .D(n653), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][10] ) );
  DFFSR \store_reg[13][9]  ( .D(n654), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][9] ) );
  DFFSR \store_reg[13][8]  ( .D(n655), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[13][8] ) );
  DFFSR \store_reg[12][15]  ( .D(n664), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][15] ) );
  DFFSR \store_reg[12][14]  ( .D(n665), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][14] ) );
  DFFSR \store_reg[12][13]  ( .D(n666), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][13] ) );
  DFFSR \store_reg[12][12]  ( .D(n667), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][12] ) );
  DFFSR \store_reg[12][11]  ( .D(n668), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][11] ) );
  DFFSR \store_reg[12][10]  ( .D(n669), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][10] ) );
  DFFSR \store_reg[12][9]  ( .D(n670), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][9] ) );
  DFFSR \store_reg[12][8]  ( .D(n671), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[12][8] ) );
  DFFSR \store_reg[11][15]  ( .D(n680), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][15] ) );
  DFFSR \store_reg[11][14]  ( .D(n681), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][14] ) );
  DFFSR \store_reg[11][13]  ( .D(n682), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][13] ) );
  DFFSR \store_reg[11][12]  ( .D(n683), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][12] ) );
  DFFSR \store_reg[11][11]  ( .D(n684), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][11] ) );
  DFFSR \store_reg[11][10]  ( .D(n685), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][10] ) );
  DFFSR \store_reg[11][9]  ( .D(n686), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][9] ) );
  DFFSR \store_reg[11][8]  ( .D(n687), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[11][8] ) );
  DFFSR \store_reg[10][15]  ( .D(n696), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][15] ) );
  DFFSR \store_reg[10][14]  ( .D(n697), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][14] ) );
  DFFSR \store_reg[10][13]  ( .D(n698), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][13] ) );
  DFFSR \store_reg[10][12]  ( .D(n699), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][12] ) );
  DFFSR \store_reg[10][11]  ( .D(n700), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][11] ) );
  DFFSR \store_reg[10][10]  ( .D(n701), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][10] ) );
  DFFSR \store_reg[10][9]  ( .D(n702), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][9] ) );
  DFFSR \store_reg[10][8]  ( .D(n703), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[10][8] ) );
  DFFSR \store_reg[9][15]  ( .D(n712), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][15] ) );
  DFFSR \store_reg[9][14]  ( .D(n713), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][14] ) );
  DFFSR \store_reg[9][13]  ( .D(n714), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][13] ) );
  DFFSR \store_reg[9][12]  ( .D(n715), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][12] ) );
  DFFSR \store_reg[9][11]  ( .D(n716), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][11] ) );
  DFFSR \store_reg[9][10]  ( .D(n717), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][10] ) );
  DFFSR \store_reg[9][9]  ( .D(n718), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][9] ) );
  DFFSR \store_reg[9][8]  ( .D(n719), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[9][8] ) );
  DFFSR \store_reg[8][15]  ( .D(n728), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][15] ) );
  DFFSR \store_reg[8][14]  ( .D(n729), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][14] ) );
  DFFSR \store_reg[8][13]  ( .D(n730), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][13] ) );
  DFFSR \store_reg[8][12]  ( .D(n731), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][12] ) );
  DFFSR \store_reg[8][11]  ( .D(n732), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][11] ) );
  DFFSR \store_reg[8][10]  ( .D(n733), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][10] ) );
  DFFSR \store_reg[8][9]  ( .D(n734), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][9] ) );
  DFFSR \store_reg[8][8]  ( .D(n735), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[8][8] ) );
  DFFSR \store_reg[7][15]  ( .D(n744), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][15] ) );
  DFFSR \store_reg[7][14]  ( .D(n745), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][14] ) );
  DFFSR \store_reg[7][13]  ( .D(n746), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][13] ) );
  DFFSR \store_reg[7][12]  ( .D(n747), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][12] ) );
  DFFSR \store_reg[7][11]  ( .D(n748), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][11] ) );
  DFFSR \store_reg[7][10]  ( .D(n749), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][10] ) );
  DFFSR \store_reg[7][9]  ( .D(n750), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][9] ) );
  DFFSR \store_reg[7][8]  ( .D(n751), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[7][8] ) );
  DFFSR \store_reg[6][15]  ( .D(n760), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][15] ) );
  DFFSR \store_reg[6][14]  ( .D(n761), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][14] ) );
  DFFSR \store_reg[6][13]  ( .D(n762), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][13] ) );
  DFFSR \store_reg[6][12]  ( .D(n763), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][12] ) );
  DFFSR \store_reg[6][11]  ( .D(n764), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][11] ) );
  DFFSR \store_reg[6][10]  ( .D(n765), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][10] ) );
  DFFSR \store_reg[6][9]  ( .D(n766), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][9] ) );
  DFFSR \store_reg[6][8]  ( .D(n767), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[6][8] ) );
  DFFSR \store_reg[5][15]  ( .D(n776), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][15] ) );
  DFFSR \store_reg[5][14]  ( .D(n777), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][14] ) );
  DFFSR \store_reg[5][13]  ( .D(n778), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][13] ) );
  DFFSR \store_reg[5][12]  ( .D(n779), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][12] ) );
  DFFSR \store_reg[5][11]  ( .D(n780), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][11] ) );
  DFFSR \store_reg[5][10]  ( .D(n781), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][10] ) );
  DFFSR \store_reg[5][9]  ( .D(n782), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][9] ) );
  DFFSR \store_reg[5][8]  ( .D(n783), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \store[5][8] ) );
  DFFSR data_ready_reg ( .D(n1040), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR \store_reg[0][15]  ( .D(\nstore[0][15] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\store[0][15] ) );
  AND2X2 U56 ( .A(n230), .B(n1039), .Y(n310) );
  INVX1 U207 ( .A(n597), .Y(n1) );
  INVX1 U208 ( .A(n582), .Y(n597) );
  BUFX2 U209 ( .A(n577), .Y(n2) );
  AND2X2 U210 ( .A(n232), .B(n1039), .Y(n312) );
  BUFX2 U211 ( .A(n576), .Y(n223) );
  BUFX2 U212 ( .A(n584), .Y(n224) );
  AND2X2 U213 ( .A(n230), .B(coefficient_num[0]), .Y(n314) );
  AND2X2 U215 ( .A(n1039), .B(n231), .Y(n309) );
  BUFX2 U216 ( .A(n586), .Y(n225) );
  BUFX2 U217 ( .A(n578), .Y(n226) );
  AND2X2 U218 ( .A(n233), .B(n1039), .Y(n311) );
  AND2X2 U219 ( .A(n231), .B(coefficient_num[0]), .Y(n313) );
  INVX2 U220 ( .A(n818), .Y(n227) );
  INVX1 U221 ( .A(n227), .Y(n598) );
  BUFX2 U222 ( .A(n579), .Y(n228) );
  BUFX2 U223 ( .A(n585), .Y(n229) );
  NOR2X1 U224 ( .A(n323), .B(N59), .Y(n230) );
  NOR2X1 U225 ( .A(n323), .B(n322), .Y(n231) );
  AOI22X1 U226 ( .A(\store[10][0] ), .B(n310), .C(\store[14][0] ), .D(n309), 
        .Y(n238) );
  NOR2X1 U227 ( .A(N59), .B(N60), .Y(n232) );
  NOR2X1 U228 ( .A(n322), .B(N60), .Y(n233) );
  AOI22X1 U229 ( .A(\store[2][0] ), .B(n312), .C(\store[6][0] ), .D(n311), .Y(
        n237) );
  AOI22X1 U230 ( .A(\store[8][0] ), .B(n314), .C(\store[12][0] ), .D(n313), 
        .Y(n235) );
  AND2X1 U231 ( .A(n232), .B(coefficient_num[0]), .Y(n316) );
  AND2X1 U232 ( .A(n233), .B(coefficient_num[0]), .Y(n315) );
  AND2X1 U233 ( .A(n235), .B(n234), .Y(n236) );
  NAND3X1 U234 ( .A(n238), .B(n237), .C(n236), .Y(fir_coefficient[0]) );
  AOI22X1 U235 ( .A(\store[10][1] ), .B(n310), .C(\store[14][1] ), .D(n309), 
        .Y(n243) );
  AOI22X1 U236 ( .A(\store[2][1] ), .B(n312), .C(\store[6][1] ), .D(n311), .Y(
        n242) );
  AOI22X1 U237 ( .A(\store[8][1] ), .B(n314), .C(\store[12][1] ), .D(n313), 
        .Y(n240) );
  AND2X1 U254 ( .A(n240), .B(n239), .Y(n241) );
  NAND3X1 U255 ( .A(n243), .B(n242), .C(n241), .Y(fir_coefficient[1]) );
  AOI22X1 U256 ( .A(\store[10][2] ), .B(n310), .C(\store[14][2] ), .D(n309), 
        .Y(n248) );
  AOI22X1 U257 ( .A(\store[2][2] ), .B(n312), .C(\store[6][2] ), .D(n311), .Y(
        n247) );
  AOI22X1 U258 ( .A(\store[8][2] ), .B(n314), .C(\store[12][2] ), .D(n313), 
        .Y(n245) );
  AND2X1 U259 ( .A(n245), .B(n244), .Y(n246) );
  NAND3X1 U260 ( .A(n248), .B(n247), .C(n246), .Y(fir_coefficient[2]) );
  AOI22X1 U261 ( .A(\store[10][3] ), .B(n310), .C(\store[14][3] ), .D(n309), 
        .Y(n253) );
  AOI22X1 U262 ( .A(\store[2][3] ), .B(n312), .C(\store[6][3] ), .D(n311), .Y(
        n252) );
  AOI22X1 U263 ( .A(\store[8][3] ), .B(n314), .C(\store[12][3] ), .D(n313), 
        .Y(n250) );
  AND2X1 U264 ( .A(n250), .B(n249), .Y(n251) );
  NAND3X1 U265 ( .A(n253), .B(n252), .C(n251), .Y(fir_coefficient[3]) );
  AOI22X1 U266 ( .A(\store[10][4] ), .B(n310), .C(\store[14][4] ), .D(n309), 
        .Y(n258) );
  AOI22X1 U267 ( .A(\store[2][4] ), .B(n312), .C(\store[6][4] ), .D(n311), .Y(
        n257) );
  AOI22X1 U268 ( .A(\store[8][4] ), .B(n314), .C(\store[12][4] ), .D(n313), 
        .Y(n255) );
  AND2X1 U269 ( .A(n255), .B(n254), .Y(n256) );
  NAND3X1 U270 ( .A(n258), .B(n257), .C(n256), .Y(fir_coefficient[4]) );
  AOI22X1 U271 ( .A(\store[10][5] ), .B(n310), .C(\store[14][5] ), .D(n309), 
        .Y(n263) );
  AOI22X1 U272 ( .A(\store[2][5] ), .B(n312), .C(\store[6][5] ), .D(n311), .Y(
        n262) );
  AOI22X1 U273 ( .A(\store[8][5] ), .B(n314), .C(\store[12][5] ), .D(n313), 
        .Y(n260) );
  AND2X1 U274 ( .A(n260), .B(n259), .Y(n261) );
  NAND3X1 U275 ( .A(n263), .B(n262), .C(n261), .Y(fir_coefficient[5]) );
  AOI22X1 U276 ( .A(\store[10][6] ), .B(n310), .C(\store[14][6] ), .D(n309), 
        .Y(n268) );
  AOI22X1 U277 ( .A(\store[2][6] ), .B(n312), .C(\store[6][6] ), .D(n311), .Y(
        n267) );
  AOI22X1 U278 ( .A(\store[8][6] ), .B(n314), .C(\store[12][6] ), .D(n313), 
        .Y(n265) );
  AND2X1 U279 ( .A(n265), .B(n264), .Y(n266) );
  NAND3X1 U280 ( .A(n268), .B(n267), .C(n266), .Y(fir_coefficient[6]) );
  AOI22X1 U281 ( .A(\store[10][7] ), .B(n310), .C(\store[14][7] ), .D(n309), 
        .Y(n273) );
  AOI22X1 U282 ( .A(\store[2][7] ), .B(n312), .C(\store[6][7] ), .D(n311), .Y(
        n272) );
  AOI22X1 U283 ( .A(\store[8][7] ), .B(n314), .C(\store[12][7] ), .D(n313), 
        .Y(n270) );
  AOI22X1 U284 ( .A(\store[0][7] ), .B(n316), .C(sample_data[7]), .D(n315), 
        .Y(n269) );
  AND2X1 U285 ( .A(n270), .B(n269), .Y(n271) );
  NAND3X1 U286 ( .A(n273), .B(n272), .C(n271), .Y(fir_coefficient[7]) );
  AOI22X1 U287 ( .A(\store[10][8] ), .B(n310), .C(\store[14][8] ), .D(n309), 
        .Y(n278) );
  AOI22X1 U288 ( .A(\store[2][8] ), .B(n312), .C(\store[6][8] ), .D(n311), .Y(
        n277) );
  AOI22X1 U289 ( .A(\store[8][8] ), .B(n314), .C(\store[12][8] ), .D(n313), 
        .Y(n275) );
  AND2X1 U290 ( .A(n275), .B(n274), .Y(n276) );
  NAND3X1 U291 ( .A(n278), .B(n277), .C(n276), .Y(fir_coefficient[8]) );
  AOI22X1 U292 ( .A(\store[10][9] ), .B(n310), .C(\store[14][9] ), .D(n309), 
        .Y(n283) );
  AOI22X1 U293 ( .A(\store[2][9] ), .B(n312), .C(\store[6][9] ), .D(n311), .Y(
        n282) );
  AOI22X1 U294 ( .A(\store[8][9] ), .B(n314), .C(\store[12][9] ), .D(n313), 
        .Y(n280) );
  AND2X1 U295 ( .A(n280), .B(n279), .Y(n281) );
  NAND3X1 U296 ( .A(n283), .B(n282), .C(n281), .Y(fir_coefficient[9]) );
  AOI22X1 U297 ( .A(\store[10][10] ), .B(n310), .C(\store[14][10] ), .D(n309), 
        .Y(n288) );
  AOI22X1 U298 ( .A(\store[2][10] ), .B(n312), .C(\store[6][10] ), .D(n311), 
        .Y(n287) );
  AOI22X1 U299 ( .A(\store[8][10] ), .B(n314), .C(\store[12][10] ), .D(n313), 
        .Y(n285) );
  AND2X1 U300 ( .A(n285), .B(n284), .Y(n286) );
  NAND3X1 U301 ( .A(n288), .B(n287), .C(n286), .Y(fir_coefficient[10]) );
  AOI22X1 U302 ( .A(\store[10][11] ), .B(n310), .C(\store[14][11] ), .D(n309), 
        .Y(n293) );
  AOI22X1 U303 ( .A(\store[2][11] ), .B(n312), .C(\store[6][11] ), .D(n311), 
        .Y(n292) );
  AOI22X1 U304 ( .A(\store[8][11] ), .B(n314), .C(\store[12][11] ), .D(n313), 
        .Y(n290) );
  AND2X1 U305 ( .A(n290), .B(n289), .Y(n291) );
  NAND3X1 U306 ( .A(n293), .B(n292), .C(n291), .Y(fir_coefficient[11]) );
  AOI22X1 U307 ( .A(\store[10][12] ), .B(n310), .C(\store[14][12] ), .D(n309), 
        .Y(n298) );
  AOI22X1 U308 ( .A(\store[2][12] ), .B(n312), .C(\store[6][12] ), .D(n311), 
        .Y(n297) );
  AOI22X1 U309 ( .A(\store[8][12] ), .B(n314), .C(\store[12][12] ), .D(n313), 
        .Y(n295) );
  AND2X1 U310 ( .A(n295), .B(n294), .Y(n296) );
  NAND3X1 U311 ( .A(n298), .B(n297), .C(n296), .Y(fir_coefficient[12]) );
  AOI22X1 U312 ( .A(\store[10][13] ), .B(n310), .C(\store[14][13] ), .D(n309), 
        .Y(n303) );
  AOI22X1 U313 ( .A(\store[2][13] ), .B(n312), .C(\store[6][13] ), .D(n311), 
        .Y(n302) );
  AOI22X1 U314 ( .A(\store[8][13] ), .B(n314), .C(\store[12][13] ), .D(n313), 
        .Y(n300) );
  AND2X1 U315 ( .A(n300), .B(n299), .Y(n301) );
  NAND3X1 U316 ( .A(n303), .B(n302), .C(n301), .Y(fir_coefficient[13]) );
  AOI22X1 U317 ( .A(\store[10][14] ), .B(n310), .C(\store[14][14] ), .D(n309), 
        .Y(n308) );
  AOI22X1 U318 ( .A(\store[2][14] ), .B(n312), .C(\store[6][14] ), .D(n311), 
        .Y(n307) );
  AOI22X1 U319 ( .A(\store[8][14] ), .B(n314), .C(\store[12][14] ), .D(n313), 
        .Y(n305) );
  AND2X1 U320 ( .A(n305), .B(n304), .Y(n306) );
  NAND3X1 U321 ( .A(n308), .B(n307), .C(n306), .Y(fir_coefficient[14]) );
  AOI22X1 U322 ( .A(\store[10][15] ), .B(n310), .C(\store[14][15] ), .D(n309), 
        .Y(n321) );
  AOI22X1 U323 ( .A(\store[2][15] ), .B(n312), .C(\store[6][15] ), .D(n311), 
        .Y(n320) );
  AOI22X1 U324 ( .A(\store[8][15] ), .B(n314), .C(\store[12][15] ), .D(n313), 
        .Y(n318) );
  AOI22X1 U325 ( .A(\store[0][15] ), .B(n316), .C(sample_data[15]), .D(n315), 
        .Y(n317) );
  AND2X1 U326 ( .A(n318), .B(n317), .Y(n319) );
  NAND3X1 U327 ( .A(n321), .B(n320), .C(n319), .Y(fir_coefficient[15]) );
  NAND2X1 U328 ( .A(sample_data[14]), .B(n315), .Y(n304) );
  NAND2X1 U329 ( .A(sample_data[13]), .B(n315), .Y(n299) );
  NAND2X1 U330 ( .A(sample_data[12]), .B(n315), .Y(n294) );
  NAND2X1 U331 ( .A(sample_data[11]), .B(n315), .Y(n289) );
  NAND2X1 U332 ( .A(sample_data[10]), .B(n315), .Y(n284) );
  NAND2X1 U333 ( .A(sample_data[9]), .B(n315), .Y(n279) );
  NAND2X1 U334 ( .A(sample_data[8]), .B(n315), .Y(n274) );
  NAND2X1 U335 ( .A(sample_data[6]), .B(n315), .Y(n264) );
  NAND2X1 U336 ( .A(sample_data[5]), .B(n315), .Y(n259) );
  NAND2X1 U337 ( .A(sample_data[4]), .B(n315), .Y(n254) );
  NAND2X1 U338 ( .A(sample_data[3]), .B(n315), .Y(n249) );
  NAND2X1 U339 ( .A(sample_data[2]), .B(n315), .Y(n244) );
  NAND2X1 U340 ( .A(sample_data[1]), .B(n315), .Y(n239) );
  NAND2X1 U341 ( .A(sample_data[0]), .B(n315), .Y(n234) );
  INVX2 U342 ( .A(N59), .Y(n322) );
  INVX2 U343 ( .A(N60), .Y(n323) );
  NOR2X1 U344 ( .A(n595), .B(N63), .Y(n326) );
  NAND2X1 U345 ( .A(n326), .B(N61), .Y(n577) );
  NOR2X1 U346 ( .A(N62), .B(N63), .Y(n327) );
  NAND2X1 U347 ( .A(n327), .B(N61), .Y(n576) );
  OAI22X1 U348 ( .A(\store[11][7] ), .B(n2), .C(\store[9][7] ), .D(n223), .Y(
        n325) );
  NOR2X1 U349 ( .A(n889), .B(n595), .Y(n330) );
  NAND2X1 U350 ( .A(N61), .B(n330), .Y(n579) );
  NOR2X1 U351 ( .A(n889), .B(N62), .Y(n331) );
  NAND2X1 U352 ( .A(n331), .B(N61), .Y(n578) );
  OAI22X1 U353 ( .A(\store[15][7] ), .B(n579), .C(\store[13][7] ), .D(n578), 
        .Y(n324) );
  NOR2X1 U354 ( .A(n325), .B(n324), .Y(n343) );
  NAND2X1 U355 ( .A(n326), .B(n594), .Y(n584) );
  NAND2X1 U356 ( .A(n327), .B(n594), .Y(n582) );
  NOR2X1 U357 ( .A(\store[8][7] ), .B(n582), .Y(n328) );
  NOR2X1 U358 ( .A(n598), .B(n328), .Y(n329) );
  OAI21X1 U359 ( .A(\store[10][7] ), .B(n584), .C(n329), .Y(n333) );
  NAND2X1 U360 ( .A(n330), .B(n594), .Y(n586) );
  NAND2X1 U361 ( .A(n331), .B(n594), .Y(n585) );
  OAI22X1 U362 ( .A(\store[14][7] ), .B(n586), .C(\store[12][7] ), .D(n585), 
        .Y(n332) );
  NOR2X1 U363 ( .A(n333), .B(n332), .Y(n342) );
  OAI22X1 U364 ( .A(\store[7][7] ), .B(n579), .C(\store[5][7] ), .D(n578), .Y(
        n334) );
  NOR2X1 U365 ( .A(n335), .B(n334), .Y(n341) );
  NOR2X1 U366 ( .A(\store[0][7] ), .B(n582), .Y(n336) );
  NOR2X1 U367 ( .A(N64), .B(n336), .Y(n337) );
  OAI21X1 U368 ( .A(\store[2][7] ), .B(n584), .C(n337), .Y(n339) );
  OAI22X1 U369 ( .A(\store[6][7] ), .B(n586), .C(sample_data[7]), .D(n585), 
        .Y(n338) );
  NOR2X1 U370 ( .A(n339), .B(n338), .Y(n340) );
  AOI22X1 U371 ( .A(n343), .B(n342), .C(n341), .D(n340), .Y(n344) );
  OAI22X1 U372 ( .A(\store[11][6] ), .B(n2), .C(\store[9][6] ), .D(n223), .Y(
        n346) );
  OAI22X1 U373 ( .A(\store[15][6] ), .B(n579), .C(\store[13][6] ), .D(n578), 
        .Y(n345) );
  NOR2X1 U374 ( .A(n346), .B(n345), .Y(n359) );
  NOR2X1 U375 ( .A(\store[8][6] ), .B(n582), .Y(n347) );
  NOR2X1 U376 ( .A(n598), .B(n347), .Y(n348) );
  OAI21X1 U377 ( .A(\store[10][6] ), .B(n584), .C(n348), .Y(n350) );
  OAI22X1 U378 ( .A(\store[14][6] ), .B(n586), .C(\store[12][6] ), .D(n585), 
        .Y(n349) );
  NOR2X1 U379 ( .A(n350), .B(n349), .Y(n358) );
  OAI22X1 U380 ( .A(\store[7][6] ), .B(n579), .C(\store[5][6] ), .D(n578), .Y(
        n351) );
  NOR2X1 U381 ( .A(n352), .B(n351), .Y(n357) );
  NOR2X1 U382 ( .A(N64), .B(n597), .Y(n353) );
  OAI21X1 U383 ( .A(\store[2][6] ), .B(n584), .C(n353), .Y(n355) );
  OAI22X1 U384 ( .A(\store[6][6] ), .B(n586), .C(sample_data[6]), .D(n585), 
        .Y(n354) );
  NOR2X1 U385 ( .A(n355), .B(n354), .Y(n356) );
  AOI22X1 U386 ( .A(n359), .B(n358), .C(n357), .D(n356), .Y(n360) );
  OAI22X1 U387 ( .A(\store[11][5] ), .B(n2), .C(\store[9][5] ), .D(n223), .Y(
        n362) );
  OAI22X1 U388 ( .A(\store[15][5] ), .B(n579), .C(\store[13][5] ), .D(n578), 
        .Y(n361) );
  NOR2X1 U389 ( .A(n362), .B(n361), .Y(n375) );
  NOR2X1 U390 ( .A(\store[8][5] ), .B(n582), .Y(n363) );
  NOR2X1 U391 ( .A(n598), .B(n363), .Y(n364) );
  OAI21X1 U392 ( .A(\store[10][5] ), .B(n584), .C(n364), .Y(n366) );
  OAI22X1 U393 ( .A(\store[14][5] ), .B(n586), .C(\store[12][5] ), .D(n585), 
        .Y(n365) );
  NOR2X1 U394 ( .A(n366), .B(n365), .Y(n374) );
  OAI22X1 U395 ( .A(\store[7][5] ), .B(n579), .C(\store[5][5] ), .D(n578), .Y(
        n367) );
  NOR2X1 U396 ( .A(n368), .B(n367), .Y(n373) );
  NOR2X1 U397 ( .A(N64), .B(n597), .Y(n369) );
  OAI21X1 U398 ( .A(\store[2][5] ), .B(n584), .C(n369), .Y(n371) );
  OAI22X1 U399 ( .A(\store[6][5] ), .B(n586), .C(sample_data[5]), .D(n585), 
        .Y(n370) );
  NOR2X1 U400 ( .A(n371), .B(n370), .Y(n372) );
  AOI22X1 U401 ( .A(n375), .B(n374), .C(n373), .D(n372), .Y(n376) );
  OAI22X1 U402 ( .A(\store[11][4] ), .B(n2), .C(\store[9][4] ), .D(n223), .Y(
        n378) );
  OAI22X1 U403 ( .A(\store[15][4] ), .B(n579), .C(\store[13][4] ), .D(n578), 
        .Y(n377) );
  NOR2X1 U404 ( .A(n378), .B(n377), .Y(n391) );
  NOR2X1 U405 ( .A(\store[8][4] ), .B(n582), .Y(n379) );
  NOR2X1 U406 ( .A(n598), .B(n379), .Y(n380) );
  OAI21X1 U407 ( .A(\store[10][4] ), .B(n584), .C(n380), .Y(n382) );
  OAI22X1 U408 ( .A(\store[14][4] ), .B(n586), .C(\store[12][4] ), .D(n585), 
        .Y(n381) );
  NOR2X1 U409 ( .A(n382), .B(n381), .Y(n390) );
  OAI22X1 U410 ( .A(\store[7][4] ), .B(n579), .C(\store[5][4] ), .D(n578), .Y(
        n383) );
  NOR2X1 U411 ( .A(n384), .B(n383), .Y(n389) );
  NOR2X1 U412 ( .A(N64), .B(n597), .Y(n385) );
  OAI21X1 U413 ( .A(\store[2][4] ), .B(n584), .C(n385), .Y(n387) );
  OAI22X1 U414 ( .A(\store[6][4] ), .B(n586), .C(sample_data[4]), .D(n585), 
        .Y(n386) );
  NOR2X1 U415 ( .A(n387), .B(n386), .Y(n388) );
  AOI22X1 U416 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(n392) );
  OAI22X1 U417 ( .A(\store[11][3] ), .B(n2), .C(\store[9][3] ), .D(n223), .Y(
        n394) );
  OAI22X1 U418 ( .A(\store[15][3] ), .B(n579), .C(\store[13][3] ), .D(n578), 
        .Y(n393) );
  NOR2X1 U419 ( .A(n394), .B(n393), .Y(n407) );
  NOR2X1 U420 ( .A(\store[8][3] ), .B(n582), .Y(n395) );
  NOR2X1 U421 ( .A(n598), .B(n395), .Y(n396) );
  OAI21X1 U422 ( .A(\store[10][3] ), .B(n584), .C(n396), .Y(n398) );
  OAI22X1 U423 ( .A(\store[14][3] ), .B(n586), .C(\store[12][3] ), .D(n585), 
        .Y(n397) );
  NOR2X1 U424 ( .A(n398), .B(n397), .Y(n406) );
  OAI22X1 U425 ( .A(\store[7][3] ), .B(n579), .C(\store[5][3] ), .D(n578), .Y(
        n399) );
  NOR2X1 U426 ( .A(n400), .B(n399), .Y(n405) );
  NOR2X1 U427 ( .A(N64), .B(n597), .Y(n401) );
  OAI21X1 U428 ( .A(\store[2][3] ), .B(n584), .C(n401), .Y(n403) );
  OAI22X1 U429 ( .A(\store[6][3] ), .B(n586), .C(sample_data[3]), .D(n585), 
        .Y(n402) );
  NOR2X1 U430 ( .A(n403), .B(n402), .Y(n404) );
  AOI22X1 U431 ( .A(n407), .B(n406), .C(n405), .D(n404), .Y(n408) );
  OAI22X1 U432 ( .A(\store[11][2] ), .B(n2), .C(\store[9][2] ), .D(n223), .Y(
        n410) );
  OAI22X1 U433 ( .A(\store[15][2] ), .B(n228), .C(\store[13][2] ), .D(n578), 
        .Y(n409) );
  NOR2X1 U434 ( .A(n410), .B(n409), .Y(n423) );
  NOR2X1 U435 ( .A(\store[8][2] ), .B(n582), .Y(n411) );
  NOR2X1 U436 ( .A(n598), .B(n411), .Y(n412) );
  OAI21X1 U437 ( .A(\store[10][2] ), .B(n584), .C(n412), .Y(n414) );
  OAI22X1 U438 ( .A(\store[14][2] ), .B(n225), .C(\store[12][2] ), .D(n585), 
        .Y(n413) );
  NOR2X1 U439 ( .A(n414), .B(n413), .Y(n422) );
  OAI22X1 U440 ( .A(\store[7][2] ), .B(n228), .C(\store[5][2] ), .D(n226), .Y(
        n415) );
  NOR2X1 U441 ( .A(n416), .B(n415), .Y(n421) );
  NOR2X1 U442 ( .A(N64), .B(n597), .Y(n417) );
  OAI21X1 U443 ( .A(\store[2][2] ), .B(n224), .C(n417), .Y(n419) );
  OAI22X1 U444 ( .A(\store[6][2] ), .B(n225), .C(sample_data[2]), .D(n229), 
        .Y(n418) );
  NOR2X1 U445 ( .A(n419), .B(n418), .Y(n420) );
  AOI22X1 U446 ( .A(n423), .B(n422), .C(n421), .D(n420), .Y(n424) );
  OAI22X1 U447 ( .A(\store[11][1] ), .B(n2), .C(\store[9][1] ), .D(n223), .Y(
        n426) );
  OAI22X1 U448 ( .A(\store[15][1] ), .B(n228), .C(\store[13][1] ), .D(n226), 
        .Y(n425) );
  NOR2X1 U449 ( .A(n426), .B(n425), .Y(n439) );
  NOR2X1 U450 ( .A(\store[8][1] ), .B(n582), .Y(n427) );
  NOR2X1 U451 ( .A(n598), .B(n427), .Y(n428) );
  OAI21X1 U452 ( .A(\store[10][1] ), .B(n224), .C(n428), .Y(n430) );
  OAI22X1 U453 ( .A(\store[14][1] ), .B(n225), .C(\store[12][1] ), .D(n229), 
        .Y(n429) );
  NOR2X1 U454 ( .A(n430), .B(n429), .Y(n438) );
  OAI22X1 U455 ( .A(\store[7][1] ), .B(n228), .C(\store[5][1] ), .D(n226), .Y(
        n431) );
  NOR2X1 U456 ( .A(n432), .B(n431), .Y(n437) );
  NOR2X1 U457 ( .A(N64), .B(n597), .Y(n433) );
  OAI21X1 U458 ( .A(\store[2][1] ), .B(n224), .C(n433), .Y(n435) );
  OAI22X1 U459 ( .A(\store[6][1] ), .B(n225), .C(sample_data[1]), .D(n229), 
        .Y(n434) );
  NOR2X1 U460 ( .A(n435), .B(n434), .Y(n436) );
  AOI22X1 U461 ( .A(n439), .B(n438), .C(n437), .D(n436), .Y(n440) );
  OAI22X1 U462 ( .A(\store[11][0] ), .B(n2), .C(\store[9][0] ), .D(n223), .Y(
        n442) );
  OAI22X1 U463 ( .A(\store[15][0] ), .B(n228), .C(\store[13][0] ), .D(n226), 
        .Y(n441) );
  NOR2X1 U464 ( .A(n442), .B(n441), .Y(n455) );
  NOR2X1 U465 ( .A(\store[8][0] ), .B(n582), .Y(n443) );
  NOR2X1 U466 ( .A(n598), .B(n443), .Y(n444) );
  OAI21X1 U467 ( .A(\store[10][0] ), .B(n224), .C(n444), .Y(n446) );
  OAI22X1 U468 ( .A(\store[14][0] ), .B(n225), .C(\store[12][0] ), .D(n229), 
        .Y(n445) );
  NOR2X1 U469 ( .A(n446), .B(n445), .Y(n454) );
  OAI22X1 U470 ( .A(\store[7][0] ), .B(n228), .C(\store[5][0] ), .D(n226), .Y(
        n447) );
  NOR2X1 U471 ( .A(n448), .B(n447), .Y(n453) );
  NOR2X1 U472 ( .A(N64), .B(n597), .Y(n449) );
  OAI21X1 U473 ( .A(\store[2][0] ), .B(n224), .C(n449), .Y(n451) );
  OAI22X1 U474 ( .A(\store[6][0] ), .B(n225), .C(sample_data[0]), .D(n229), 
        .Y(n450) );
  NOR2X1 U475 ( .A(n451), .B(n450), .Y(n452) );
  AOI22X1 U476 ( .A(n455), .B(n454), .C(n453), .D(n452), .Y(n456) );
  OAI22X1 U477 ( .A(\store[11][15] ), .B(n2), .C(\store[9][15] ), .D(n223), 
        .Y(n458) );
  OAI22X1 U478 ( .A(\store[15][15] ), .B(n228), .C(\store[13][15] ), .D(n226), 
        .Y(n457) );
  NOR2X1 U479 ( .A(n458), .B(n457), .Y(n472) );
  NOR2X1 U480 ( .A(\store[8][15] ), .B(n582), .Y(n459) );
  NOR2X1 U481 ( .A(n598), .B(n459), .Y(n460) );
  OAI21X1 U482 ( .A(\store[10][15] ), .B(n224), .C(n460), .Y(n462) );
  OAI22X1 U483 ( .A(\store[14][15] ), .B(n225), .C(\store[12][15] ), .D(n229), 
        .Y(n461) );
  NOR2X1 U484 ( .A(n462), .B(n461), .Y(n471) );
  OAI22X1 U485 ( .A(\store[7][15] ), .B(n228), .C(\store[5][15] ), .D(n226), 
        .Y(n463) );
  NOR2X1 U486 ( .A(n464), .B(n463), .Y(n470) );
  NOR2X1 U487 ( .A(\store[0][15] ), .B(n582), .Y(n465) );
  NOR2X1 U488 ( .A(N64), .B(n465), .Y(n466) );
  OAI21X1 U489 ( .A(\store[2][15] ), .B(n224), .C(n466), .Y(n468) );
  OAI22X1 U490 ( .A(\store[6][15] ), .B(n225), .C(sample_data[15]), .D(n229), 
        .Y(n467) );
  NOR2X1 U491 ( .A(n468), .B(n467), .Y(n469) );
  AOI22X1 U492 ( .A(n472), .B(n471), .C(n470), .D(n469), .Y(n473) );
  OAI22X1 U493 ( .A(\store[11][14] ), .B(n2), .C(\store[9][14] ), .D(n223), 
        .Y(n475) );
  OAI22X1 U494 ( .A(\store[15][14] ), .B(n228), .C(\store[13][14] ), .D(n226), 
        .Y(n474) );
  NOR2X1 U495 ( .A(n475), .B(n474), .Y(n488) );
  NOR2X1 U496 ( .A(\store[8][14] ), .B(n582), .Y(n476) );
  NOR2X1 U497 ( .A(n598), .B(n476), .Y(n477) );
  OAI21X1 U498 ( .A(\store[10][14] ), .B(n224), .C(n477), .Y(n479) );
  OAI22X1 U499 ( .A(\store[14][14] ), .B(n225), .C(\store[12][14] ), .D(n229), 
        .Y(n478) );
  NOR2X1 U500 ( .A(n479), .B(n478), .Y(n487) );
  OAI22X1 U501 ( .A(\store[7][14] ), .B(n228), .C(\store[5][14] ), .D(n226), 
        .Y(n480) );
  NOR2X1 U502 ( .A(n481), .B(n480), .Y(n486) );
  NOR2X1 U503 ( .A(N64), .B(n597), .Y(n482) );
  OAI21X1 U504 ( .A(\store[2][14] ), .B(n224), .C(n482), .Y(n484) );
  OAI22X1 U505 ( .A(\store[6][14] ), .B(n225), .C(sample_data[14]), .D(n229), 
        .Y(n483) );
  NOR2X1 U506 ( .A(n484), .B(n483), .Y(n485) );
  AOI22X1 U507 ( .A(n488), .B(n487), .C(n486), .D(n485), .Y(n489) );
  OAI22X1 U508 ( .A(\store[11][13] ), .B(n2), .C(\store[9][13] ), .D(n223), 
        .Y(n491) );
  OAI22X1 U509 ( .A(\store[15][13] ), .B(n228), .C(\store[13][13] ), .D(n226), 
        .Y(n490) );
  NOR2X1 U510 ( .A(n491), .B(n490), .Y(n504) );
  NOR2X1 U511 ( .A(\store[8][13] ), .B(n582), .Y(n492) );
  NOR2X1 U512 ( .A(n598), .B(n492), .Y(n493) );
  OAI21X1 U513 ( .A(\store[10][13] ), .B(n224), .C(n493), .Y(n495) );
  OAI22X1 U514 ( .A(\store[14][13] ), .B(n225), .C(\store[12][13] ), .D(n229), 
        .Y(n494) );
  NOR2X1 U515 ( .A(n495), .B(n494), .Y(n503) );
  OAI22X1 U516 ( .A(\store[7][13] ), .B(n228), .C(\store[5][13] ), .D(n226), 
        .Y(n496) );
  NOR2X1 U517 ( .A(n497), .B(n496), .Y(n502) );
  NOR2X1 U518 ( .A(N64), .B(n597), .Y(n498) );
  OAI21X1 U519 ( .A(\store[2][13] ), .B(n224), .C(n498), .Y(n500) );
  OAI22X1 U520 ( .A(\store[6][13] ), .B(n225), .C(sample_data[13]), .D(n229), 
        .Y(n499) );
  NOR2X1 U521 ( .A(n500), .B(n499), .Y(n501) );
  AOI22X1 U522 ( .A(n504), .B(n503), .C(n502), .D(n501), .Y(n505) );
  OAI22X1 U523 ( .A(\store[11][12] ), .B(n2), .C(\store[9][12] ), .D(n223), 
        .Y(n507) );
  OAI22X1 U524 ( .A(\store[15][12] ), .B(n228), .C(\store[13][12] ), .D(n226), 
        .Y(n506) );
  NOR2X1 U525 ( .A(n507), .B(n506), .Y(n520) );
  NOR2X1 U526 ( .A(\store[8][12] ), .B(n582), .Y(n508) );
  NOR2X1 U527 ( .A(n598), .B(n508), .Y(n509) );
  OAI21X1 U528 ( .A(\store[10][12] ), .B(n224), .C(n509), .Y(n511) );
  OAI22X1 U529 ( .A(\store[14][12] ), .B(n225), .C(\store[12][12] ), .D(n229), 
        .Y(n510) );
  NOR2X1 U530 ( .A(n511), .B(n510), .Y(n519) );
  OAI22X1 U531 ( .A(\store[7][12] ), .B(n228), .C(\store[5][12] ), .D(n226), 
        .Y(n512) );
  NOR2X1 U532 ( .A(n513), .B(n512), .Y(n518) );
  NOR2X1 U533 ( .A(N64), .B(n597), .Y(n514) );
  OAI21X1 U534 ( .A(\store[2][12] ), .B(n224), .C(n514), .Y(n516) );
  OAI22X1 U535 ( .A(\store[6][12] ), .B(n225), .C(sample_data[12]), .D(n229), 
        .Y(n515) );
  NOR2X1 U536 ( .A(n516), .B(n515), .Y(n517) );
  AOI22X1 U537 ( .A(n520), .B(n519), .C(n518), .D(n517), .Y(n521) );
  OAI22X1 U538 ( .A(\store[11][11] ), .B(n2), .C(\store[9][11] ), .D(n223), 
        .Y(n523) );
  OAI22X1 U539 ( .A(\store[15][11] ), .B(n228), .C(\store[13][11] ), .D(n226), 
        .Y(n522) );
  NOR2X1 U540 ( .A(n523), .B(n522), .Y(n536) );
  NOR2X1 U541 ( .A(\store[8][11] ), .B(n582), .Y(n524) );
  NOR2X1 U542 ( .A(n598), .B(n524), .Y(n525) );
  OAI21X1 U543 ( .A(\store[10][11] ), .B(n224), .C(n525), .Y(n527) );
  OAI22X1 U544 ( .A(\store[14][11] ), .B(n225), .C(\store[12][11] ), .D(n229), 
        .Y(n526) );
  NOR2X1 U545 ( .A(n527), .B(n526), .Y(n535) );
  OAI22X1 U546 ( .A(\store[7][11] ), .B(n228), .C(\store[5][11] ), .D(n226), 
        .Y(n528) );
  NOR2X1 U547 ( .A(n529), .B(n528), .Y(n534) );
  NOR2X1 U548 ( .A(N64), .B(n597), .Y(n530) );
  OAI21X1 U549 ( .A(\store[2][11] ), .B(n224), .C(n530), .Y(n532) );
  OAI22X1 U550 ( .A(\store[6][11] ), .B(n225), .C(sample_data[11]), .D(n229), 
        .Y(n531) );
  NOR2X1 U551 ( .A(n532), .B(n531), .Y(n533) );
  AOI22X1 U552 ( .A(n536), .B(n535), .C(n534), .D(n533), .Y(n537) );
  OAI22X1 U553 ( .A(\store[11][10] ), .B(n2), .C(\store[9][10] ), .D(n223), 
        .Y(n539) );
  OAI22X1 U554 ( .A(\store[15][10] ), .B(n228), .C(\store[13][10] ), .D(n226), 
        .Y(n538) );
  NOR2X1 U555 ( .A(n539), .B(n538), .Y(n552) );
  NOR2X1 U556 ( .A(\store[8][10] ), .B(n1), .Y(n540) );
  NOR2X1 U557 ( .A(n598), .B(n540), .Y(n541) );
  OAI21X1 U558 ( .A(\store[10][10] ), .B(n224), .C(n541), .Y(n543) );
  OAI22X1 U559 ( .A(\store[14][10] ), .B(n225), .C(\store[12][10] ), .D(n229), 
        .Y(n542) );
  NOR2X1 U560 ( .A(n543), .B(n542), .Y(n551) );
  OAI22X1 U561 ( .A(\store[7][10] ), .B(n228), .C(\store[5][10] ), .D(n226), 
        .Y(n544) );
  NOR2X1 U562 ( .A(n545), .B(n544), .Y(n550) );
  NOR2X1 U563 ( .A(n227), .B(n597), .Y(n546) );
  OAI21X1 U564 ( .A(\store[2][10] ), .B(n224), .C(n546), .Y(n548) );
  OAI22X1 U565 ( .A(\store[6][10] ), .B(n225), .C(sample_data[10]), .D(n229), 
        .Y(n547) );
  NOR2X1 U566 ( .A(n548), .B(n547), .Y(n549) );
  AOI22X1 U567 ( .A(n552), .B(n551), .C(n550), .D(n549), .Y(n553) );
  OAI22X1 U568 ( .A(\store[11][9] ), .B(n2), .C(\store[9][9] ), .D(n223), .Y(
        n555) );
  OAI22X1 U569 ( .A(\store[15][9] ), .B(n228), .C(\store[13][9] ), .D(n226), 
        .Y(n554) );
  NOR2X1 U570 ( .A(n555), .B(n554), .Y(n568) );
  NOR2X1 U571 ( .A(\store[8][9] ), .B(n1), .Y(n556) );
  NOR2X1 U572 ( .A(n598), .B(n556), .Y(n557) );
  OAI21X1 U573 ( .A(\store[10][9] ), .B(n224), .C(n557), .Y(n559) );
  OAI22X1 U574 ( .A(\store[14][9] ), .B(n225), .C(\store[12][9] ), .D(n229), 
        .Y(n558) );
  NOR2X1 U575 ( .A(n559), .B(n558), .Y(n567) );
  OAI22X1 U576 ( .A(\store[7][9] ), .B(n228), .C(\store[5][9] ), .D(n226), .Y(
        n560) );
  NOR2X1 U577 ( .A(n561), .B(n560), .Y(n566) );
  NOR2X1 U578 ( .A(n227), .B(n597), .Y(n562) );
  OAI21X1 U579 ( .A(\store[2][9] ), .B(n224), .C(n562), .Y(n564) );
  OAI22X1 U580 ( .A(\store[6][9] ), .B(n225), .C(sample_data[9]), .D(n229), 
        .Y(n563) );
  NOR2X1 U581 ( .A(n564), .B(n563), .Y(n565) );
  AOI22X1 U582 ( .A(n568), .B(n567), .C(n566), .D(n565), .Y(n569) );
  OAI22X1 U583 ( .A(\store[13][8] ), .B(n226), .C(\store[11][8] ), .D(n2), .Y(
        n571) );
  OAI21X1 U584 ( .A(\store[15][8] ), .B(n579), .C(n227), .Y(n570) );
  NOR2X1 U585 ( .A(n571), .B(n570), .Y(n592) );
  OR2X1 U586 ( .A(\store[8][8] ), .B(n1), .Y(n572) );
  OAI21X1 U587 ( .A(n224), .B(\store[10][8] ), .C(n572), .Y(n573) );
  OAI21X1 U588 ( .A(\store[12][8] ), .B(n229), .C(n596), .Y(n575) );
  OAI22X1 U589 ( .A(\store[9][8] ), .B(n223), .C(\store[14][8] ), .D(n586), 
        .Y(n574) );
  NOR2X1 U590 ( .A(n575), .B(n574), .Y(n591) );
  OAI22X1 U591 ( .A(\store[7][8] ), .B(n228), .C(\store[5][8] ), .D(n226), .Y(
        n580) );
  NOR2X1 U592 ( .A(n581), .B(n580), .Y(n590) );
  NOR2X1 U593 ( .A(n227), .B(n597), .Y(n583) );
  OAI21X1 U594 ( .A(\store[2][8] ), .B(n224), .C(n583), .Y(n588) );
  OAI22X1 U595 ( .A(\store[6][8] ), .B(n225), .C(sample_data[8]), .D(n229), 
        .Y(n587) );
  NOR2X1 U596 ( .A(n588), .B(n587), .Y(n589) );
  AOI22X1 U597 ( .A(n592), .B(n591), .C(n590), .D(n589), .Y(n593) );
  NAND2X1 U598 ( .A(n2), .B(n223), .Y(n581) );
  NAND2X1 U599 ( .A(n2), .B(n223), .Y(n561) );
  NAND2X1 U600 ( .A(n2), .B(n223), .Y(n545) );
  NAND2X1 U601 ( .A(n2), .B(n223), .Y(n529) );
  NAND2X1 U602 ( .A(n2), .B(n223), .Y(n513) );
  NAND2X1 U603 ( .A(n2), .B(n223), .Y(n497) );
  NAND2X1 U604 ( .A(n2), .B(n223), .Y(n481) );
  NAND2X1 U605 ( .A(n2), .B(n223), .Y(n464) );
  NAND2X1 U606 ( .A(n2), .B(n223), .Y(n448) );
  NAND2X1 U607 ( .A(n2), .B(n223), .Y(n432) );
  NAND2X1 U608 ( .A(n2), .B(n223), .Y(n416) );
  NAND2X1 U609 ( .A(n2), .B(n223), .Y(n400) );
  NAND2X1 U610 ( .A(n2), .B(n223), .Y(n384) );
  NAND2X1 U611 ( .A(n2), .B(n223), .Y(n368) );
  NAND2X1 U612 ( .A(n2), .B(n223), .Y(n352) );
  NAND2X1 U613 ( .A(n2), .B(n223), .Y(n335) );
  INVX2 U614 ( .A(N61), .Y(n594) );
  INVX2 U615 ( .A(N62), .Y(n595) );
  INVX2 U616 ( .A(n573), .Y(n596) );
  INVX2 U617 ( .A(n456), .Y(N1064) );
  INVX2 U618 ( .A(n440), .Y(N1063) );
  INVX2 U619 ( .A(n424), .Y(N1062) );
  INVX2 U620 ( .A(n408), .Y(N1061) );
  INVX2 U621 ( .A(n392), .Y(N1060) );
  INVX2 U622 ( .A(n376), .Y(N1059) );
  INVX2 U623 ( .A(n360), .Y(N1058) );
  INVX2 U624 ( .A(n344), .Y(N1057) );
  INVX2 U625 ( .A(n593), .Y(N1048) );
  INVX2 U626 ( .A(n569), .Y(N1047) );
  INVX2 U627 ( .A(n553), .Y(N1046) );
  INVX2 U628 ( .A(n537), .Y(N1045) );
  INVX2 U629 ( .A(n521), .Y(N1044) );
  INVX2 U630 ( .A(n505), .Y(N1043) );
  INVX2 U631 ( .A(n489), .Y(N1042) );
  INVX2 U632 ( .A(n473), .Y(N1041) );
  OR2X1 U633 ( .A(data_ready), .B(n599), .Y(\nstore[0][15] ) );
  OR2X1 U634 ( .A(new_coefficient_set), .B(modwait), .Y(n599) );
  INVX1 U635 ( .A(n600), .Y(n807) );
  MUX2X1 U636 ( .B(sample_data[0]), .A(hwdata[0]), .S(n1040), .Y(n600) );
  INVX1 U637 ( .A(n601), .Y(n806) );
  MUX2X1 U638 ( .B(sample_data[1]), .A(hwdata[1]), .S(n1040), .Y(n601) );
  INVX1 U639 ( .A(n602), .Y(n805) );
  MUX2X1 U640 ( .B(sample_data[2]), .A(hwdata[2]), .S(n1040), .Y(n602) );
  INVX1 U641 ( .A(n603), .Y(n804) );
  MUX2X1 U642 ( .B(sample_data[3]), .A(hwdata[3]), .S(n1040), .Y(n603) );
  INVX1 U643 ( .A(n604), .Y(n803) );
  MUX2X1 U644 ( .B(sample_data[4]), .A(hwdata[4]), .S(n1040), .Y(n604) );
  INVX1 U645 ( .A(n605), .Y(n802) );
  MUX2X1 U646 ( .B(sample_data[5]), .A(hwdata[5]), .S(n1040), .Y(n605) );
  INVX1 U647 ( .A(n606), .Y(n801) );
  MUX2X1 U648 ( .B(sample_data[6]), .A(hwdata[6]), .S(n1040), .Y(n606) );
  INVX1 U649 ( .A(n607), .Y(n800) );
  MUX2X1 U650 ( .B(sample_data[7]), .A(hwdata[7]), .S(n1040), .Y(n607) );
  MUX2X1 U651 ( .B(n608), .A(n609), .S(n610), .Y(n799) );
  INVX1 U652 ( .A(sample_data[8]), .Y(n608) );
  MUX2X1 U653 ( .B(n611), .A(n612), .S(n610), .Y(n798) );
  INVX1 U654 ( .A(sample_data[9]), .Y(n611) );
  MUX2X1 U655 ( .B(n613), .A(n614), .S(n610), .Y(n797) );
  INVX1 U656 ( .A(sample_data[10]), .Y(n613) );
  MUX2X1 U657 ( .B(n615), .A(n808), .S(n610), .Y(n796) );
  INVX1 U658 ( .A(sample_data[11]), .Y(n615) );
  MUX2X1 U659 ( .B(n809), .A(n810), .S(n610), .Y(n795) );
  INVX1 U660 ( .A(sample_data[12]), .Y(n809) );
  MUX2X1 U661 ( .B(n811), .A(n812), .S(n610), .Y(n794) );
  INVX1 U662 ( .A(sample_data[13]), .Y(n811) );
  MUX2X1 U663 ( .B(n813), .A(n814), .S(n610), .Y(n793) );
  INVX1 U664 ( .A(sample_data[14]), .Y(n813) );
  MUX2X1 U665 ( .B(n815), .A(n816), .S(n610), .Y(n792) );
  AND2X1 U666 ( .A(size), .B(n1040), .Y(n610) );
  AND2X1 U667 ( .A(n817), .B(n818), .Y(n1040) );
  INVX1 U668 ( .A(sample_data[15]), .Y(n815) );
  INVX1 U669 ( .A(n819), .Y(n791) );
  MUX2X1 U670 ( .B(\store[5][0] ), .A(hwdata[0]), .S(n820), .Y(n819) );
  INVX1 U671 ( .A(n821), .Y(n790) );
  MUX2X1 U672 ( .B(\store[5][1] ), .A(hwdata[1]), .S(n820), .Y(n821) );
  INVX1 U673 ( .A(n822), .Y(n789) );
  MUX2X1 U674 ( .B(\store[5][2] ), .A(hwdata[2]), .S(n820), .Y(n822) );
  INVX1 U675 ( .A(n823), .Y(n788) );
  MUX2X1 U676 ( .B(\store[5][3] ), .A(hwdata[3]), .S(n820), .Y(n823) );
  INVX1 U677 ( .A(n824), .Y(n787) );
  MUX2X1 U678 ( .B(\store[5][4] ), .A(hwdata[4]), .S(n820), .Y(n824) );
  INVX1 U679 ( .A(n825), .Y(n786) );
  MUX2X1 U680 ( .B(\store[5][5] ), .A(hwdata[5]), .S(n820), .Y(n825) );
  INVX1 U681 ( .A(n826), .Y(n785) );
  MUX2X1 U682 ( .B(\store[5][6] ), .A(hwdata[6]), .S(n820), .Y(n826) );
  INVX1 U683 ( .A(n827), .Y(n784) );
  MUX2X1 U684 ( .B(\store[5][7] ), .A(hwdata[7]), .S(n820), .Y(n827) );
  AND2X1 U685 ( .A(n828), .B(n829), .Y(n820) );
  MUX2X1 U686 ( .B(n830), .A(n609), .S(n831), .Y(n783) );
  INVX1 U687 ( .A(\store[5][8] ), .Y(n830) );
  MUX2X1 U688 ( .B(n832), .A(n612), .S(n831), .Y(n782) );
  INVX1 U689 ( .A(\store[5][9] ), .Y(n832) );
  MUX2X1 U690 ( .B(n833), .A(n614), .S(n831), .Y(n781) );
  INVX1 U691 ( .A(\store[5][10] ), .Y(n833) );
  MUX2X1 U692 ( .B(n834), .A(n808), .S(n831), .Y(n780) );
  INVX1 U693 ( .A(\store[5][11] ), .Y(n834) );
  MUX2X1 U694 ( .B(n835), .A(n810), .S(n831), .Y(n779) );
  INVX1 U695 ( .A(\store[5][12] ), .Y(n835) );
  MUX2X1 U696 ( .B(n836), .A(n812), .S(n831), .Y(n778) );
  INVX1 U697 ( .A(\store[5][13] ), .Y(n836) );
  MUX2X1 U698 ( .B(n837), .A(n814), .S(n831), .Y(n777) );
  INVX1 U699 ( .A(\store[5][14] ), .Y(n837) );
  MUX2X1 U700 ( .B(n838), .A(n816), .S(n831), .Y(n776) );
  AND2X1 U701 ( .A(n839), .B(n828), .Y(n831) );
  INVX1 U702 ( .A(\store[5][15] ), .Y(n838) );
  INVX1 U703 ( .A(n840), .Y(n775) );
  MUX2X1 U704 ( .B(\store[6][0] ), .A(hwdata[0]), .S(n841), .Y(n840) );
  INVX1 U705 ( .A(n842), .Y(n774) );
  MUX2X1 U706 ( .B(\store[6][1] ), .A(hwdata[1]), .S(n841), .Y(n842) );
  INVX1 U707 ( .A(n843), .Y(n773) );
  MUX2X1 U708 ( .B(\store[6][2] ), .A(hwdata[2]), .S(n841), .Y(n843) );
  INVX1 U709 ( .A(n844), .Y(n772) );
  MUX2X1 U710 ( .B(\store[6][3] ), .A(hwdata[3]), .S(n841), .Y(n844) );
  INVX1 U711 ( .A(n845), .Y(n771) );
  MUX2X1 U712 ( .B(\store[6][4] ), .A(hwdata[4]), .S(n841), .Y(n845) );
  INVX1 U713 ( .A(n846), .Y(n770) );
  MUX2X1 U714 ( .B(\store[6][5] ), .A(hwdata[5]), .S(n841), .Y(n846) );
  INVX1 U715 ( .A(n847), .Y(n769) );
  MUX2X1 U716 ( .B(\store[6][6] ), .A(hwdata[6]), .S(n841), .Y(n847) );
  INVX1 U717 ( .A(n848), .Y(n768) );
  MUX2X1 U718 ( .B(\store[6][7] ), .A(hwdata[7]), .S(n841), .Y(n848) );
  AND2X1 U719 ( .A(n829), .B(n849), .Y(n841) );
  MUX2X1 U720 ( .B(n850), .A(n609), .S(n851), .Y(n767) );
  INVX1 U721 ( .A(\store[6][8] ), .Y(n850) );
  MUX2X1 U722 ( .B(n852), .A(n612), .S(n851), .Y(n766) );
  INVX1 U723 ( .A(\store[6][9] ), .Y(n852) );
  MUX2X1 U724 ( .B(n853), .A(n614), .S(n851), .Y(n765) );
  INVX1 U725 ( .A(\store[6][10] ), .Y(n853) );
  MUX2X1 U726 ( .B(n854), .A(n808), .S(n851), .Y(n764) );
  INVX1 U727 ( .A(\store[6][11] ), .Y(n854) );
  MUX2X1 U728 ( .B(n855), .A(n810), .S(n851), .Y(n763) );
  INVX1 U729 ( .A(\store[6][12] ), .Y(n855) );
  MUX2X1 U730 ( .B(n856), .A(n812), .S(n851), .Y(n762) );
  INVX1 U731 ( .A(\store[6][13] ), .Y(n856) );
  MUX2X1 U732 ( .B(n857), .A(n814), .S(n851), .Y(n761) );
  INVX1 U733 ( .A(\store[6][14] ), .Y(n857) );
  MUX2X1 U734 ( .B(n858), .A(n816), .S(n851), .Y(n760) );
  AND2X1 U735 ( .A(n839), .B(n849), .Y(n851) );
  INVX1 U736 ( .A(\store[6][15] ), .Y(n858) );
  INVX1 U737 ( .A(n859), .Y(n759) );
  MUX2X1 U738 ( .B(\store[7][0] ), .A(hwdata[0]), .S(n860), .Y(n859) );
  INVX1 U739 ( .A(n861), .Y(n758) );
  MUX2X1 U740 ( .B(\store[7][1] ), .A(hwdata[1]), .S(n860), .Y(n861) );
  INVX1 U741 ( .A(n862), .Y(n757) );
  MUX2X1 U742 ( .B(\store[7][2] ), .A(hwdata[2]), .S(n860), .Y(n862) );
  INVX1 U743 ( .A(n863), .Y(n756) );
  MUX2X1 U744 ( .B(\store[7][3] ), .A(hwdata[3]), .S(n860), .Y(n863) );
  INVX1 U745 ( .A(n864), .Y(n755) );
  MUX2X1 U746 ( .B(\store[7][4] ), .A(hwdata[4]), .S(n860), .Y(n864) );
  INVX1 U747 ( .A(n865), .Y(n754) );
  MUX2X1 U748 ( .B(\store[7][5] ), .A(hwdata[5]), .S(n860), .Y(n865) );
  INVX1 U749 ( .A(n866), .Y(n753) );
  MUX2X1 U750 ( .B(\store[7][6] ), .A(hwdata[6]), .S(n860), .Y(n866) );
  INVX1 U751 ( .A(n867), .Y(n752) );
  MUX2X1 U752 ( .B(\store[7][7] ), .A(hwdata[7]), .S(n860), .Y(n867) );
  AND2X1 U753 ( .A(n868), .B(n829), .Y(n860) );
  AND2X1 U754 ( .A(n869), .B(n818), .Y(n829) );
  MUX2X1 U755 ( .B(n870), .A(n609), .S(n871), .Y(n751) );
  INVX1 U756 ( .A(\store[7][8] ), .Y(n870) );
  MUX2X1 U757 ( .B(n872), .A(n612), .S(n871), .Y(n750) );
  INVX1 U758 ( .A(\store[7][9] ), .Y(n872) );
  MUX2X1 U759 ( .B(n873), .A(n614), .S(n871), .Y(n749) );
  INVX1 U760 ( .A(\store[7][10] ), .Y(n873) );
  MUX2X1 U761 ( .B(n874), .A(n808), .S(n871), .Y(n748) );
  INVX1 U762 ( .A(\store[7][11] ), .Y(n874) );
  MUX2X1 U763 ( .B(n875), .A(n810), .S(n871), .Y(n747) );
  INVX1 U764 ( .A(\store[7][12] ), .Y(n875) );
  MUX2X1 U765 ( .B(n876), .A(n812), .S(n871), .Y(n746) );
  INVX1 U766 ( .A(\store[7][13] ), .Y(n876) );
  MUX2X1 U767 ( .B(n877), .A(n814), .S(n871), .Y(n745) );
  INVX1 U768 ( .A(\store[7][14] ), .Y(n877) );
  MUX2X1 U769 ( .B(n878), .A(n816), .S(n871), .Y(n744) );
  AND2X1 U770 ( .A(n868), .B(n839), .Y(n871) );
  AND2X1 U771 ( .A(n879), .B(n818), .Y(n839) );
  INVX1 U772 ( .A(\store[7][15] ), .Y(n878) );
  INVX1 U773 ( .A(n880), .Y(n743) );
  MUX2X1 U774 ( .B(\store[8][0] ), .A(hwdata[0]), .S(n881), .Y(n880) );
  INVX1 U775 ( .A(n882), .Y(n742) );
  MUX2X1 U776 ( .B(\store[8][1] ), .A(hwdata[1]), .S(n881), .Y(n882) );
  INVX1 U777 ( .A(n883), .Y(n741) );
  MUX2X1 U778 ( .B(\store[8][2] ), .A(hwdata[2]), .S(n881), .Y(n883) );
  INVX1 U779 ( .A(n884), .Y(n740) );
  MUX2X1 U780 ( .B(\store[8][3] ), .A(hwdata[3]), .S(n881), .Y(n884) );
  INVX1 U781 ( .A(n885), .Y(n739) );
  MUX2X1 U782 ( .B(\store[8][4] ), .A(hwdata[4]), .S(n881), .Y(n885) );
  INVX1 U783 ( .A(n886), .Y(n738) );
  MUX2X1 U784 ( .B(\store[8][5] ), .A(hwdata[5]), .S(n881), .Y(n886) );
  INVX1 U785 ( .A(n887), .Y(n737) );
  MUX2X1 U786 ( .B(\store[8][6] ), .A(hwdata[6]), .S(n881), .Y(n887) );
  INVX1 U787 ( .A(n888), .Y(n736) );
  MUX2X1 U788 ( .B(\store[8][7] ), .A(hwdata[7]), .S(n881), .Y(n888) );
  AND2X1 U789 ( .A(n817), .B(n889), .Y(n881) );
  MUX2X1 U790 ( .B(n890), .A(n609), .S(n891), .Y(n735) );
  INVX1 U791 ( .A(\store[8][8] ), .Y(n890) );
  MUX2X1 U792 ( .B(n892), .A(n612), .S(n891), .Y(n734) );
  INVX1 U793 ( .A(\store[8][9] ), .Y(n892) );
  MUX2X1 U794 ( .B(n893), .A(n614), .S(n891), .Y(n733) );
  INVX1 U795 ( .A(\store[8][10] ), .Y(n893) );
  MUX2X1 U796 ( .B(n894), .A(n808), .S(n891), .Y(n732) );
  INVX1 U797 ( .A(\store[8][11] ), .Y(n894) );
  MUX2X1 U798 ( .B(n895), .A(n810), .S(n891), .Y(n731) );
  INVX1 U799 ( .A(\store[8][12] ), .Y(n895) );
  MUX2X1 U800 ( .B(n896), .A(n812), .S(n891), .Y(n730) );
  INVX1 U801 ( .A(\store[8][13] ), .Y(n896) );
  MUX2X1 U802 ( .B(n897), .A(n814), .S(n891), .Y(n729) );
  INVX1 U803 ( .A(\store[8][14] ), .Y(n897) );
  MUX2X1 U804 ( .B(n898), .A(n816), .S(n891), .Y(n728) );
  AND2X1 U805 ( .A(n899), .B(n900), .Y(n891) );
  INVX1 U806 ( .A(\store[8][15] ), .Y(n898) );
  INVX1 U807 ( .A(n901), .Y(n727) );
  MUX2X1 U808 ( .B(\store[9][0] ), .A(hwdata[0]), .S(n902), .Y(n901) );
  INVX1 U809 ( .A(n903), .Y(n726) );
  MUX2X1 U810 ( .B(\store[9][1] ), .A(hwdata[1]), .S(n902), .Y(n903) );
  INVX1 U811 ( .A(n904), .Y(n725) );
  MUX2X1 U812 ( .B(\store[9][2] ), .A(hwdata[2]), .S(n902), .Y(n904) );
  INVX1 U813 ( .A(n905), .Y(n724) );
  MUX2X1 U814 ( .B(\store[9][3] ), .A(hwdata[3]), .S(n902), .Y(n905) );
  INVX1 U815 ( .A(n906), .Y(n723) );
  MUX2X1 U816 ( .B(\store[9][4] ), .A(hwdata[4]), .S(n902), .Y(n906) );
  INVX1 U817 ( .A(n907), .Y(n722) );
  MUX2X1 U818 ( .B(\store[9][5] ), .A(hwdata[5]), .S(n902), .Y(n907) );
  INVX1 U819 ( .A(n908), .Y(n721) );
  MUX2X1 U820 ( .B(\store[9][6] ), .A(hwdata[6]), .S(n902), .Y(n908) );
  INVX1 U821 ( .A(n909), .Y(n720) );
  MUX2X1 U822 ( .B(\store[9][7] ), .A(hwdata[7]), .S(n902), .Y(n909) );
  AND2X1 U823 ( .A(n910), .B(n828), .Y(n902) );
  MUX2X1 U824 ( .B(n911), .A(n609), .S(n912), .Y(n719) );
  INVX1 U825 ( .A(\store[9][8] ), .Y(n911) );
  MUX2X1 U826 ( .B(n913), .A(n612), .S(n912), .Y(n718) );
  INVX1 U827 ( .A(\store[9][9] ), .Y(n913) );
  MUX2X1 U828 ( .B(n914), .A(n614), .S(n912), .Y(n717) );
  INVX1 U829 ( .A(\store[9][10] ), .Y(n914) );
  MUX2X1 U830 ( .B(n915), .A(n808), .S(n912), .Y(n716) );
  INVX1 U831 ( .A(\store[9][11] ), .Y(n915) );
  MUX2X1 U832 ( .B(n916), .A(n810), .S(n912), .Y(n715) );
  INVX1 U833 ( .A(\store[9][12] ), .Y(n916) );
  MUX2X1 U834 ( .B(n917), .A(n812), .S(n912), .Y(n714) );
  INVX1 U835 ( .A(\store[9][13] ), .Y(n917) );
  MUX2X1 U836 ( .B(n918), .A(n814), .S(n912), .Y(n713) );
  INVX1 U837 ( .A(\store[9][14] ), .Y(n918) );
  MUX2X1 U838 ( .B(n919), .A(n816), .S(n912), .Y(n712) );
  AND2X1 U839 ( .A(n899), .B(n828), .Y(n912) );
  INVX1 U840 ( .A(\store[9][15] ), .Y(n919) );
  INVX1 U841 ( .A(n920), .Y(n711) );
  MUX2X1 U842 ( .B(\store[10][0] ), .A(hwdata[0]), .S(n921), .Y(n920) );
  INVX1 U843 ( .A(n922), .Y(n710) );
  MUX2X1 U844 ( .B(\store[10][1] ), .A(hwdata[1]), .S(n921), .Y(n922) );
  INVX1 U845 ( .A(n923), .Y(n709) );
  MUX2X1 U846 ( .B(\store[10][2] ), .A(hwdata[2]), .S(n921), .Y(n923) );
  INVX1 U847 ( .A(n924), .Y(n708) );
  MUX2X1 U848 ( .B(\store[10][3] ), .A(hwdata[3]), .S(n921), .Y(n924) );
  INVX1 U849 ( .A(n925), .Y(n707) );
  MUX2X1 U850 ( .B(\store[10][4] ), .A(hwdata[4]), .S(n921), .Y(n925) );
  INVX1 U851 ( .A(n926), .Y(n706) );
  MUX2X1 U852 ( .B(\store[10][5] ), .A(hwdata[5]), .S(n921), .Y(n926) );
  INVX1 U853 ( .A(n927), .Y(n705) );
  MUX2X1 U854 ( .B(\store[10][6] ), .A(hwdata[6]), .S(n921), .Y(n927) );
  INVX1 U855 ( .A(n928), .Y(n704) );
  MUX2X1 U856 ( .B(\store[10][7] ), .A(hwdata[7]), .S(n921), .Y(n928) );
  AND2X1 U857 ( .A(n910), .B(n849), .Y(n921) );
  MUX2X1 U858 ( .B(n929), .A(n609), .S(n930), .Y(n703) );
  INVX1 U859 ( .A(\store[10][8] ), .Y(n929) );
  MUX2X1 U860 ( .B(n931), .A(n612), .S(n930), .Y(n702) );
  INVX1 U861 ( .A(\store[10][9] ), .Y(n931) );
  MUX2X1 U862 ( .B(n932), .A(n614), .S(n930), .Y(n701) );
  INVX1 U863 ( .A(\store[10][10] ), .Y(n932) );
  MUX2X1 U864 ( .B(n933), .A(n808), .S(n930), .Y(n700) );
  INVX1 U865 ( .A(\store[10][11] ), .Y(n933) );
  MUX2X1 U866 ( .B(n934), .A(n810), .S(n930), .Y(n699) );
  INVX1 U867 ( .A(\store[10][12] ), .Y(n934) );
  MUX2X1 U868 ( .B(n935), .A(n812), .S(n930), .Y(n698) );
  INVX1 U869 ( .A(\store[10][13] ), .Y(n935) );
  MUX2X1 U870 ( .B(n936), .A(n814), .S(n930), .Y(n697) );
  INVX1 U871 ( .A(\store[10][14] ), .Y(n936) );
  MUX2X1 U872 ( .B(n937), .A(n816), .S(n930), .Y(n696) );
  AND2X1 U873 ( .A(n899), .B(n849), .Y(n930) );
  INVX1 U874 ( .A(\store[10][15] ), .Y(n937) );
  INVX1 U875 ( .A(n938), .Y(n695) );
  MUX2X1 U876 ( .B(\store[11][0] ), .A(hwdata[0]), .S(n939), .Y(n938) );
  INVX1 U877 ( .A(n940), .Y(n694) );
  MUX2X1 U878 ( .B(\store[11][1] ), .A(hwdata[1]), .S(n939), .Y(n940) );
  INVX1 U879 ( .A(n941), .Y(n693) );
  MUX2X1 U880 ( .B(\store[11][2] ), .A(hwdata[2]), .S(n939), .Y(n941) );
  INVX1 U881 ( .A(n942), .Y(n692) );
  MUX2X1 U882 ( .B(\store[11][3] ), .A(hwdata[3]), .S(n939), .Y(n942) );
  INVX1 U883 ( .A(n943), .Y(n691) );
  MUX2X1 U884 ( .B(\store[11][4] ), .A(hwdata[4]), .S(n939), .Y(n943) );
  INVX1 U885 ( .A(n944), .Y(n690) );
  MUX2X1 U886 ( .B(\store[11][5] ), .A(hwdata[5]), .S(n939), .Y(n944) );
  INVX1 U887 ( .A(n945), .Y(n689) );
  MUX2X1 U888 ( .B(\store[11][6] ), .A(hwdata[6]), .S(n939), .Y(n945) );
  INVX1 U889 ( .A(n946), .Y(n688) );
  MUX2X1 U890 ( .B(\store[11][7] ), .A(hwdata[7]), .S(n939), .Y(n946) );
  AND2X1 U891 ( .A(n910), .B(n868), .Y(n939) );
  AND2X1 U892 ( .A(n869), .B(n889), .Y(n910) );
  MUX2X1 U893 ( .B(n947), .A(n609), .S(n948), .Y(n687) );
  INVX1 U894 ( .A(\store[11][8] ), .Y(n947) );
  MUX2X1 U895 ( .B(n949), .A(n612), .S(n948), .Y(n686) );
  INVX1 U896 ( .A(\store[11][9] ), .Y(n949) );
  MUX2X1 U897 ( .B(n950), .A(n614), .S(n948), .Y(n685) );
  INVX1 U898 ( .A(\store[11][10] ), .Y(n950) );
  MUX2X1 U899 ( .B(n951), .A(n808), .S(n948), .Y(n684) );
  INVX1 U900 ( .A(\store[11][11] ), .Y(n951) );
  MUX2X1 U901 ( .B(n952), .A(n810), .S(n948), .Y(n683) );
  INVX1 U902 ( .A(\store[11][12] ), .Y(n952) );
  MUX2X1 U903 ( .B(n953), .A(n812), .S(n948), .Y(n682) );
  INVX1 U904 ( .A(\store[11][13] ), .Y(n953) );
  MUX2X1 U905 ( .B(n954), .A(n814), .S(n948), .Y(n681) );
  INVX1 U906 ( .A(\store[11][14] ), .Y(n954) );
  MUX2X1 U907 ( .B(n955), .A(n816), .S(n948), .Y(n680) );
  AND2X1 U908 ( .A(n899), .B(n868), .Y(n948) );
  AND2X1 U909 ( .A(n879), .B(n889), .Y(n899) );
  INVX1 U910 ( .A(\store[11][15] ), .Y(n955) );
  INVX1 U911 ( .A(n956), .Y(n679) );
  MUX2X1 U912 ( .B(\store[12][0] ), .A(hwdata[0]), .S(n957), .Y(n956) );
  INVX1 U913 ( .A(n958), .Y(n678) );
  MUX2X1 U914 ( .B(\store[12][1] ), .A(hwdata[1]), .S(n957), .Y(n958) );
  INVX1 U915 ( .A(n959), .Y(n677) );
  MUX2X1 U916 ( .B(\store[12][2] ), .A(hwdata[2]), .S(n957), .Y(n959) );
  INVX1 U917 ( .A(n960), .Y(n676) );
  MUX2X1 U918 ( .B(\store[12][3] ), .A(hwdata[3]), .S(n957), .Y(n960) );
  INVX1 U919 ( .A(n961), .Y(n675) );
  MUX2X1 U920 ( .B(\store[12][4] ), .A(hwdata[4]), .S(n957), .Y(n961) );
  INVX1 U921 ( .A(n962), .Y(n674) );
  MUX2X1 U922 ( .B(\store[12][5] ), .A(hwdata[5]), .S(n957), .Y(n962) );
  INVX1 U923 ( .A(n963), .Y(n673) );
  MUX2X1 U924 ( .B(\store[12][6] ), .A(hwdata[6]), .S(n957), .Y(n963) );
  INVX1 U925 ( .A(n964), .Y(n672) );
  MUX2X1 U926 ( .B(\store[12][7] ), .A(hwdata[7]), .S(n957), .Y(n964) );
  AND2X1 U927 ( .A(n965), .B(n817), .Y(n957) );
  AND2X1 U928 ( .A(n869), .B(n900), .Y(n817) );
  MUX2X1 U929 ( .B(n966), .A(n609), .S(n967), .Y(n671) );
  INVX1 U930 ( .A(\store[12][8] ), .Y(n966) );
  MUX2X1 U931 ( .B(n968), .A(n612), .S(n967), .Y(n670) );
  INVX1 U932 ( .A(\store[12][9] ), .Y(n968) );
  MUX2X1 U933 ( .B(n969), .A(n614), .S(n967), .Y(n669) );
  INVX1 U934 ( .A(\store[12][10] ), .Y(n969) );
  MUX2X1 U935 ( .B(n970), .A(n808), .S(n967), .Y(n668) );
  INVX1 U936 ( .A(\store[12][11] ), .Y(n970) );
  MUX2X1 U937 ( .B(n971), .A(n810), .S(n967), .Y(n667) );
  INVX1 U938 ( .A(\store[12][12] ), .Y(n971) );
  MUX2X1 U939 ( .B(n972), .A(n812), .S(n967), .Y(n666) );
  INVX1 U940 ( .A(\store[12][13] ), .Y(n972) );
  MUX2X1 U941 ( .B(n973), .A(n814), .S(n967), .Y(n665) );
  INVX1 U942 ( .A(\store[12][14] ), .Y(n973) );
  MUX2X1 U943 ( .B(n974), .A(n816), .S(n967), .Y(n664) );
  AND2X1 U944 ( .A(n975), .B(n900), .Y(n967) );
  NOR2X1 U945 ( .A(N62), .B(N61), .Y(n900) );
  INVX1 U946 ( .A(\store[12][15] ), .Y(n974) );
  INVX1 U947 ( .A(n976), .Y(n663) );
  MUX2X1 U948 ( .B(\store[13][0] ), .A(hwdata[0]), .S(n977), .Y(n976) );
  INVX1 U949 ( .A(n978), .Y(n662) );
  MUX2X1 U950 ( .B(\store[13][1] ), .A(hwdata[1]), .S(n977), .Y(n978) );
  INVX1 U951 ( .A(n979), .Y(n661) );
  MUX2X1 U952 ( .B(\store[13][2] ), .A(hwdata[2]), .S(n977), .Y(n979) );
  INVX1 U953 ( .A(n980), .Y(n660) );
  MUX2X1 U954 ( .B(\store[13][3] ), .A(hwdata[3]), .S(n977), .Y(n980) );
  INVX1 U955 ( .A(n981), .Y(n659) );
  MUX2X1 U956 ( .B(\store[13][4] ), .A(hwdata[4]), .S(n977), .Y(n981) );
  INVX1 U957 ( .A(n982), .Y(n658) );
  MUX2X1 U958 ( .B(\store[13][5] ), .A(hwdata[5]), .S(n977), .Y(n982) );
  INVX1 U959 ( .A(n983), .Y(n657) );
  MUX2X1 U960 ( .B(\store[13][6] ), .A(hwdata[6]), .S(n977), .Y(n983) );
  INVX1 U961 ( .A(n984), .Y(n656) );
  MUX2X1 U962 ( .B(\store[13][7] ), .A(hwdata[7]), .S(n977), .Y(n984) );
  AND2X1 U963 ( .A(n828), .B(n985), .Y(n977) );
  MUX2X1 U964 ( .B(n986), .A(n609), .S(n987), .Y(n655) );
  INVX1 U965 ( .A(\store[13][8] ), .Y(n986) );
  MUX2X1 U966 ( .B(n988), .A(n612), .S(n987), .Y(n654) );
  INVX1 U967 ( .A(\store[13][9] ), .Y(n988) );
  MUX2X1 U968 ( .B(n989), .A(n614), .S(n987), .Y(n653) );
  INVX1 U969 ( .A(\store[13][10] ), .Y(n989) );
  MUX2X1 U970 ( .B(n990), .A(n808), .S(n987), .Y(n652) );
  INVX1 U971 ( .A(\store[13][11] ), .Y(n990) );
  MUX2X1 U972 ( .B(n991), .A(n810), .S(n987), .Y(n651) );
  INVX1 U973 ( .A(\store[13][12] ), .Y(n991) );
  MUX2X1 U974 ( .B(n992), .A(n812), .S(n987), .Y(n650) );
  INVX1 U975 ( .A(\store[13][13] ), .Y(n992) );
  MUX2X1 U976 ( .B(n993), .A(n814), .S(n987), .Y(n649) );
  INVX1 U977 ( .A(\store[13][14] ), .Y(n993) );
  MUX2X1 U978 ( .B(n994), .A(n816), .S(n987), .Y(n648) );
  AND2X1 U979 ( .A(n975), .B(n828), .Y(n987) );
  AND2X1 U980 ( .A(N61), .B(n595), .Y(n828) );
  INVX1 U981 ( .A(\store[13][15] ), .Y(n994) );
  INVX1 U982 ( .A(n995), .Y(n647) );
  MUX2X1 U983 ( .B(\store[14][0] ), .A(hwdata[0]), .S(n1041), .Y(n995) );
  INVX1 U984 ( .A(n996), .Y(n646) );
  MUX2X1 U985 ( .B(\store[14][1] ), .A(hwdata[1]), .S(n1041), .Y(n996) );
  INVX1 U986 ( .A(n997), .Y(n645) );
  MUX2X1 U987 ( .B(\store[14][2] ), .A(hwdata[2]), .S(n1041), .Y(n997) );
  INVX1 U988 ( .A(n998), .Y(n644) );
  MUX2X1 U989 ( .B(\store[14][3] ), .A(hwdata[3]), .S(n1041), .Y(n998) );
  INVX1 U990 ( .A(n999), .Y(n643) );
  MUX2X1 U991 ( .B(\store[14][4] ), .A(hwdata[4]), .S(n1041), .Y(n999) );
  INVX1 U992 ( .A(n1000), .Y(n642) );
  MUX2X1 U993 ( .B(\store[14][5] ), .A(hwdata[5]), .S(n1041), .Y(n1000) );
  INVX1 U994 ( .A(n1001), .Y(n641) );
  MUX2X1 U995 ( .B(\store[14][6] ), .A(hwdata[6]), .S(n1041), .Y(n1001) );
  INVX1 U996 ( .A(n1002), .Y(n640) );
  MUX2X1 U997 ( .B(\store[14][7] ), .A(hwdata[7]), .S(n1041), .Y(n1002) );
  OAI21X1 U998 ( .A(n609), .B(n1003), .C(n1004), .Y(n639) );
  NAND2X1 U999 ( .A(\store[14][8] ), .B(n1005), .Y(n1004) );
  OAI21X1 U1000 ( .A(n612), .B(n1003), .C(n1006), .Y(n638) );
  NAND2X1 U1001 ( .A(\store[14][9] ), .B(n1005), .Y(n1006) );
  OAI21X1 U1002 ( .A(n614), .B(n1003), .C(n1007), .Y(n637) );
  NAND2X1 U1003 ( .A(\store[14][10] ), .B(n1005), .Y(n1007) );
  OAI21X1 U1004 ( .A(n808), .B(n1003), .C(n1008), .Y(n636) );
  NAND2X1 U1005 ( .A(\store[14][11] ), .B(n1005), .Y(n1008) );
  OAI21X1 U1006 ( .A(n810), .B(n1003), .C(n1009), .Y(n635) );
  NAND2X1 U1007 ( .A(\store[14][12] ), .B(n1005), .Y(n1009) );
  OAI21X1 U1008 ( .A(n812), .B(n1003), .C(n1010), .Y(n634) );
  NAND2X1 U1009 ( .A(\store[14][13] ), .B(n1005), .Y(n1010) );
  OAI21X1 U1010 ( .A(n814), .B(n1003), .C(n1011), .Y(n633) );
  NAND2X1 U1011 ( .A(\store[14][14] ), .B(n1005), .Y(n1011) );
  OAI21X1 U1012 ( .A(n816), .B(n1003), .C(n1012), .Y(n632) );
  NAND2X1 U1013 ( .A(\store[14][15] ), .B(n1005), .Y(n1012) );
  NAND2X1 U1014 ( .A(n975), .B(n849), .Y(n1005) );
  NAND2X1 U1015 ( .A(n1041), .B(size), .Y(n1003) );
  AND2X1 U1016 ( .A(n849), .B(n985), .Y(n1041) );
  NOR2X1 U1017 ( .A(n595), .B(N61), .Y(n849) );
  INVX1 U1018 ( .A(n1013), .Y(n631) );
  MUX2X1 U1019 ( .B(\store[15][0] ), .A(hwdata[0]), .S(n1014), .Y(n1013) );
  INVX1 U1020 ( .A(n1015), .Y(n630) );
  MUX2X1 U1021 ( .B(\store[15][1] ), .A(hwdata[1]), .S(n1014), .Y(n1015) );
  INVX1 U1022 ( .A(n1016), .Y(n629) );
  MUX2X1 U1023 ( .B(\store[15][2] ), .A(hwdata[2]), .S(n1014), .Y(n1016) );
  INVX1 U1024 ( .A(n1017), .Y(n628) );
  MUX2X1 U1025 ( .B(\store[15][3] ), .A(hwdata[3]), .S(n1014), .Y(n1017) );
  INVX1 U1026 ( .A(n1018), .Y(n627) );
  MUX2X1 U1027 ( .B(\store[15][4] ), .A(hwdata[4]), .S(n1014), .Y(n1018) );
  INVX1 U1028 ( .A(n1019), .Y(n626) );
  MUX2X1 U1029 ( .B(\store[15][5] ), .A(hwdata[5]), .S(n1014), .Y(n1019) );
  INVX1 U1030 ( .A(n1020), .Y(n625) );
  MUX2X1 U1031 ( .B(\store[15][6] ), .A(hwdata[6]), .S(n1014), .Y(n1020) );
  INVX1 U1032 ( .A(n1021), .Y(n624) );
  MUX2X1 U1033 ( .B(\store[15][7] ), .A(hwdata[7]), .S(n1014), .Y(n1021) );
  AND2X1 U1034 ( .A(n868), .B(n985), .Y(n1014) );
  AND2X1 U1035 ( .A(n965), .B(n869), .Y(n985) );
  MUX2X1 U1036 ( .B(n1022), .A(n609), .S(n1023), .Y(n623) );
  INVX1 U1037 ( .A(hwdata[8]), .Y(n609) );
  INVX1 U1038 ( .A(\store[15][8] ), .Y(n1022) );
  MUX2X1 U1039 ( .B(n1024), .A(n612), .S(n1023), .Y(n622) );
  INVX1 U1040 ( .A(hwdata[9]), .Y(n612) );
  INVX1 U1041 ( .A(\store[15][9] ), .Y(n1024) );
  MUX2X1 U1042 ( .B(n1025), .A(n614), .S(n1023), .Y(n621) );
  INVX1 U1043 ( .A(hwdata[10]), .Y(n614) );
  INVX1 U1044 ( .A(\store[15][10] ), .Y(n1025) );
  MUX2X1 U1045 ( .B(n1026), .A(n808), .S(n1023), .Y(n620) );
  INVX1 U1046 ( .A(hwdata[11]), .Y(n808) );
  INVX1 U1047 ( .A(\store[15][11] ), .Y(n1026) );
  MUX2X1 U1048 ( .B(n1027), .A(n810), .S(n1023), .Y(n619) );
  INVX1 U1049 ( .A(hwdata[12]), .Y(n810) );
  INVX1 U1050 ( .A(\store[15][12] ), .Y(n1027) );
  MUX2X1 U1051 ( .B(n1028), .A(n812), .S(n1023), .Y(n618) );
  INVX1 U1052 ( .A(hwdata[13]), .Y(n812) );
  INVX1 U1053 ( .A(\store[15][13] ), .Y(n1028) );
  MUX2X1 U1054 ( .B(n1029), .A(n814), .S(n1023), .Y(n617) );
  INVX1 U1055 ( .A(hwdata[14]), .Y(n814) );
  INVX1 U1056 ( .A(\store[15][14] ), .Y(n1029) );
  MUX2X1 U1057 ( .B(n1030), .A(n816), .S(n1023), .Y(n616) );
  AND2X1 U1058 ( .A(n975), .B(n868), .Y(n1023) );
  AND2X1 U1059 ( .A(N61), .B(N62), .Y(n868) );
  AND2X1 U1060 ( .A(n879), .B(n965), .Y(n975) );
  NOR2X1 U1061 ( .A(n818), .B(n889), .Y(n965) );
  INVX1 U1062 ( .A(N63), .Y(n889) );
  INVX1 U1063 ( .A(N64), .Y(n818) );
  AND2X1 U1064 ( .A(size), .B(n869), .Y(n879) );
  AND2X1 U1065 ( .A(n1031), .B(write), .Y(n869) );
  INVX1 U1066 ( .A(hwdata[15]), .Y(n816) );
  INVX1 U1067 ( .A(\store[15][15] ), .Y(n1030) );
  NOR2X1 U1068 ( .A(n1032), .B(n1033), .Y(hresp) );
  AND2X1 U1069 ( .A(N1047), .B(n1034), .Y(hrdata[9]) );
  AND2X1 U1070 ( .A(N1048), .B(n1034), .Y(hrdata[8]) );
  AND2X1 U1071 ( .A(N1057), .B(n1031), .Y(hrdata[7]) );
  AND2X1 U1072 ( .A(N1058), .B(n1031), .Y(hrdata[6]) );
  AND2X1 U1073 ( .A(N1059), .B(n1031), .Y(hrdata[5]) );
  AND2X1 U1074 ( .A(N1060), .B(n1031), .Y(hrdata[4]) );
  AND2X1 U1075 ( .A(N1061), .B(n1031), .Y(hrdata[3]) );
  AND2X1 U1076 ( .A(N1062), .B(n1031), .Y(hrdata[2]) );
  AND2X1 U1077 ( .A(N1063), .B(n1031), .Y(hrdata[1]) );
  AND2X1 U1078 ( .A(N1041), .B(n1034), .Y(hrdata[15]) );
  AND2X1 U1079 ( .A(N1042), .B(n1034), .Y(hrdata[14]) );
  AND2X1 U1080 ( .A(N1043), .B(n1034), .Y(hrdata[13]) );
  AND2X1 U1081 ( .A(N1044), .B(n1034), .Y(hrdata[12]) );
  AND2X1 U1082 ( .A(N1045), .B(n1034), .Y(hrdata[11]) );
  AND2X1 U1083 ( .A(N1046), .B(n1034), .Y(hrdata[10]) );
  AND2X1 U1084 ( .A(size), .B(n1031), .Y(n1034) );
  AND2X1 U1085 ( .A(N1064), .B(n1031), .Y(hrdata[0]) );
  NOR2X1 U1086 ( .A(n1035), .B(n1033), .Y(n1031) );
  NAND3X1 U1087 ( .A(hsel), .B(n1036), .C(trans[1]), .Y(n1033) );
  INVX1 U1088 ( .A(trans[0]), .Y(n1036) );
  INVX1 U1089 ( .A(n1032), .Y(n1035) );
  AOI21X1 U1090 ( .A(write), .B(n1037), .C(haddr[0]), .Y(n1032) );
  NOR2X1 U1091 ( .A(N63), .B(N64), .Y(n1037) );
  OAI21X1 U1092 ( .A(n1039), .B(n1038), .C(N60), .Y(N59) );
  NAND2X1 U1093 ( .A(n1038), .B(n1039), .Y(N60) );
  INVX1 U1094 ( .A(coefficient_num[1]), .Y(n1038) );
  INVX1 U1095 ( .A(coefficient_num[0]), .Y(n1039) );
endmodule


module coefficient_loader ( clk, n_rst, new_coefficient_set, modwait, 
        load_coeff, coefficient_num );
  output [1:0] coefficient_num;
  input clk, n_rst, new_coefficient_set, modwait;
  output load_coeff;
  wire   s, n15, n16, n17, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  DFFSR \coefficient_num_reg[0]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(coefficient_num[0]) );
  DFFSR \coefficient_num_reg[1]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(coefficient_num[1]) );
  DFFSR s_reg ( .D(n15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s) );
  NOR2X1 U6 ( .A(n4), .B(n5), .Y(n17) );
  XNOR2X1 U7 ( .A(n6), .B(coefficient_num[0]), .Y(n5) );
  NOR2X1 U8 ( .A(n7), .B(n4), .Y(n16) );
  XNOR2X1 U9 ( .A(coefficient_num[1]), .B(n8), .Y(n7) );
  MUX2X1 U10 ( .B(n9), .A(n10), .S(n4), .Y(n15) );
  INVX1 U11 ( .A(new_coefficient_set), .Y(n10) );
  AND2X1 U12 ( .A(coefficient_num[1]), .B(n8), .Y(n9) );
  NOR2X1 U13 ( .A(n11), .B(modwait), .Y(n8) );
  NOR2X1 U14 ( .A(n4), .B(n12), .Y(load_coeff) );
  OAI21X1 U15 ( .A(n11), .B(n13), .C(n6), .Y(n12) );
  INVX1 U16 ( .A(modwait), .Y(n6) );
  INVX1 U17 ( .A(coefficient_num[1]), .Y(n13) );
  INVX1 U18 ( .A(coefficient_num[0]), .Y(n11) );
  INVX1 U19 ( .A(s), .Y(n4) );
endmodule


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n82, n63, n110, n111, n112, n113, n114, n115, n117, n1, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77;
  wire   [3:0] s;
  wire   [1:0] i;
  wire   [1:0] d;
  wire   [1:0] j;

  DFFSR \d_reg[0]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d[0]) );
  DFFSR \s_reg[1]  ( .D(n115), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1]) );
  DFFSR \s_reg[2]  ( .D(n114), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2]) );
  DFFSR \s_reg[0]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0]) );
  DFFSR \j_reg[0]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), .Q(j[0]) );
  DFFSR \j_reg[1]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(j[1]) );
  DFFSR \d_reg[1]  ( .D(n117), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d[1]) );
  DFFSR \i_reg[0]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), .Q(i[0]) );
  DFFSR \i_reg[1]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(i[1]) );
  INVX1 U12 ( .A(n82), .Y(n1) );
  INVX2 U13 ( .A(n1), .Y(src2[3]) );
  INVX2 U14 ( .A(n19), .Y(src1[3]) );
  OAI21X1 U15 ( .A(n4), .B(n5), .C(n6), .Y(n82) );
  NOR2X1 U16 ( .A(n7), .B(n4), .Y(src2[2]) );
  NAND2X1 U17 ( .A(n8), .B(n6), .Y(src2[1]) );
  MUX2X1 U18 ( .B(src2[0]), .A(n9), .S(n10), .Y(n8) );
  NOR2X1 U19 ( .A(n11), .B(n4), .Y(n9) );
  NOR2X1 U20 ( .A(n12), .B(n4), .Y(src2[0]) );
  OAI21X1 U21 ( .A(n4), .B(n13), .C(n14), .Y(src1[2]) );
  NAND2X1 U22 ( .A(n15), .B(n16), .Y(n13) );
  OAI21X1 U23 ( .A(n4), .B(n17), .C(n14), .Y(src1[1]) );
  OR2X1 U24 ( .A(n18), .B(d[1]), .Y(n14) );
  OAI21X1 U25 ( .A(n4), .B(n15), .C(n19), .Y(src1[0]) );
  INVX1 U26 ( .A(n63), .Y(n19) );
  NAND3X1 U27 ( .A(n4), .B(n29), .C(n30), .Y(op[1]) );
  NAND3X1 U28 ( .A(n31), .B(n32), .C(n30), .Y(op[0]) );
  OR2X1 U29 ( .A(n33), .B(n34), .Y(n76) );
  OAI21X1 U30 ( .A(lc), .B(n35), .C(n36), .Y(n34) );
  AOI22X1 U31 ( .A(dr), .B(n37), .C(overflow), .D(n63), .Y(n36) );
  NAND3X1 U32 ( .A(n38), .B(n4), .C(n39), .Y(n33) );
  OAI21X1 U33 ( .A(n40), .B(n41), .C(n18), .Y(n77) );
  INVX1 U34 ( .A(n35), .Y(err) );
  NAND2X1 U35 ( .A(s[0]), .B(n37), .Y(n35) );
  MUX2X1 U36 ( .B(n31), .A(n42), .S(d[1]), .Y(n117) );
  AND2X1 U37 ( .A(n18), .B(n40), .Y(n42) );
  INVX1 U38 ( .A(n43), .Y(n40) );
  OAI21X1 U39 ( .A(n63), .B(n44), .C(n38), .Y(n43) );
  NAND2X1 U40 ( .A(n45), .B(n41), .Y(n18) );
  NAND3X1 U41 ( .A(n46), .B(n39), .C(n47), .Y(n115) );
  OAI21X1 U42 ( .A(dr), .B(lc), .C(n37), .Y(n47) );
  NAND3X1 U43 ( .A(d[1]), .B(n48), .C(n49), .Y(n46) );
  INVX1 U44 ( .A(n31), .Y(n49) );
  NAND2X1 U45 ( .A(n45), .B(d[0]), .Y(n31) );
  INVX1 U46 ( .A(overflow), .Y(n48) );
  OAI21X1 U47 ( .A(overflow), .B(n50), .C(n51), .Y(n114) );
  AND2X1 U48 ( .A(n29), .B(n39), .Y(n51) );
  NAND3X1 U49 ( .A(n52), .B(n4), .C(n53), .Y(n39) );
  NOR2X1 U50 ( .A(clear), .B(n44), .Y(n53) );
  NOR2X1 U51 ( .A(n63), .B(n37), .Y(n52) );
  INVX1 U52 ( .A(modwait), .Y(n37) );
  NAND2X1 U53 ( .A(n54), .B(n55), .Y(modwait) );
  NAND2X1 U54 ( .A(n6), .B(n32), .Y(n63) );
  NAND3X1 U55 ( .A(s[1]), .B(n56), .C(s[2]), .Y(n32) );
  XOR2X1 U56 ( .A(j[0]), .B(clear), .Y(n113) );
  XOR2X1 U57 ( .A(j[1]), .B(n57), .Y(n112) );
  XOR2X1 U58 ( .A(i[0]), .B(n58), .Y(n111) );
  XOR2X1 U59 ( .A(n59), .B(n60), .Y(n110) );
  NAND2X1 U60 ( .A(n58), .B(n61), .Y(n60) );
  INVX1 U61 ( .A(i[0]), .Y(n61) );
  AND2X1 U62 ( .A(n44), .B(n38), .Y(n58) );
  OR2X1 U63 ( .A(n62), .B(dr), .Y(n38) );
  NAND2X1 U64 ( .A(n5), .B(n50), .Y(dest[3]) );
  INVX1 U65 ( .A(op[2]), .Y(n50) );
  NAND2X1 U66 ( .A(n4), .B(n6), .Y(op[2]) );
  OAI21X1 U67 ( .A(n7), .B(n30), .C(n64), .Y(dest[2]) );
  NAND3X1 U68 ( .A(n15), .B(n16), .C(cnt_up), .Y(n64) );
  INVX1 U69 ( .A(n5), .Y(n7) );
  NAND2X1 U70 ( .A(n65), .B(n12), .Y(n5) );
  OR2X1 U71 ( .A(n66), .B(n67), .Y(dest[1]) );
  OAI21X1 U72 ( .A(n29), .B(n17), .C(n4), .Y(n67) );
  XNOR2X1 U73 ( .A(n15), .B(n16), .Y(n17) );
  OAI22X1 U74 ( .A(n59), .B(n29), .C(n4), .D(n68), .Y(n16) );
  XOR2X1 U75 ( .A(n69), .B(n70), .Y(n68) );
  XOR2X1 U76 ( .A(i[1]), .B(d[1]), .Y(n70) );
  NOR2X1 U77 ( .A(d[0]), .B(i[0]), .Y(n69) );
  INVX1 U78 ( .A(i[1]), .Y(n59) );
  INVX1 U79 ( .A(n71), .Y(n15) );
  XOR2X1 U80 ( .A(n12), .B(n65), .Y(n66) );
  INVX1 U81 ( .A(n10), .Y(n65) );
  AOI22X1 U82 ( .A(clear), .B(j[1]), .C(n72), .D(d[1]), .Y(n10) );
  OAI21X1 U83 ( .A(n30), .B(n12), .C(n73), .Y(dest[0]) );
  AOI21X1 U84 ( .A(n71), .B(cnt_up), .C(n45), .Y(n73) );
  INVX1 U85 ( .A(n6), .Y(n45) );
  NAND3X1 U86 ( .A(s[2]), .B(n54), .C(s[0]), .Y(n6) );
  INVX1 U87 ( .A(n29), .Y(cnt_up) );
  MUX2X1 U88 ( .B(n74), .A(n75), .S(i[0]), .Y(n71) );
  NAND2X1 U89 ( .A(n41), .B(n29), .Y(n75) );
  NAND2X1 U90 ( .A(dr), .B(n44), .Y(n29) );
  INVX1 U91 ( .A(n62), .Y(n44) );
  NAND3X1 U92 ( .A(s[1]), .B(n55), .C(s[0]), .Y(n62) );
  INVX1 U93 ( .A(d[0]), .Y(n41) );
  NOR2X1 U94 ( .A(d[0]), .B(n4), .Y(n74) );
  INVX1 U95 ( .A(n11), .Y(n12) );
  AOI21X1 U96 ( .A(n72), .B(d[0]), .C(n57), .Y(n11) );
  AND2X1 U97 ( .A(j[0]), .B(clear), .Y(n57) );
  INVX1 U98 ( .A(n30), .Y(clear) );
  INVX1 U99 ( .A(n4), .Y(n72) );
  NAND3X1 U100 ( .A(n56), .B(n54), .C(s[2]), .Y(n4) );
  INVX1 U101 ( .A(s[1]), .Y(n54) );
  NAND3X1 U102 ( .A(n56), .B(n55), .C(s[1]), .Y(n30) );
  INVX1 U103 ( .A(s[2]), .Y(n55) );
  INVX1 U104 ( .A(s[0]), .Y(n56) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  NAND3X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(w_en) );
  INVX1 U4 ( .A(op[1]), .Y(n1) );
  NOR2X1 U5 ( .A(w_data_sel[1]), .B(n3), .Y(w_data_sel[0]) );
  NAND2X1 U6 ( .A(op[1]), .B(n2), .Y(w_data_sel[1]) );
  INVX1 U7 ( .A(op[2]), .Y(n2) );
  MUX2X1 U8 ( .B(n4), .A(n5), .S(op[1]), .Y(alu_op[1]) );
  NAND2X1 U9 ( .A(op[2]), .B(op[0]), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(alu_op[0]) );
  NAND2X1 U11 ( .A(op[2]), .B(n3), .Y(n5) );
  INVX1 U12 ( .A(op[0]), .Y(n3) );
endmodule


module alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [17:1] carry;

  FAX1 U1_17 ( .A(A[17]), .B(B[17]), .C(carry[17]), .YS(SUM[17]) );
  FAX1 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .YC(carry[17]), .YS(
        SUM[16]) );
  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YC(carry[16]), .YS(
        SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [18:0] carry;

  FAX1 U2_17 ( .A(A[17]), .B(n1), .C(carry[17]), .YS(DIFF[17]) );
  FAX1 U2_16 ( .A(A[16]), .B(n1), .C(carry[16]), .YC(carry[17]), .YS(DIFF[16])
         );
  FAX1 U2_15 ( .A(A[15]), .B(n2), .C(carry[15]), .YC(carry[16]), .YS(DIFF[15])
         );
  FAX1 U2_14 ( .A(A[14]), .B(n3), .C(carry[14]), .YC(carry[15]), .YS(DIFF[14])
         );
  FAX1 U2_13 ( .A(A[13]), .B(n4), .C(carry[13]), .YC(carry[14]), .YS(DIFF[13])
         );
  FAX1 U2_12 ( .A(A[12]), .B(n5), .C(carry[12]), .YC(carry[13]), .YS(DIFF[12])
         );
  FAX1 U2_11 ( .A(A[11]), .B(n6), .C(carry[11]), .YC(carry[12]), .YS(DIFF[11])
         );
  FAX1 U2_10 ( .A(A[10]), .B(n7), .C(carry[10]), .YC(carry[11]), .YS(DIFF[10])
         );
  FAX1 U2_9 ( .A(A[9]), .B(n8), .C(carry[9]), .YC(carry[10]), .YS(DIFF[9]) );
  FAX1 U2_8 ( .A(A[8]), .B(n9), .C(carry[8]), .YC(carry[9]), .YS(DIFF[8]) );
  FAX1 U2_7 ( .A(A[7]), .B(n10), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n11), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n12), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n13), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n14), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n15), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n16), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n17), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(B[17]), .Y(n1) );
  INVX2 U4 ( .A(B[15]), .Y(n2) );
  INVX2 U5 ( .A(B[14]), .Y(n3) );
  INVX2 U6 ( .A(B[13]), .Y(n4) );
  INVX2 U7 ( .A(B[12]), .Y(n5) );
  INVX2 U8 ( .A(B[11]), .Y(n6) );
  INVX2 U9 ( .A(B[10]), .Y(n7) );
  INVX2 U10 ( .A(B[9]), .Y(n8) );
  INVX2 U11 ( .A(B[8]), .Y(n9) );
  INVX2 U12 ( .A(B[7]), .Y(n10) );
  INVX2 U13 ( .A(B[6]), .Y(n11) );
  INVX2 U14 ( .A(B[5]), .Y(n12) );
  INVX2 U15 ( .A(B[4]), .Y(n13) );
  INVX2 U16 ( .A(B[3]), .Y(n14) );
  INVX2 U17 ( .A(B[2]), .Y(n15) );
  INVX2 U18 ( .A(B[1]), .Y(n16) );
  INVX2 U19 ( .A(B[0]), .Y(n17) );
endmodule


module alu_DW_mult_uns_1 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n3, n4, n5, n7, n8, n9, n11, n12, n13, n15, n16, n17, n19, n20,
         n21, n23, n25, n27, n29, n31, n33, n35, n37, n39, n41, n43, n45, n47,
         n49, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n86, n87, n88, n89, n91, n92, n94, n95,
         n96, n97, n98, n99, n100, n101, n103, n104, n105, n106, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n121,
         n122, n123, n124, n125, n126, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n803,
         n804, n805, n806, n807, n815, n816, n817, n818, n819, n836, n837,
         n838, n839, n840, n841, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906;

  XOR2X1 U53 ( .A(n54), .B(n53), .Y(product[46]) );
  XOR2X1 U54 ( .A(n86), .B(n901), .Y(n53) );
  FAX1 U55 ( .A(n87), .B(n88), .C(n55), .YC(n54), .YS(product[45]) );
  FAX1 U56 ( .A(n89), .B(n91), .C(n56), .YC(n55), .YS(product[44]) );
  FAX1 U57 ( .A(n94), .B(n92), .C(n57), .YC(n56), .YS(product[43]) );
  FAX1 U58 ( .A(n95), .B(n98), .C(n58), .YC(n57), .YS(product[42]) );
  FAX1 U59 ( .A(n99), .B(n103), .C(n59), .YC(n58), .YS(product[41]) );
  FAX1 U60 ( .A(n108), .B(n104), .C(n60), .YC(n59), .YS(product[40]) );
  FAX1 U61 ( .A(n109), .B(n114), .C(n61), .YC(n60), .YS(product[39]) );
  FAX1 U62 ( .A(n115), .B(n121), .C(n62), .YC(n61), .YS(product[38]) );
  FAX1 U63 ( .A(n128), .B(n122), .C(n63), .YC(n62), .YS(product[37]) );
  FAX1 U64 ( .A(n129), .B(n136), .C(n64), .YC(n63), .YS(product[36]) );
  FAX1 U65 ( .A(n137), .B(n144), .C(n65), .YC(n64), .YS(product[35]) );
  FAX1 U66 ( .A(n152), .B(n145), .C(n66), .YC(n65), .YS(product[34]) );
  FAX1 U67 ( .A(n160), .B(n153), .C(n67), .YC(n66), .YS(product[33]) );
  FAX1 U68 ( .A(n555), .B(n161), .C(n68), .YC(n67), .YS(product[32]) );
  FAX1 U69 ( .A(n169), .B(n556), .C(n69), .YC(n68), .YS(product[31]) );
  FAX1 U70 ( .A(n177), .B(n557), .C(n70), .YC(n69), .YS(product[30]) );
  FAX1 U71 ( .A(n185), .B(n558), .C(n71), .YC(n70) );
  FAX1 U72 ( .A(n193), .B(n559), .C(n72), .YC(n71) );
  FAX1 U73 ( .A(n201), .B(n560), .C(n73), .YC(n72) );
  FAX1 U74 ( .A(n209), .B(n561), .C(n74), .YC(n73) );
  FAX1 U75 ( .A(n215), .B(n562), .C(n75), .YC(n74) );
  FAX1 U76 ( .A(n221), .B(n563), .C(n76), .YC(n75) );
  FAX1 U77 ( .A(n227), .B(n564), .C(n77), .YC(n76) );
  FAX1 U78 ( .A(n231), .B(n565), .C(n78), .YC(n77) );
  FAX1 U79 ( .A(n235), .B(n566), .C(n79), .YC(n78) );
  FAX1 U80 ( .A(n239), .B(n567), .C(n80), .YC(n79) );
  FAX1 U81 ( .A(n241), .B(n568), .C(n81), .YC(n80) );
  FAX1 U82 ( .A(n243), .B(n569), .C(n82), .YC(n81) );
  HAX1 U83 ( .A(n570), .B(n83), .YC(n82) );
  HAX1 U84 ( .A(n571), .B(n84), .YC(n83) );
  HAX1 U85 ( .A(n1), .B(n572), .YC(n84) );
  FAX1 U87 ( .A(n478), .B(n246), .C(n250), .YC(n86), .YS(n87) );
  FAX1 U88 ( .A(n248), .B(n249), .C(n479), .YC(n88), .YS(n89) );
  FAX1 U90 ( .A(n249), .B(n96), .C(n480), .YC(n91), .YS(n92) );
  FAX1 U92 ( .A(n97), .B(n481), .C(n100), .YC(n94), .YS(n95) );
  FAX1 U93 ( .A(n497), .B(n254), .C(n252), .YC(n96), .YS(n97) );
  FAX1 U94 ( .A(n482), .B(n101), .C(n498), .YC(n98), .YS(n99) );
  FAX1 U95 ( .A(n256), .B(n253), .C(n105), .YC(n100), .YS(n101) );
  FAX1 U97 ( .A(n110), .B(n106), .C(n499), .YC(n103), .YS(n104) );
  FAX1 U98 ( .A(n255), .B(n112), .C(n483), .YC(n105), .YS(n106) );
  FAX1 U100 ( .A(n111), .B(n500), .C(n116), .YC(n108), .YS(n109) );
  FAX1 U101 ( .A(n113), .B(n118), .C(n484), .YC(n110), .YS(n111) );
  FAX1 U102 ( .A(n516), .B(n258), .C(n262), .YC(n112), .YS(n113) );
  FAX1 U103 ( .A(n501), .B(n117), .C(n517), .YC(n114), .YS(n115) );
  FAX1 U104 ( .A(n125), .B(n119), .C(n123), .YC(n116), .YS(n117) );
  FAX1 U105 ( .A(n260), .B(n261), .C(n485), .YC(n118), .YS(n119) );
  FAX1 U107 ( .A(n130), .B(n124), .C(n518), .YC(n121), .YS(n122) );
  FAX1 U108 ( .A(n132), .B(n126), .C(n502), .YC(n123), .YS(n124) );
  FAX1 U109 ( .A(n261), .B(n134), .C(n486), .YC(n125), .YS(n126) );
  FAX1 U111 ( .A(n131), .B(n519), .C(n138), .YC(n128), .YS(n129) );
  FAX1 U112 ( .A(n133), .B(n140), .C(n503), .YC(n130), .YS(n131) );
  FAX1 U113 ( .A(n135), .B(n142), .C(n487), .YC(n132), .YS(n133) );
  FAX1 U114 ( .A(n535), .B(n554), .C(n264), .YC(n134), .YS(n135) );
  FAX1 U115 ( .A(n520), .B(n139), .C(n536), .YC(n136), .YS(n137) );
  FAX1 U116 ( .A(n148), .B(n141), .C(n146), .YC(n138), .YS(n139) );
  FAX1 U117 ( .A(n488), .B(n143), .C(n504), .YC(n140), .YS(n141) );
  FAX1 U118 ( .A(n1), .B(n266), .C(n150), .YC(n142), .YS(n143) );
  FAX1 U119 ( .A(n521), .B(n147), .C(n537), .YC(n144), .YS(n145) );
  FAX1 U120 ( .A(n156), .B(n149), .C(n154), .YC(n146), .YS(n147) );
  FAX1 U121 ( .A(n489), .B(n151), .C(n505), .YC(n148), .YS(n149) );
  FAX1 U122 ( .A(n1), .B(n268), .C(n158), .YC(n150), .YS(n151) );
  FAX1 U123 ( .A(n162), .B(n155), .C(n538), .YC(n152), .YS(n153) );
  FAX1 U124 ( .A(n164), .B(n157), .C(n522), .YC(n154), .YS(n155) );
  FAX1 U125 ( .A(n166), .B(n159), .C(n506), .YC(n156), .YS(n157) );
  FAX1 U126 ( .A(n1), .B(n270), .C(n490), .YC(n158), .YS(n159) );
  FAX1 U127 ( .A(n163), .B(n539), .C(n168), .YC(n160), .YS(n161) );
  FAX1 U128 ( .A(n165), .B(n523), .C(n170), .YC(n162), .YS(n163) );
  FAX1 U129 ( .A(n167), .B(n507), .C(n172), .YC(n164), .YS(n165) );
  FAX1 U130 ( .A(n272), .B(n491), .C(n174), .YC(n166), .YS(n167) );
  FAX1 U131 ( .A(n171), .B(n540), .C(n176), .YC(n168), .YS(n169) );
  FAX1 U132 ( .A(n173), .B(n524), .C(n178), .YC(n170), .YS(n171) );
  FAX1 U133 ( .A(n175), .B(n508), .C(n180), .YC(n172), .YS(n173) );
  FAX1 U134 ( .A(n274), .B(n492), .C(n182), .YC(n174), .YS(n175) );
  FAX1 U135 ( .A(n179), .B(n541), .C(n184), .YC(n176), .YS(n177) );
  FAX1 U136 ( .A(n181), .B(n525), .C(n186), .YC(n178), .YS(n179) );
  FAX1 U137 ( .A(n183), .B(n509), .C(n188), .YC(n180), .YS(n181) );
  FAX1 U138 ( .A(n275), .B(n493), .C(n190), .YC(n182), .YS(n183) );
  FAX1 U139 ( .A(n187), .B(n542), .C(n192), .YC(n184), .YS(n185) );
  FAX1 U140 ( .A(n189), .B(n526), .C(n194), .YC(n186), .YS(n187) );
  FAX1 U141 ( .A(n191), .B(n510), .C(n196), .YC(n188), .YS(n189) );
  HAX1 U142 ( .A(n494), .B(n198), .YC(n190), .YS(n191) );
  FAX1 U143 ( .A(n195), .B(n543), .C(n200), .YC(n192), .YS(n193) );
  FAX1 U144 ( .A(n197), .B(n527), .C(n202), .YC(n194), .YS(n195) );
  FAX1 U145 ( .A(n199), .B(n511), .C(n204), .YC(n196), .YS(n197) );
  HAX1 U146 ( .A(n495), .B(n206), .YC(n198), .YS(n199) );
  FAX1 U147 ( .A(n203), .B(n544), .C(n208), .YC(n200), .YS(n201) );
  FAX1 U148 ( .A(n205), .B(n528), .C(n210), .YC(n202), .YS(n203) );
  FAX1 U149 ( .A(n207), .B(n512), .C(n212), .YC(n204), .YS(n205) );
  HAX1 U150 ( .A(n17), .B(n496), .YC(n206), .YS(n207) );
  FAX1 U151 ( .A(n211), .B(n545), .C(n214), .YC(n208), .YS(n209) );
  FAX1 U152 ( .A(n213), .B(n529), .C(n216), .YC(n210), .YS(n211) );
  HAX1 U153 ( .A(n513), .B(n218), .YC(n212), .YS(n213) );
  FAX1 U154 ( .A(n217), .B(n546), .C(n220), .YC(n214), .YS(n215) );
  FAX1 U155 ( .A(n219), .B(n530), .C(n222), .YC(n216), .YS(n217) );
  HAX1 U156 ( .A(n514), .B(n224), .YC(n218), .YS(n219) );
  FAX1 U157 ( .A(n223), .B(n547), .C(n226), .YC(n220), .YS(n221) );
  FAX1 U158 ( .A(n225), .B(n531), .C(n228), .YC(n222), .YS(n223) );
  HAX1 U159 ( .A(n13), .B(n515), .YC(n224), .YS(n225) );
  FAX1 U160 ( .A(n229), .B(n548), .C(n230), .YC(n226), .YS(n227) );
  HAX1 U161 ( .A(n532), .B(n232), .YC(n228), .YS(n229) );
  FAX1 U162 ( .A(n233), .B(n549), .C(n234), .YC(n230), .YS(n231) );
  HAX1 U163 ( .A(n533), .B(n236), .YC(n232), .YS(n233) );
  FAX1 U164 ( .A(n237), .B(n550), .C(n238), .YC(n234), .YS(n235) );
  HAX1 U165 ( .A(n9), .B(n534), .YC(n236), .YS(n237) );
  HAX1 U166 ( .A(n551), .B(n240), .YC(n238), .YS(n239) );
  HAX1 U167 ( .A(n552), .B(n242), .YC(n240), .YS(n241) );
  HAX1 U168 ( .A(n5), .B(n553), .YC(n242), .YS(n243) );
  INVX2 U170 ( .A(n245), .Y(n246) );
  AOI22X1 U171 ( .A(n836), .B(n51), .C(n49), .D(n890), .Y(n245) );
  INVX2 U172 ( .A(n247), .Y(n248) );
  AOI22X1 U173 ( .A(n836), .B(n49), .C(n47), .D(n890), .Y(n247) );
  INVX2 U174 ( .A(n249), .Y(n250) );
  AOI22X1 U175 ( .A(n836), .B(n47), .C(n45), .D(n890), .Y(n249) );
  INVX2 U176 ( .A(n251), .Y(n252) );
  AOI22X1 U177 ( .A(n836), .B(n45), .C(n43), .D(n890), .Y(n251) );
  INVX2 U178 ( .A(n253), .Y(n254) );
  AOI22X1 U179 ( .A(n836), .B(n43), .C(n41), .D(n890), .Y(n253) );
  INVX2 U180 ( .A(n255), .Y(n256) );
  AOI22X1 U181 ( .A(n836), .B(n41), .C(n39), .D(n890), .Y(n255) );
  INVX2 U182 ( .A(n257), .Y(n258) );
  AOI22X1 U183 ( .A(n836), .B(n39), .C(n37), .D(n890), .Y(n257) );
  INVX2 U184 ( .A(n259), .Y(n260) );
  AOI22X1 U185 ( .A(n836), .B(n37), .C(n35), .D(n890), .Y(n259) );
  INVX2 U186 ( .A(n261), .Y(n262) );
  AOI22X1 U187 ( .A(n836), .B(n35), .C(n33), .D(n890), .Y(n261) );
  INVX2 U188 ( .A(n263), .Y(n264) );
  AOI22X1 U189 ( .A(n836), .B(n33), .C(n31), .D(n890), .Y(n263) );
  INVX2 U190 ( .A(n265), .Y(n266) );
  AOI22X1 U191 ( .A(n836), .B(n31), .C(n29), .D(n890), .Y(n265) );
  INVX2 U192 ( .A(n267), .Y(n268) );
  AOI22X1 U193 ( .A(n836), .B(n29), .C(n27), .D(n890), .Y(n267) );
  INVX2 U194 ( .A(n269), .Y(n270) );
  AOI22X1 U195 ( .A(n836), .B(n27), .C(n25), .D(n890), .Y(n269) );
  INVX2 U196 ( .A(n271), .Y(n272) );
  AOI22X1 U197 ( .A(n836), .B(n25), .C(n23), .D(n890), .Y(n271) );
  INVX2 U198 ( .A(n273), .Y(n274) );
  AOI22X1 U199 ( .A(n836), .B(n23), .C(n21), .D(n890), .Y(n273) );
  AND2X2 U200 ( .A(n836), .B(n21), .Y(n275) );
  INVX2 U201 ( .A(n17), .Y(n478) );
  XOR2X1 U202 ( .A(n573), .B(n17), .Y(n479) );
  OAI21X1 U203 ( .A(n20), .B(n748), .C(n591), .Y(n573) );
  NAND2X1 U204 ( .A(n51), .B(n900), .Y(n591) );
  XOR2X1 U205 ( .A(n574), .B(n17), .Y(n480) );
  OAI21X1 U206 ( .A(n20), .B(n749), .C(n592), .Y(n574) );
  AOI21X1 U207 ( .A(n49), .B(n900), .C(n276), .Y(n592) );
  AND2X2 U208 ( .A(n894), .B(n51), .Y(n276) );
  XOR2X1 U209 ( .A(n575), .B(n17), .Y(n481) );
  OAI21X1 U210 ( .A(n20), .B(n750), .C(n593), .Y(n575) );
  AOI21X1 U211 ( .A(n47), .B(n900), .C(n278), .Y(n593) );
  INVX2 U212 ( .A(n277), .Y(n278) );
  AOI22X1 U213 ( .A(n815), .B(n51), .C(n49), .D(n894), .Y(n277) );
  XOR2X1 U214 ( .A(n576), .B(n17), .Y(n482) );
  OAI21X1 U215 ( .A(n20), .B(n751), .C(n594), .Y(n576) );
  AOI21X1 U216 ( .A(n45), .B(n900), .C(n280), .Y(n594) );
  INVX2 U217 ( .A(n279), .Y(n280) );
  AOI22X1 U218 ( .A(n815), .B(n49), .C(n47), .D(n894), .Y(n279) );
  XOR2X1 U219 ( .A(n577), .B(n17), .Y(n483) );
  OAI21X1 U220 ( .A(n20), .B(n752), .C(n595), .Y(n577) );
  AOI21X1 U221 ( .A(n43), .B(n900), .C(n282), .Y(n595) );
  INVX2 U222 ( .A(n281), .Y(n282) );
  AOI22X1 U223 ( .A(n815), .B(n47), .C(n45), .D(n894), .Y(n281) );
  XOR2X1 U224 ( .A(n578), .B(n17), .Y(n484) );
  OAI21X1 U225 ( .A(n20), .B(n753), .C(n596), .Y(n578) );
  AOI21X1 U226 ( .A(n41), .B(n900), .C(n284), .Y(n596) );
  INVX2 U227 ( .A(n283), .Y(n284) );
  AOI22X1 U228 ( .A(n815), .B(n45), .C(n43), .D(n894), .Y(n283) );
  XOR2X1 U229 ( .A(n579), .B(n17), .Y(n485) );
  OAI21X1 U230 ( .A(n20), .B(n754), .C(n597), .Y(n579) );
  AOI21X1 U231 ( .A(n39), .B(n900), .C(n286), .Y(n597) );
  INVX2 U232 ( .A(n285), .Y(n286) );
  AOI22X1 U233 ( .A(n815), .B(n43), .C(n41), .D(n894), .Y(n285) );
  XOR2X1 U234 ( .A(n580), .B(n17), .Y(n486) );
  OAI21X1 U235 ( .A(n20), .B(n755), .C(n598), .Y(n580) );
  AOI21X1 U236 ( .A(n37), .B(n900), .C(n288), .Y(n598) );
  INVX2 U237 ( .A(n287), .Y(n288) );
  AOI22X1 U238 ( .A(n815), .B(n41), .C(n39), .D(n894), .Y(n287) );
  XOR2X1 U239 ( .A(n581), .B(n17), .Y(n487) );
  OAI21X1 U240 ( .A(n20), .B(n756), .C(n599), .Y(n581) );
  AOI21X1 U241 ( .A(n35), .B(n900), .C(n290), .Y(n599) );
  INVX2 U242 ( .A(n289), .Y(n290) );
  AOI22X1 U243 ( .A(n815), .B(n39), .C(n37), .D(n894), .Y(n289) );
  XOR2X1 U244 ( .A(n582), .B(n17), .Y(n488) );
  OAI21X1 U245 ( .A(n19), .B(n757), .C(n600), .Y(n582) );
  AOI21X1 U246 ( .A(n33), .B(n900), .C(n292), .Y(n600) );
  INVX2 U247 ( .A(n291), .Y(n292) );
  AOI22X1 U248 ( .A(n815), .B(n37), .C(n35), .D(n894), .Y(n291) );
  XOR2X1 U249 ( .A(n583), .B(n17), .Y(n489) );
  OAI21X1 U250 ( .A(n19), .B(n758), .C(n601), .Y(n583) );
  AOI21X1 U251 ( .A(n31), .B(n900), .C(n294), .Y(n601) );
  INVX2 U252 ( .A(n293), .Y(n294) );
  AOI22X1 U253 ( .A(n815), .B(n35), .C(n33), .D(n894), .Y(n293) );
  XOR2X1 U254 ( .A(n584), .B(n17), .Y(n490) );
  OAI21X1 U255 ( .A(n19), .B(n759), .C(n602), .Y(n584) );
  AOI21X1 U256 ( .A(n29), .B(n900), .C(n296), .Y(n602) );
  INVX2 U257 ( .A(n295), .Y(n296) );
  AOI22X1 U258 ( .A(n815), .B(n33), .C(n31), .D(n894), .Y(n295) );
  XOR2X1 U259 ( .A(n585), .B(n17), .Y(n491) );
  OAI21X1 U260 ( .A(n19), .B(n760), .C(n603), .Y(n585) );
  AOI21X1 U261 ( .A(n27), .B(n900), .C(n298), .Y(n603) );
  INVX2 U262 ( .A(n297), .Y(n298) );
  AOI22X1 U263 ( .A(n815), .B(n31), .C(n29), .D(n894), .Y(n297) );
  XOR2X1 U264 ( .A(n586), .B(n17), .Y(n492) );
  OAI21X1 U265 ( .A(n19), .B(n761), .C(n604), .Y(n586) );
  AOI21X1 U266 ( .A(n25), .B(n900), .C(n300), .Y(n604) );
  INVX2 U267 ( .A(n299), .Y(n300) );
  AOI22X1 U268 ( .A(n815), .B(n29), .C(n27), .D(n894), .Y(n299) );
  XOR2X1 U269 ( .A(n587), .B(n17), .Y(n493) );
  OAI21X1 U270 ( .A(n19), .B(n762), .C(n605), .Y(n587) );
  AOI21X1 U271 ( .A(n23), .B(n900), .C(n302), .Y(n605) );
  INVX2 U272 ( .A(n301), .Y(n302) );
  AOI22X1 U273 ( .A(n815), .B(n27), .C(n25), .D(n894), .Y(n301) );
  XOR2X1 U274 ( .A(n588), .B(n17), .Y(n494) );
  OAI21X1 U275 ( .A(n19), .B(n763), .C(n606), .Y(n588) );
  AOI21X1 U276 ( .A(n21), .B(n900), .C(n304), .Y(n606) );
  INVX2 U277 ( .A(n303), .Y(n304) );
  AOI22X1 U278 ( .A(n815), .B(n25), .C(n23), .D(n894), .Y(n303) );
  XOR2X1 U279 ( .A(n589), .B(n17), .Y(n495) );
  OAI21X1 U280 ( .A(n764), .B(n19), .C(n305), .Y(n589) );
  AOI22X1 U281 ( .A(n815), .B(n23), .C(n21), .D(n894), .Y(n305) );
  XOR2X1 U282 ( .A(n590), .B(n17), .Y(n496) );
  OAI21X1 U283 ( .A(n765), .B(n19), .C(n906), .Y(n590) );
  INVX2 U286 ( .A(n13), .Y(n497) );
  XOR2X1 U287 ( .A(n608), .B(n13), .Y(n498) );
  OAI21X1 U288 ( .A(n16), .B(n748), .C(n626), .Y(n608) );
  NAND2X1 U289 ( .A(n51), .B(n899), .Y(n626) );
  XOR2X1 U290 ( .A(n609), .B(n13), .Y(n499) );
  OAI21X1 U291 ( .A(n16), .B(n749), .C(n627), .Y(n609) );
  AOI21X1 U292 ( .A(n49), .B(n899), .C(n307), .Y(n627) );
  AND2X2 U293 ( .A(n893), .B(n51), .Y(n307) );
  XOR2X1 U294 ( .A(n610), .B(n13), .Y(n500) );
  OAI21X1 U295 ( .A(n16), .B(n750), .C(n628), .Y(n610) );
  AOI21X1 U296 ( .A(n47), .B(n899), .C(n309), .Y(n628) );
  INVX2 U297 ( .A(n308), .Y(n309) );
  AOI22X1 U298 ( .A(n816), .B(n51), .C(n49), .D(n893), .Y(n308) );
  XOR2X1 U299 ( .A(n611), .B(n13), .Y(n501) );
  OAI21X1 U300 ( .A(n16), .B(n751), .C(n629), .Y(n611) );
  AOI21X1 U301 ( .A(n45), .B(n899), .C(n311), .Y(n629) );
  INVX2 U302 ( .A(n310), .Y(n311) );
  AOI22X1 U303 ( .A(n816), .B(n49), .C(n47), .D(n893), .Y(n310) );
  XOR2X1 U304 ( .A(n612), .B(n13), .Y(n502) );
  OAI21X1 U305 ( .A(n16), .B(n752), .C(n630), .Y(n612) );
  AOI21X1 U306 ( .A(n43), .B(n899), .C(n313), .Y(n630) );
  INVX2 U307 ( .A(n312), .Y(n313) );
  AOI22X1 U308 ( .A(n816), .B(n47), .C(n45), .D(n893), .Y(n312) );
  XOR2X1 U309 ( .A(n613), .B(n13), .Y(n503) );
  OAI21X1 U310 ( .A(n16), .B(n753), .C(n631), .Y(n613) );
  AOI21X1 U311 ( .A(n41), .B(n899), .C(n315), .Y(n631) );
  INVX2 U312 ( .A(n314), .Y(n315) );
  AOI22X1 U313 ( .A(n816), .B(n45), .C(n43), .D(n893), .Y(n314) );
  XOR2X1 U314 ( .A(n614), .B(n13), .Y(n504) );
  OAI21X1 U315 ( .A(n16), .B(n754), .C(n632), .Y(n614) );
  AOI21X1 U316 ( .A(n39), .B(n899), .C(n317), .Y(n632) );
  INVX2 U317 ( .A(n316), .Y(n317) );
  AOI22X1 U318 ( .A(n816), .B(n43), .C(n41), .D(n893), .Y(n316) );
  XOR2X1 U319 ( .A(n615), .B(n13), .Y(n505) );
  OAI21X1 U320 ( .A(n16), .B(n755), .C(n633), .Y(n615) );
  AOI21X1 U321 ( .A(n37), .B(n899), .C(n319), .Y(n633) );
  INVX2 U322 ( .A(n318), .Y(n319) );
  AOI22X1 U323 ( .A(n816), .B(n41), .C(n39), .D(n893), .Y(n318) );
  XOR2X1 U324 ( .A(n616), .B(n13), .Y(n506) );
  OAI21X1 U325 ( .A(n16), .B(n756), .C(n634), .Y(n616) );
  AOI21X1 U326 ( .A(n35), .B(n899), .C(n321), .Y(n634) );
  INVX2 U327 ( .A(n320), .Y(n321) );
  AOI22X1 U328 ( .A(n816), .B(n39), .C(n37), .D(n893), .Y(n320) );
  XOR2X1 U329 ( .A(n617), .B(n13), .Y(n507) );
  OAI21X1 U330 ( .A(n15), .B(n757), .C(n635), .Y(n617) );
  AOI21X1 U331 ( .A(n33), .B(n899), .C(n323), .Y(n635) );
  INVX2 U332 ( .A(n322), .Y(n323) );
  AOI22X1 U333 ( .A(n816), .B(n37), .C(n35), .D(n893), .Y(n322) );
  XOR2X1 U334 ( .A(n618), .B(n13), .Y(n508) );
  OAI21X1 U335 ( .A(n15), .B(n758), .C(n636), .Y(n618) );
  AOI21X1 U336 ( .A(n31), .B(n899), .C(n325), .Y(n636) );
  INVX2 U337 ( .A(n324), .Y(n325) );
  AOI22X1 U338 ( .A(n816), .B(n35), .C(n33), .D(n893), .Y(n324) );
  XOR2X1 U339 ( .A(n619), .B(n13), .Y(n509) );
  OAI21X1 U340 ( .A(n15), .B(n759), .C(n637), .Y(n619) );
  AOI21X1 U341 ( .A(n29), .B(n899), .C(n327), .Y(n637) );
  INVX2 U342 ( .A(n326), .Y(n327) );
  AOI22X1 U343 ( .A(n816), .B(n33), .C(n31), .D(n893), .Y(n326) );
  XOR2X1 U344 ( .A(n620), .B(n13), .Y(n510) );
  OAI21X1 U345 ( .A(n15), .B(n760), .C(n638), .Y(n620) );
  AOI21X1 U346 ( .A(n27), .B(n899), .C(n329), .Y(n638) );
  INVX2 U347 ( .A(n328), .Y(n329) );
  AOI22X1 U348 ( .A(n816), .B(n31), .C(n29), .D(n893), .Y(n328) );
  XOR2X1 U349 ( .A(n621), .B(n13), .Y(n511) );
  OAI21X1 U350 ( .A(n15), .B(n761), .C(n639), .Y(n621) );
  AOI21X1 U351 ( .A(n25), .B(n899), .C(n331), .Y(n639) );
  INVX2 U352 ( .A(n330), .Y(n331) );
  AOI22X1 U353 ( .A(n816), .B(n29), .C(n27), .D(n893), .Y(n330) );
  XOR2X1 U354 ( .A(n622), .B(n13), .Y(n512) );
  OAI21X1 U355 ( .A(n15), .B(n762), .C(n640), .Y(n622) );
  AOI21X1 U356 ( .A(n23), .B(n899), .C(n333), .Y(n640) );
  INVX2 U357 ( .A(n332), .Y(n333) );
  AOI22X1 U358 ( .A(n816), .B(n27), .C(n25), .D(n893), .Y(n332) );
  XOR2X1 U359 ( .A(n623), .B(n13), .Y(n513) );
  OAI21X1 U360 ( .A(n15), .B(n763), .C(n641), .Y(n623) );
  AOI21X1 U361 ( .A(n21), .B(n899), .C(n335), .Y(n641) );
  INVX2 U362 ( .A(n334), .Y(n335) );
  AOI22X1 U363 ( .A(n816), .B(n25), .C(n23), .D(n893), .Y(n334) );
  XOR2X1 U364 ( .A(n624), .B(n13), .Y(n514) );
  OAI21X1 U365 ( .A(n764), .B(n15), .C(n336), .Y(n624) );
  AOI22X1 U366 ( .A(n816), .B(n23), .C(n21), .D(n893), .Y(n336) );
  XOR2X1 U367 ( .A(n625), .B(n13), .Y(n515) );
  OAI21X1 U368 ( .A(n765), .B(n15), .C(n905), .Y(n625) );
  INVX2 U371 ( .A(n9), .Y(n516) );
  XOR2X1 U372 ( .A(n643), .B(n9), .Y(n517) );
  OAI21X1 U373 ( .A(n12), .B(n748), .C(n661), .Y(n643) );
  NAND2X1 U374 ( .A(n51), .B(n898), .Y(n661) );
  XOR2X1 U375 ( .A(n644), .B(n9), .Y(n518) );
  OAI21X1 U376 ( .A(n12), .B(n749), .C(n662), .Y(n644) );
  AOI21X1 U377 ( .A(n49), .B(n898), .C(n338), .Y(n662) );
  AND2X2 U378 ( .A(n892), .B(n51), .Y(n338) );
  XOR2X1 U379 ( .A(n645), .B(n9), .Y(n519) );
  OAI21X1 U380 ( .A(n12), .B(n750), .C(n663), .Y(n645) );
  AOI21X1 U381 ( .A(n47), .B(n898), .C(n340), .Y(n663) );
  INVX2 U382 ( .A(n339), .Y(n340) );
  AOI22X1 U383 ( .A(n817), .B(n51), .C(n49), .D(n892), .Y(n339) );
  XOR2X1 U384 ( .A(n646), .B(n9), .Y(n520) );
  OAI21X1 U385 ( .A(n12), .B(n751), .C(n664), .Y(n646) );
  AOI21X1 U386 ( .A(n45), .B(n898), .C(n342), .Y(n664) );
  INVX2 U387 ( .A(n341), .Y(n342) );
  AOI22X1 U388 ( .A(n817), .B(n49), .C(n47), .D(n892), .Y(n341) );
  XOR2X1 U389 ( .A(n647), .B(n9), .Y(n521) );
  OAI21X1 U390 ( .A(n12), .B(n752), .C(n665), .Y(n647) );
  AOI21X1 U391 ( .A(n43), .B(n898), .C(n344), .Y(n665) );
  INVX2 U392 ( .A(n343), .Y(n344) );
  AOI22X1 U393 ( .A(n817), .B(n47), .C(n45), .D(n892), .Y(n343) );
  XOR2X1 U394 ( .A(n648), .B(n9), .Y(n522) );
  OAI21X1 U395 ( .A(n12), .B(n753), .C(n666), .Y(n648) );
  AOI21X1 U396 ( .A(n41), .B(n898), .C(n346), .Y(n666) );
  INVX2 U397 ( .A(n345), .Y(n346) );
  AOI22X1 U398 ( .A(n817), .B(n45), .C(n43), .D(n892), .Y(n345) );
  XOR2X1 U399 ( .A(n649), .B(n9), .Y(n523) );
  OAI21X1 U400 ( .A(n12), .B(n754), .C(n667), .Y(n649) );
  AOI21X1 U401 ( .A(n39), .B(n898), .C(n348), .Y(n667) );
  INVX2 U402 ( .A(n347), .Y(n348) );
  AOI22X1 U403 ( .A(n817), .B(n43), .C(n41), .D(n892), .Y(n347) );
  XOR2X1 U404 ( .A(n650), .B(n9), .Y(n524) );
  OAI21X1 U405 ( .A(n12), .B(n755), .C(n668), .Y(n650) );
  AOI21X1 U406 ( .A(n37), .B(n898), .C(n350), .Y(n668) );
  INVX2 U407 ( .A(n349), .Y(n350) );
  AOI22X1 U408 ( .A(n817), .B(n41), .C(n39), .D(n892), .Y(n349) );
  XOR2X1 U409 ( .A(n651), .B(n9), .Y(n525) );
  OAI21X1 U410 ( .A(n12), .B(n756), .C(n669), .Y(n651) );
  AOI21X1 U411 ( .A(n35), .B(n898), .C(n352), .Y(n669) );
  INVX2 U412 ( .A(n351), .Y(n352) );
  AOI22X1 U413 ( .A(n817), .B(n39), .C(n37), .D(n892), .Y(n351) );
  XOR2X1 U414 ( .A(n652), .B(n9), .Y(n526) );
  OAI21X1 U415 ( .A(n11), .B(n757), .C(n670), .Y(n652) );
  AOI21X1 U416 ( .A(n33), .B(n898), .C(n354), .Y(n670) );
  INVX2 U417 ( .A(n353), .Y(n354) );
  AOI22X1 U418 ( .A(n817), .B(n37), .C(n35), .D(n892), .Y(n353) );
  XOR2X1 U419 ( .A(n653), .B(n9), .Y(n527) );
  OAI21X1 U420 ( .A(n11), .B(n758), .C(n671), .Y(n653) );
  AOI21X1 U421 ( .A(n31), .B(n898), .C(n356), .Y(n671) );
  INVX2 U422 ( .A(n355), .Y(n356) );
  AOI22X1 U423 ( .A(n817), .B(n35), .C(n33), .D(n892), .Y(n355) );
  XOR2X1 U424 ( .A(n654), .B(n9), .Y(n528) );
  OAI21X1 U425 ( .A(n11), .B(n759), .C(n672), .Y(n654) );
  AOI21X1 U426 ( .A(n29), .B(n898), .C(n358), .Y(n672) );
  INVX2 U427 ( .A(n357), .Y(n358) );
  AOI22X1 U428 ( .A(n817), .B(n33), .C(n31), .D(n892), .Y(n357) );
  XOR2X1 U429 ( .A(n655), .B(n9), .Y(n529) );
  OAI21X1 U430 ( .A(n11), .B(n760), .C(n673), .Y(n655) );
  AOI21X1 U431 ( .A(n27), .B(n898), .C(n360), .Y(n673) );
  INVX2 U432 ( .A(n359), .Y(n360) );
  AOI22X1 U433 ( .A(n817), .B(n31), .C(n29), .D(n892), .Y(n359) );
  XOR2X1 U434 ( .A(n656), .B(n9), .Y(n530) );
  OAI21X1 U435 ( .A(n11), .B(n761), .C(n674), .Y(n656) );
  AOI21X1 U436 ( .A(n25), .B(n898), .C(n362), .Y(n674) );
  INVX2 U437 ( .A(n361), .Y(n362) );
  AOI22X1 U438 ( .A(n817), .B(n29), .C(n27), .D(n892), .Y(n361) );
  XOR2X1 U439 ( .A(n657), .B(n9), .Y(n531) );
  OAI21X1 U440 ( .A(n11), .B(n762), .C(n675), .Y(n657) );
  AOI21X1 U441 ( .A(n23), .B(n898), .C(n364), .Y(n675) );
  INVX2 U442 ( .A(n363), .Y(n364) );
  AOI22X1 U443 ( .A(n817), .B(n27), .C(n25), .D(n892), .Y(n363) );
  XOR2X1 U444 ( .A(n658), .B(n9), .Y(n532) );
  OAI21X1 U445 ( .A(n11), .B(n763), .C(n676), .Y(n658) );
  AOI21X1 U446 ( .A(n21), .B(n898), .C(n366), .Y(n676) );
  INVX2 U447 ( .A(n365), .Y(n366) );
  AOI22X1 U448 ( .A(n817), .B(n25), .C(n23), .D(n892), .Y(n365) );
  XOR2X1 U449 ( .A(n659), .B(n9), .Y(n533) );
  OAI21X1 U450 ( .A(n764), .B(n11), .C(n367), .Y(n659) );
  AOI22X1 U451 ( .A(n817), .B(n23), .C(n21), .D(n892), .Y(n367) );
  XOR2X1 U452 ( .A(n660), .B(n9), .Y(n534) );
  OAI21X1 U453 ( .A(n765), .B(n11), .C(n904), .Y(n660) );
  INVX2 U456 ( .A(n5), .Y(n535) );
  XOR2X1 U457 ( .A(n678), .B(n5), .Y(n536) );
  OAI21X1 U458 ( .A(n8), .B(n748), .C(n696), .Y(n678) );
  NAND2X1 U459 ( .A(n51), .B(n897), .Y(n696) );
  XOR2X1 U460 ( .A(n679), .B(n5), .Y(n537) );
  OAI21X1 U461 ( .A(n8), .B(n749), .C(n697), .Y(n679) );
  AOI21X1 U462 ( .A(n49), .B(n897), .C(n369), .Y(n697) );
  AND2X2 U463 ( .A(n891), .B(n51), .Y(n369) );
  XOR2X1 U464 ( .A(n680), .B(n5), .Y(n538) );
  OAI21X1 U465 ( .A(n8), .B(n750), .C(n698), .Y(n680) );
  AOI21X1 U466 ( .A(n47), .B(n897), .C(n371), .Y(n698) );
  INVX2 U467 ( .A(n370), .Y(n371) );
  AOI22X1 U468 ( .A(n818), .B(n51), .C(n49), .D(n891), .Y(n370) );
  XOR2X1 U469 ( .A(n681), .B(n5), .Y(n539) );
  OAI21X1 U470 ( .A(n8), .B(n751), .C(n699), .Y(n681) );
  AOI21X1 U471 ( .A(n45), .B(n897), .C(n373), .Y(n699) );
  INVX2 U472 ( .A(n372), .Y(n373) );
  AOI22X1 U473 ( .A(n818), .B(n49), .C(n47), .D(n891), .Y(n372) );
  XOR2X1 U474 ( .A(n682), .B(n5), .Y(n540) );
  OAI21X1 U475 ( .A(n8), .B(n752), .C(n700), .Y(n682) );
  AOI21X1 U476 ( .A(n43), .B(n897), .C(n375), .Y(n700) );
  INVX2 U477 ( .A(n374), .Y(n375) );
  AOI22X1 U478 ( .A(n818), .B(n47), .C(n45), .D(n891), .Y(n374) );
  XOR2X1 U479 ( .A(n683), .B(n5), .Y(n541) );
  OAI21X1 U480 ( .A(n8), .B(n753), .C(n701), .Y(n683) );
  AOI21X1 U481 ( .A(n41), .B(n897), .C(n377), .Y(n701) );
  INVX2 U482 ( .A(n376), .Y(n377) );
  AOI22X1 U483 ( .A(n818), .B(n45), .C(n43), .D(n891), .Y(n376) );
  XOR2X1 U484 ( .A(n684), .B(n5), .Y(n542) );
  OAI21X1 U485 ( .A(n8), .B(n754), .C(n702), .Y(n684) );
  AOI21X1 U486 ( .A(n39), .B(n897), .C(n379), .Y(n702) );
  INVX2 U487 ( .A(n378), .Y(n379) );
  AOI22X1 U488 ( .A(n818), .B(n43), .C(n41), .D(n891), .Y(n378) );
  XOR2X1 U489 ( .A(n685), .B(n5), .Y(n543) );
  OAI21X1 U490 ( .A(n8), .B(n755), .C(n703), .Y(n685) );
  AOI21X1 U491 ( .A(n37), .B(n897), .C(n381), .Y(n703) );
  INVX2 U492 ( .A(n380), .Y(n381) );
  AOI22X1 U493 ( .A(n818), .B(n41), .C(n39), .D(n891), .Y(n380) );
  XOR2X1 U494 ( .A(n686), .B(n5), .Y(n544) );
  OAI21X1 U495 ( .A(n8), .B(n756), .C(n704), .Y(n686) );
  AOI21X1 U496 ( .A(n35), .B(n897), .C(n383), .Y(n704) );
  INVX2 U497 ( .A(n382), .Y(n383) );
  AOI22X1 U498 ( .A(n818), .B(n39), .C(n37), .D(n891), .Y(n382) );
  XOR2X1 U499 ( .A(n687), .B(n5), .Y(n545) );
  OAI21X1 U500 ( .A(n7), .B(n757), .C(n705), .Y(n687) );
  AOI21X1 U501 ( .A(n33), .B(n897), .C(n385), .Y(n705) );
  INVX2 U502 ( .A(n384), .Y(n385) );
  AOI22X1 U503 ( .A(n818), .B(n37), .C(n35), .D(n891), .Y(n384) );
  XOR2X1 U504 ( .A(n688), .B(n5), .Y(n546) );
  OAI21X1 U505 ( .A(n7), .B(n758), .C(n706), .Y(n688) );
  AOI21X1 U506 ( .A(n31), .B(n897), .C(n387), .Y(n706) );
  INVX2 U507 ( .A(n386), .Y(n387) );
  AOI22X1 U508 ( .A(n818), .B(n35), .C(n33), .D(n891), .Y(n386) );
  XOR2X1 U509 ( .A(n689), .B(n5), .Y(n547) );
  OAI21X1 U510 ( .A(n7), .B(n759), .C(n707), .Y(n689) );
  AOI21X1 U511 ( .A(n29), .B(n897), .C(n389), .Y(n707) );
  INVX2 U512 ( .A(n388), .Y(n389) );
  AOI22X1 U513 ( .A(n818), .B(n33), .C(n31), .D(n891), .Y(n388) );
  XOR2X1 U514 ( .A(n690), .B(n5), .Y(n548) );
  OAI21X1 U515 ( .A(n7), .B(n760), .C(n708), .Y(n690) );
  AOI21X1 U516 ( .A(n27), .B(n897), .C(n391), .Y(n708) );
  INVX2 U517 ( .A(n390), .Y(n391) );
  AOI22X1 U518 ( .A(n818), .B(n31), .C(n29), .D(n891), .Y(n390) );
  XOR2X1 U519 ( .A(n691), .B(n5), .Y(n549) );
  OAI21X1 U520 ( .A(n7), .B(n761), .C(n709), .Y(n691) );
  AOI21X1 U521 ( .A(n25), .B(n897), .C(n393), .Y(n709) );
  INVX2 U522 ( .A(n392), .Y(n393) );
  AOI22X1 U523 ( .A(n818), .B(n29), .C(n27), .D(n891), .Y(n392) );
  XOR2X1 U524 ( .A(n692), .B(n5), .Y(n550) );
  OAI21X1 U525 ( .A(n7), .B(n762), .C(n710), .Y(n692) );
  AOI21X1 U526 ( .A(n23), .B(n897), .C(n395), .Y(n710) );
  INVX2 U527 ( .A(n394), .Y(n395) );
  AOI22X1 U528 ( .A(n818), .B(n27), .C(n25), .D(n891), .Y(n394) );
  XOR2X1 U529 ( .A(n693), .B(n5), .Y(n551) );
  OAI21X1 U530 ( .A(n7), .B(n763), .C(n711), .Y(n693) );
  AOI21X1 U531 ( .A(n21), .B(n897), .C(n397), .Y(n711) );
  INVX2 U532 ( .A(n396), .Y(n397) );
  AOI22X1 U533 ( .A(n818), .B(n25), .C(n23), .D(n891), .Y(n396) );
  XOR2X1 U534 ( .A(n694), .B(n5), .Y(n552) );
  OAI21X1 U535 ( .A(n764), .B(n7), .C(n398), .Y(n694) );
  AOI22X1 U536 ( .A(n818), .B(n23), .C(n21), .D(n891), .Y(n398) );
  XOR2X1 U537 ( .A(n695), .B(n5), .Y(n553) );
  OAI21X1 U538 ( .A(n765), .B(n7), .C(n903), .Y(n695) );
  INVX2 U541 ( .A(n1), .Y(n554) );
  XOR2X1 U542 ( .A(n713), .B(n1), .Y(n555) );
  OAI21X1 U543 ( .A(n4), .B(n748), .C(n731), .Y(n713) );
  NAND2X1 U544 ( .A(n51), .B(n896), .Y(n731) );
  XOR2X1 U545 ( .A(n714), .B(n1), .Y(n556) );
  OAI21X1 U546 ( .A(n4), .B(n749), .C(n732), .Y(n714) );
  AOI21X1 U547 ( .A(n49), .B(n896), .C(n400), .Y(n732) );
  AND2X2 U548 ( .A(n895), .B(n51), .Y(n400) );
  XOR2X1 U549 ( .A(n715), .B(n1), .Y(n557) );
  OAI21X1 U550 ( .A(n4), .B(n750), .C(n733), .Y(n715) );
  AOI21X1 U551 ( .A(n47), .B(n896), .C(n402), .Y(n733) );
  INVX2 U552 ( .A(n401), .Y(n402) );
  AOI22X1 U553 ( .A(n819), .B(n51), .C(n49), .D(n895), .Y(n401) );
  XOR2X1 U554 ( .A(n716), .B(n1), .Y(n558) );
  OAI21X1 U555 ( .A(n4), .B(n751), .C(n734), .Y(n716) );
  AOI21X1 U556 ( .A(n45), .B(n896), .C(n404), .Y(n734) );
  INVX2 U557 ( .A(n403), .Y(n404) );
  AOI22X1 U558 ( .A(n819), .B(n49), .C(n47), .D(n895), .Y(n403) );
  XOR2X1 U559 ( .A(n717), .B(n1), .Y(n559) );
  OAI21X1 U560 ( .A(n4), .B(n752), .C(n735), .Y(n717) );
  AOI21X1 U561 ( .A(n43), .B(n896), .C(n406), .Y(n735) );
  INVX2 U562 ( .A(n405), .Y(n406) );
  AOI22X1 U563 ( .A(n819), .B(n47), .C(n45), .D(n895), .Y(n405) );
  XOR2X1 U564 ( .A(n718), .B(n1), .Y(n560) );
  OAI21X1 U565 ( .A(n4), .B(n753), .C(n736), .Y(n718) );
  AOI21X1 U566 ( .A(n41), .B(n896), .C(n408), .Y(n736) );
  INVX2 U567 ( .A(n407), .Y(n408) );
  AOI22X1 U568 ( .A(n819), .B(n45), .C(n43), .D(n895), .Y(n407) );
  XOR2X1 U569 ( .A(n719), .B(n1), .Y(n561) );
  OAI21X1 U570 ( .A(n4), .B(n754), .C(n737), .Y(n719) );
  AOI21X1 U571 ( .A(n39), .B(n896), .C(n410), .Y(n737) );
  INVX2 U572 ( .A(n409), .Y(n410) );
  AOI22X1 U573 ( .A(n819), .B(n43), .C(n41), .D(n895), .Y(n409) );
  XOR2X1 U574 ( .A(n720), .B(n1), .Y(n562) );
  OAI21X1 U575 ( .A(n4), .B(n755), .C(n738), .Y(n720) );
  AOI21X1 U576 ( .A(n37), .B(n896), .C(n412), .Y(n738) );
  INVX2 U577 ( .A(n411), .Y(n412) );
  AOI22X1 U578 ( .A(n819), .B(n41), .C(n39), .D(n895), .Y(n411) );
  XOR2X1 U579 ( .A(n721), .B(n1), .Y(n563) );
  OAI21X1 U580 ( .A(n4), .B(n756), .C(n739), .Y(n721) );
  AOI21X1 U581 ( .A(n35), .B(n896), .C(n414), .Y(n739) );
  INVX2 U582 ( .A(n413), .Y(n414) );
  AOI22X1 U583 ( .A(n819), .B(n39), .C(n37), .D(n895), .Y(n413) );
  XOR2X1 U584 ( .A(n722), .B(n1), .Y(n564) );
  OAI21X1 U585 ( .A(n3), .B(n757), .C(n740), .Y(n722) );
  AOI21X1 U586 ( .A(n33), .B(n896), .C(n416), .Y(n740) );
  INVX2 U587 ( .A(n415), .Y(n416) );
  AOI22X1 U588 ( .A(n819), .B(n37), .C(n35), .D(n895), .Y(n415) );
  XOR2X1 U589 ( .A(n723), .B(n1), .Y(n565) );
  OAI21X1 U590 ( .A(n3), .B(n758), .C(n741), .Y(n723) );
  AOI21X1 U591 ( .A(n31), .B(n896), .C(n418), .Y(n741) );
  INVX2 U592 ( .A(n417), .Y(n418) );
  AOI22X1 U593 ( .A(n819), .B(n35), .C(n33), .D(n895), .Y(n417) );
  XOR2X1 U594 ( .A(n724), .B(n1), .Y(n566) );
  OAI21X1 U595 ( .A(n3), .B(n759), .C(n742), .Y(n724) );
  AOI21X1 U596 ( .A(n29), .B(n896), .C(n420), .Y(n742) );
  INVX2 U597 ( .A(n419), .Y(n420) );
  AOI22X1 U598 ( .A(n819), .B(n33), .C(n31), .D(n895), .Y(n419) );
  XOR2X1 U599 ( .A(n725), .B(n1), .Y(n567) );
  OAI21X1 U600 ( .A(n3), .B(n760), .C(n743), .Y(n725) );
  AOI21X1 U601 ( .A(n27), .B(n896), .C(n422), .Y(n743) );
  INVX2 U602 ( .A(n421), .Y(n422) );
  AOI22X1 U603 ( .A(n819), .B(n31), .C(n29), .D(n895), .Y(n421) );
  XOR2X1 U604 ( .A(n726), .B(n1), .Y(n568) );
  OAI21X1 U605 ( .A(n3), .B(n761), .C(n744), .Y(n726) );
  AOI21X1 U606 ( .A(n25), .B(n896), .C(n424), .Y(n744) );
  INVX2 U607 ( .A(n423), .Y(n424) );
  AOI22X1 U608 ( .A(n819), .B(n29), .C(n27), .D(n895), .Y(n423) );
  XOR2X1 U609 ( .A(n727), .B(n1), .Y(n569) );
  OAI21X1 U610 ( .A(n3), .B(n762), .C(n745), .Y(n727) );
  AOI21X1 U611 ( .A(n23), .B(n896), .C(n426), .Y(n745) );
  INVX2 U612 ( .A(n425), .Y(n426) );
  AOI22X1 U613 ( .A(n819), .B(n27), .C(n25), .D(n895), .Y(n425) );
  XOR2X1 U614 ( .A(n728), .B(n1), .Y(n570) );
  OAI21X1 U615 ( .A(n3), .B(n763), .C(n746), .Y(n728) );
  AOI21X1 U616 ( .A(n21), .B(n896), .C(n428), .Y(n746) );
  INVX2 U617 ( .A(n427), .Y(n428) );
  AOI22X1 U618 ( .A(n819), .B(n25), .C(n23), .D(n895), .Y(n427) );
  XOR2X1 U619 ( .A(n729), .B(n1), .Y(n571) );
  OAI21X1 U620 ( .A(n764), .B(n3), .C(n429), .Y(n729) );
  AOI22X1 U621 ( .A(n819), .B(n23), .C(n21), .D(n895), .Y(n429) );
  XOR2X1 U622 ( .A(n730), .B(n1), .Y(n572) );
  OAI21X1 U623 ( .A(n765), .B(n3), .C(n902), .Y(n730) );
  INVX2 U662 ( .A(n782), .Y(n836) );
  XNOR2X1 U663 ( .A(b[14]), .B(b[15]), .Y(n782) );
  AND2X2 U665 ( .A(n793), .B(n783), .Y(n431) );
  OR2X2 U666 ( .A(n783), .B(n432), .Y(n803) );
  INVX2 U667 ( .A(n793), .Y(n432) );
  INVX2 U669 ( .A(n788), .Y(n433) );
  NOR2X1 U670 ( .A(n783), .B(n793), .Y(n837) );
  XNOR2X1 U671 ( .A(b[12]), .B(b[13]), .Y(n788) );
  XNOR2X1 U672 ( .A(b[11]), .B(b[12]), .Y(n783) );
  XOR2X1 U673 ( .A(b[13]), .B(b[14]), .Y(n793) );
  AND2X2 U675 ( .A(n794), .B(n784), .Y(n434) );
  OR2X2 U676 ( .A(n784), .B(n435), .Y(n804) );
  INVX2 U677 ( .A(n794), .Y(n435) );
  INVX2 U679 ( .A(n789), .Y(n436) );
  NOR2X1 U680 ( .A(n784), .B(n794), .Y(n838) );
  XNOR2X1 U681 ( .A(b[9]), .B(b[10]), .Y(n789) );
  XNOR2X1 U682 ( .A(b[8]), .B(b[9]), .Y(n784) );
  XOR2X1 U683 ( .A(b[10]), .B(b[11]), .Y(n794) );
  AND2X2 U685 ( .A(n795), .B(n785), .Y(n437) );
  OR2X2 U686 ( .A(n785), .B(n438), .Y(n805) );
  INVX2 U687 ( .A(n795), .Y(n438) );
  INVX2 U689 ( .A(n790), .Y(n439) );
  NOR2X1 U690 ( .A(n785), .B(n795), .Y(n839) );
  XNOR2X1 U691 ( .A(b[6]), .B(b[7]), .Y(n790) );
  XNOR2X1 U692 ( .A(b[5]), .B(b[6]), .Y(n785) );
  XOR2X1 U693 ( .A(b[7]), .B(b[8]), .Y(n795) );
  AND2X2 U695 ( .A(n796), .B(n786), .Y(n440) );
  OR2X2 U696 ( .A(n786), .B(n441), .Y(n806) );
  INVX2 U697 ( .A(n796), .Y(n441) );
  INVX2 U699 ( .A(n791), .Y(n442) );
  NOR2X1 U700 ( .A(n786), .B(n796), .Y(n840) );
  XNOR2X1 U701 ( .A(b[3]), .B(b[4]), .Y(n791) );
  XNOR2X1 U702 ( .A(b[2]), .B(b[3]), .Y(n786) );
  XOR2X1 U703 ( .A(b[4]), .B(b[5]), .Y(n796) );
  AND2X2 U705 ( .A(n797), .B(n792), .Y(n443) );
  OR2X2 U706 ( .A(n787), .B(n444), .Y(n807) );
  INVX2 U707 ( .A(n797), .Y(n444) );
  INVX2 U709 ( .A(n792), .Y(n445) );
  NOR2X1 U710 ( .A(n787), .B(n797), .Y(n841) );
  XNOR2X1 U711 ( .A(b[0]), .B(b[1]), .Y(n792) );
  INVX2 U712 ( .A(b[0]), .Y(n787) );
  XOR2X1 U713 ( .A(b[1]), .B(b[2]), .Y(n797) );
  HAX1 U714 ( .A(a[30]), .B(n446), .YC(n461), .YS(n462) );
  FAX1 U715 ( .A(a[30]), .B(a[29]), .C(n447), .YC(n446), .YS(n463) );
  FAX1 U716 ( .A(a[29]), .B(a[28]), .C(n448), .YC(n447), .YS(n464) );
  FAX1 U717 ( .A(a[28]), .B(a[27]), .C(n449), .YC(n448), .YS(n465) );
  FAX1 U718 ( .A(a[27]), .B(a[26]), .C(n450), .YC(n449), .YS(n466) );
  FAX1 U719 ( .A(a[26]), .B(a[25]), .C(n451), .YC(n450), .YS(n467) );
  FAX1 U720 ( .A(a[25]), .B(a[24]), .C(n452), .YC(n451), .YS(n468) );
  FAX1 U721 ( .A(a[24]), .B(a[23]), .C(n453), .YC(n452), .YS(n469) );
  FAX1 U722 ( .A(a[23]), .B(a[22]), .C(n454), .YC(n453), .YS(n470) );
  FAX1 U723 ( .A(a[22]), .B(a[21]), .C(n455), .YC(n454), .YS(n471) );
  FAX1 U724 ( .A(a[21]), .B(a[20]), .C(n456), .YC(n455), .YS(n472) );
  FAX1 U725 ( .A(a[20]), .B(a[19]), .C(n457), .YC(n456), .YS(n473) );
  FAX1 U726 ( .A(a[19]), .B(a[18]), .C(n458), .YC(n457), .YS(n474) );
  FAX1 U727 ( .A(a[18]), .B(a[17]), .C(n459), .YC(n458), .YS(n475) );
  FAX1 U728 ( .A(a[17]), .B(a[16]), .C(n460), .YC(n459), .YS(n476) );
  HAX1 U729 ( .A(a[16]), .B(a[15]), .YC(n460), .YS(n477) );
  AND2X2 U733 ( .A(n782), .B(b[15]), .Y(n890) );
  AND2X2 U734 ( .A(n786), .B(n442), .Y(n891) );
  AND2X2 U735 ( .A(n785), .B(n439), .Y(n892) );
  AND2X2 U736 ( .A(n784), .B(n436), .Y(n893) );
  AND2X2 U737 ( .A(n783), .B(n433), .Y(n894) );
  AND2X2 U738 ( .A(n787), .B(n445), .Y(n895) );
  AND2X2 U739 ( .A(n787), .B(n443), .Y(n896) );
  AND2X2 U740 ( .A(n791), .B(n440), .Y(n897) );
  AND2X2 U741 ( .A(n790), .B(n437), .Y(n898) );
  AND2X2 U742 ( .A(n789), .B(n434), .Y(n899) );
  AND2X2 U743 ( .A(n788), .B(n431), .Y(n900) );
  NAND2X1 U744 ( .A(n890), .B(n51), .Y(n901) );
  NAND2X1 U745 ( .A(n819), .B(n21), .Y(n902) );
  NAND2X1 U746 ( .A(n818), .B(n21), .Y(n903) );
  NAND2X1 U747 ( .A(n817), .B(n21), .Y(n904) );
  NAND2X1 U748 ( .A(n816), .B(n21), .Y(n905) );
  NAND2X1 U749 ( .A(n815), .B(n21), .Y(n906) );
  BUFX2 U750 ( .A(n806), .Y(n7) );
  BUFX2 U751 ( .A(n803), .Y(n19) );
  BUFX2 U752 ( .A(n805), .Y(n11) );
  BUFX2 U753 ( .A(n804), .Y(n15) );
  BUFX2 U754 ( .A(n807), .Y(n3) );
  BUFX2 U755 ( .A(n806), .Y(n8) );
  BUFX2 U756 ( .A(n805), .Y(n12) );
  BUFX2 U757 ( .A(n804), .Y(n16) );
  BUFX2 U758 ( .A(n803), .Y(n20) );
  BUFX2 U759 ( .A(n807), .Y(n4) );
  BUFX2 U760 ( .A(n841), .Y(n819) );
  BUFX2 U761 ( .A(n840), .Y(n818) );
  BUFX2 U762 ( .A(n839), .Y(n817) );
  BUFX2 U763 ( .A(n838), .Y(n816) );
  BUFX2 U764 ( .A(n837), .Y(n815) );
  INVX2 U765 ( .A(n461), .Y(n748) );
  INVX2 U766 ( .A(n476), .Y(n763) );
  INVX2 U767 ( .A(n474), .Y(n761) );
  INVX2 U768 ( .A(n475), .Y(n762) );
  INVX2 U769 ( .A(n473), .Y(n760) );
  INVX2 U770 ( .A(n472), .Y(n759) );
  INVX2 U771 ( .A(n471), .Y(n758) );
  INVX2 U772 ( .A(n470), .Y(n757) );
  INVX2 U773 ( .A(n469), .Y(n756) );
  INVX2 U774 ( .A(n467), .Y(n754) );
  INVX2 U775 ( .A(n468), .Y(n755) );
  INVX2 U776 ( .A(n466), .Y(n753) );
  INVX2 U777 ( .A(n464), .Y(n751) );
  INVX2 U778 ( .A(n465), .Y(n752) );
  INVX2 U779 ( .A(n463), .Y(n750) );
  INVX2 U780 ( .A(n462), .Y(n749) );
  INVX2 U781 ( .A(n477), .Y(n764) );
  BUFX4 U782 ( .A(b[2]), .Y(n1) );
  BUFX4 U783 ( .A(b[5]), .Y(n5) );
  BUFX4 U784 ( .A(b[8]), .Y(n9) );
  BUFX4 U785 ( .A(b[11]), .Y(n13) );
  BUFX4 U786 ( .A(b[14]), .Y(n17) );
  BUFX2 U787 ( .A(a[17]), .Y(n25) );
  BUFX2 U788 ( .A(a[18]), .Y(n27) );
  BUFX2 U789 ( .A(a[19]), .Y(n29) );
  BUFX2 U790 ( .A(a[20]), .Y(n31) );
  BUFX2 U791 ( .A(a[21]), .Y(n33) );
  BUFX2 U792 ( .A(a[22]), .Y(n35) );
  BUFX2 U793 ( .A(a[23]), .Y(n37) );
  BUFX2 U794 ( .A(a[24]), .Y(n39) );
  BUFX2 U795 ( .A(a[25]), .Y(n41) );
  BUFX2 U796 ( .A(a[26]), .Y(n43) );
  BUFX2 U797 ( .A(a[27]), .Y(n45) );
  BUFX2 U798 ( .A(a[28]), .Y(n47) );
  BUFX2 U799 ( .A(a[29]), .Y(n49) );
  BUFX2 U800 ( .A(a[16]), .Y(n23) );
  BUFX2 U801 ( .A(a[15]), .Y(n21) );
  BUFX2 U802 ( .A(a[30]), .Y(n51) );
  INVX2 U803 ( .A(a[15]), .Y(n765) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_add_0 add_41 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .SUM(large_sum) );
  alu_DW01_sub_0 sub_44 ( .A({src1_data[16], src1_data}), .B({src2_data[16], 
        src2_data}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW_mult_uns_1 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b(src2_data[15:0]), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U4 ( .A(n25), .Y(n8) );
  BUFX2 U7 ( .A(n5), .Y(n1) );
  INVX2 U8 ( .A(n42), .Y(n6) );
  BUFX2 U9 ( .A(n7), .Y(n2) );
  NAND2X1 U10 ( .A(n3), .B(n4), .Y(result[9]) );
  AOI22X1 U11 ( .A(src1_data[9]), .B(n1), .C(full_mult[39]), .D(n6), .Y(n4) );
  AOI22X1 U12 ( .A(large_dif[9]), .B(n2), .C(large_sum[9]), .D(n8), .Y(n3) );
  NAND2X1 U13 ( .A(n9), .B(n10), .Y(result[8]) );
  AOI22X1 U14 ( .A(src1_data[8]), .B(n1), .C(full_mult[38]), .D(n6), .Y(n10)
         );
  AOI22X1 U15 ( .A(large_dif[8]), .B(n2), .C(large_sum[8]), .D(n8), .Y(n9) );
  NAND2X1 U16 ( .A(n11), .B(n12), .Y(result[7]) );
  AOI22X1 U17 ( .A(src1_data[7]), .B(n1), .C(full_mult[37]), .D(n6), .Y(n12)
         );
  AOI22X1 U18 ( .A(large_dif[7]), .B(n2), .C(large_sum[7]), .D(n8), .Y(n11) );
  NAND2X1 U19 ( .A(n13), .B(n14), .Y(result[6]) );
  AOI22X1 U20 ( .A(src1_data[6]), .B(n1), .C(full_mult[36]), .D(n6), .Y(n14)
         );
  AOI22X1 U21 ( .A(large_dif[6]), .B(n2), .C(large_sum[6]), .D(n8), .Y(n13) );
  NAND2X1 U22 ( .A(n15), .B(n16), .Y(result[5]) );
  AOI22X1 U23 ( .A(src1_data[5]), .B(n1), .C(full_mult[35]), .D(n6), .Y(n16)
         );
  AOI22X1 U24 ( .A(large_dif[5]), .B(n2), .C(large_sum[5]), .D(n8), .Y(n15) );
  NAND2X1 U25 ( .A(n17), .B(n18), .Y(result[4]) );
  AOI22X1 U26 ( .A(src1_data[4]), .B(n1), .C(full_mult[34]), .D(n6), .Y(n18)
         );
  AOI22X1 U27 ( .A(large_dif[4]), .B(n2), .C(large_sum[4]), .D(n8), .Y(n17) );
  NAND2X1 U28 ( .A(n19), .B(n20), .Y(result[3]) );
  AOI22X1 U29 ( .A(src1_data[3]), .B(n1), .C(full_mult[33]), .D(n6), .Y(n20)
         );
  AOI22X1 U30 ( .A(large_dif[3]), .B(n2), .C(large_sum[3]), .D(n8), .Y(n19) );
  NAND2X1 U31 ( .A(n21), .B(n22), .Y(result[2]) );
  AOI22X1 U32 ( .A(src1_data[2]), .B(n1), .C(full_mult[32]), .D(n6), .Y(n22)
         );
  AOI22X1 U33 ( .A(large_dif[2]), .B(n2), .C(large_sum[2]), .D(n8), .Y(n21) );
  NAND2X1 U34 ( .A(n23), .B(n24), .Y(result[1]) );
  AOI22X1 U35 ( .A(src1_data[1]), .B(n1), .C(full_mult[31]), .D(n6), .Y(n24)
         );
  AOI22X1 U36 ( .A(large_dif[1]), .B(n2), .C(large_sum[1]), .D(n8), .Y(n23) );
  OAI21X1 U37 ( .A(n25), .B(n26), .C(n27), .Y(result[16]) );
  AOI22X1 U38 ( .A(src1_data[16]), .B(n1), .C(large_dif[16]), .D(n2), .Y(n27)
         );
  INVX1 U39 ( .A(large_sum[16]), .Y(n26) );
  NAND2X1 U40 ( .A(n28), .B(n29), .Y(result[15]) );
  AOI22X1 U41 ( .A(src1_data[15]), .B(n1), .C(full_mult[45]), .D(n6), .Y(n29)
         );
  AOI22X1 U42 ( .A(large_dif[15]), .B(n2), .C(large_sum[15]), .D(n8), .Y(n28)
         );
  NAND2X1 U43 ( .A(n30), .B(n31), .Y(result[14]) );
  AOI22X1 U44 ( .A(src1_data[14]), .B(n1), .C(full_mult[44]), .D(n6), .Y(n31)
         );
  AOI22X1 U45 ( .A(large_dif[14]), .B(n2), .C(large_sum[14]), .D(n8), .Y(n30)
         );
  NAND2X1 U46 ( .A(n32), .B(n33), .Y(result[13]) );
  AOI22X1 U47 ( .A(src1_data[13]), .B(n1), .C(full_mult[43]), .D(n6), .Y(n33)
         );
  AOI22X1 U48 ( .A(large_dif[13]), .B(n2), .C(large_sum[13]), .D(n8), .Y(n32)
         );
  NAND2X1 U49 ( .A(n34), .B(n35), .Y(result[12]) );
  AOI22X1 U50 ( .A(src1_data[12]), .B(n1), .C(full_mult[42]), .D(n6), .Y(n35)
         );
  AOI22X1 U51 ( .A(large_dif[12]), .B(n2), .C(large_sum[12]), .D(n8), .Y(n34)
         );
  NAND2X1 U52 ( .A(n36), .B(n37), .Y(result[11]) );
  AOI22X1 U53 ( .A(src1_data[11]), .B(n1), .C(full_mult[41]), .D(n6), .Y(n37)
         );
  AOI22X1 U54 ( .A(large_dif[11]), .B(n2), .C(large_sum[11]), .D(n8), .Y(n36)
         );
  NAND2X1 U55 ( .A(n38), .B(n39), .Y(result[10]) );
  AOI22X1 U56 ( .A(src1_data[10]), .B(n1), .C(full_mult[40]), .D(n6), .Y(n39)
         );
  AOI22X1 U57 ( .A(large_dif[10]), .B(n2), .C(large_sum[10]), .D(n8), .Y(n38)
         );
  NAND2X1 U58 ( .A(n40), .B(n41), .Y(result[0]) );
  AOI22X1 U59 ( .A(src1_data[0]), .B(n1), .C(full_mult[30]), .D(n6), .Y(n41)
         );
  NOR2X1 U60 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n5) );
  AOI22X1 U61 ( .A(large_dif[0]), .B(n2), .C(large_sum[0]), .D(n8), .Y(n40) );
  OAI21X1 U62 ( .A(n42), .B(n43), .C(n44), .Y(overflow) );
  AOI22X1 U63 ( .A(n2), .B(n45), .C(n8), .D(n46), .Y(n44) );
  XOR2X1 U64 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n46) );
  NAND2X1 U65 ( .A(alu_op[0]), .B(n47), .Y(n25) );
  XOR2X1 U66 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n45) );
  NOR2X1 U67 ( .A(n47), .B(alu_op[0]), .Y(n7) );
  INVX1 U68 ( .A(alu_op[1]), .Y(n47) );
  INVX1 U69 ( .A(N26), .Y(n43) );
  NAND2X1 U70 ( .A(alu_op[1]), .B(alu_op[0]), .Y(n42) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n54, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40,
         n42, n44, n46, n48, n50, n52, n53;

  DFFSR \value_reg[16]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(n54)
         );
  DFFSR \value_reg[15]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n54), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(current_value[16]) );
  INVX1 U4 ( .A(n3), .Y(n22) );
  MUX2X1 U5 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n3) );
  INVX1 U6 ( .A(n4), .Y(n24) );
  MUX2X1 U7 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n4) );
  INVX1 U8 ( .A(n5), .Y(n26) );
  MUX2X1 U9 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n5) );
  INVX1 U10 ( .A(n6), .Y(n28) );
  MUX2X1 U11 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n6) );
  INVX1 U12 ( .A(n7), .Y(n30) );
  MUX2X1 U13 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n7) );
  INVX1 U14 ( .A(n8), .Y(n32) );
  MUX2X1 U15 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n8) );
  INVX1 U16 ( .A(n9), .Y(n34) );
  MUX2X1 U17 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n9) );
  INVX1 U18 ( .A(n10), .Y(n36) );
  MUX2X1 U19 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n10) );
  INVX1 U20 ( .A(n11), .Y(n38) );
  MUX2X1 U21 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(
        n11) );
  INVX1 U22 ( .A(n12), .Y(n40) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX1 U24 ( .A(n13), .Y(n42) );
  MUX2X1 U25 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n13) );
  INVX1 U26 ( .A(n14), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n14) );
  INVX1 U28 ( .A(n15), .Y(n46) );
  MUX2X1 U29 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n15) );
  INVX1 U30 ( .A(n16), .Y(n48) );
  MUX2X1 U31 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n16) );
  INVX1 U32 ( .A(n17), .Y(n50) );
  MUX2X1 U33 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n17) );
  INVX1 U34 ( .A(n18), .Y(n52) );
  MUX2X1 U35 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n18) );
  INVX1 U36 ( .A(n20), .Y(n53) );
  MUX2X1 U54 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n20) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50;

  DFFSR \value_reg[16]  ( .D(n18), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n30), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n32), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n34), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n36), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n38), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n40), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n42), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n44), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n46), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n48), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n1), .Y(n18) );
  MUX2X1 U3 ( .B(current_value[16]), .A(new_value[16]), .S(write_enable), .Y(
        n1) );
  INVX1 U4 ( .A(n2), .Y(n20) );
  MUX2X1 U5 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n22) );
  MUX2X1 U7 ( .B(current_value[14]), .A(new_value[14]), .S(write_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n24) );
  MUX2X1 U9 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n26) );
  MUX2X1 U11 ( .B(current_value[12]), .A(new_value[12]), .S(write_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n28) );
  MUX2X1 U13 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n30) );
  MUX2X1 U15 ( .B(current_value[10]), .A(new_value[10]), .S(write_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n32) );
  MUX2X1 U17 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n34) );
  MUX2X1 U19 ( .B(current_value[8]), .A(new_value[8]), .S(write_enable), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n36) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n10) );
  INVX1 U22 ( .A(n11), .Y(n38) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(write_enable), .Y(
        n11) );
  INVX1 U24 ( .A(n12), .Y(n40) );
  MUX2X1 U25 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n12) );
  INVX1 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[4]), .A(new_value[4]), .S(write_enable), .Y(
        n13) );
  INVX1 U28 ( .A(n14), .Y(n44) );
  MUX2X1 U29 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(
        n14) );
  INVX1 U30 ( .A(n15), .Y(n46) );
  MUX2X1 U31 ( .B(current_value[2]), .A(new_value[2]), .S(write_enable), .Y(
        n15) );
  INVX1 U32 ( .A(n16), .Y(n48) );
  MUX2X1 U33 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(
        n16) );
  INVX1 U34 ( .A(n17), .Y(n50) );
  MUX2X1 U35 ( .B(current_value[0]), .A(new_value[0]), .S(write_enable), .Y(
        n17) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n32), .new_value(w_data), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n25), .new_value(w_data), .current_value({
        \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] , 
        \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] , 
        \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] , 
        \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] , 
        \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] , 
        \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n24), .new_value(w_data), .current_value({
        \regs_matrix[2][16] , \regs_matrix[2][15] , \regs_matrix[2][14] , 
        \regs_matrix[2][13] , \regs_matrix[2][12] , \regs_matrix[2][11] , 
        \regs_matrix[2][10] , \regs_matrix[2][9] , \regs_matrix[2][8] , 
        \regs_matrix[2][7] , \regs_matrix[2][6] , \regs_matrix[2][5] , 
        \regs_matrix[2][4] , \regs_matrix[2][3] , \regs_matrix[2][2] , 
        \regs_matrix[2][1] , \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n23), .new_value(w_data), .current_value({
        \regs_matrix[3][16] , \regs_matrix[3][15] , \regs_matrix[3][14] , 
        \regs_matrix[3][13] , \regs_matrix[3][12] , \regs_matrix[3][11] , 
        \regs_matrix[3][10] , \regs_matrix[3][9] , \regs_matrix[3][8] , 
        \regs_matrix[3][7] , \regs_matrix[3][6] , \regs_matrix[3][5] , 
        \regs_matrix[3][4] , \regs_matrix[3][3] , \regs_matrix[3][2] , 
        \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n22), .new_value(w_data), .current_value({
        \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] , 
        \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] , 
        \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] , 
        \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] , 
        \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] , 
        \regs_matrix[4][1] , \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n21), .new_value(w_data), .current_value({
        \regs_matrix[5][16] , \regs_matrix[5][15] , \regs_matrix[5][14] , 
        \regs_matrix[5][13] , \regs_matrix[5][12] , \regs_matrix[5][11] , 
        \regs_matrix[5][10] , \regs_matrix[5][9] , \regs_matrix[5][8] , 
        \regs_matrix[5][7] , \regs_matrix[5][6] , \regs_matrix[5][5] , 
        \regs_matrix[5][4] , \regs_matrix[5][3] , \regs_matrix[5][2] , 
        \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n20), .new_value(w_data), .current_value({
        \regs_matrix[6][16] , \regs_matrix[6][15] , \regs_matrix[6][14] , 
        \regs_matrix[6][13] , \regs_matrix[6][12] , \regs_matrix[6][11] , 
        \regs_matrix[6][10] , \regs_matrix[6][9] , \regs_matrix[6][8] , 
        \regs_matrix[6][7] , \regs_matrix[6][6] , \regs_matrix[6][5] , 
        \regs_matrix[6][4] , \regs_matrix[6][3] , \regs_matrix[6][2] , 
        \regs_matrix[6][1] , \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n19), .new_value(w_data), .current_value({
        \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] , 
        \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] , 
        \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] , 
        \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] , 
        \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] , 
        \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n18), .new_value(w_data), .current_value({
        \regs_matrix[8][16] , \regs_matrix[8][15] , \regs_matrix[8][14] , 
        \regs_matrix[8][13] , \regs_matrix[8][12] , \regs_matrix[8][11] , 
        \regs_matrix[8][10] , \regs_matrix[8][9] , \regs_matrix[8][8] , 
        \regs_matrix[8][7] , \regs_matrix[8][6] , \regs_matrix[8][5] , 
        \regs_matrix[8][4] , \regs_matrix[8][3] , \regs_matrix[8][2] , 
        \regs_matrix[8][1] , \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n17), .new_value(w_data), .current_value({
        \regs_matrix[9][16] , \regs_matrix[9][15] , \regs_matrix[9][14] , 
        \regs_matrix[9][13] , \regs_matrix[9][12] , \regs_matrix[9][11] , 
        \regs_matrix[9][10] , \regs_matrix[9][9] , \regs_matrix[9][8] , 
        \regs_matrix[9][7] , \regs_matrix[9][6] , \regs_matrix[9][5] , 
        \regs_matrix[9][4] , \regs_matrix[9][3] , \regs_matrix[9][2] , 
        \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n31), .new_value(w_data), .current_value({
        \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] , 
        \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] , 
        \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] , 
        \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] , 
        \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] , 
        \regs_matrix[10][1] , \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n30), .new_value(w_data), .current_value({
        \regs_matrix[11][16] , \regs_matrix[11][15] , \regs_matrix[11][14] , 
        \regs_matrix[11][13] , \regs_matrix[11][12] , \regs_matrix[11][11] , 
        \regs_matrix[11][10] , \regs_matrix[11][9] , \regs_matrix[11][8] , 
        \regs_matrix[11][7] , \regs_matrix[11][6] , \regs_matrix[11][5] , 
        \regs_matrix[11][4] , \regs_matrix[11][3] , \regs_matrix[11][2] , 
        \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n29), .new_value(w_data), .current_value({
        \regs_matrix[12][16] , \regs_matrix[12][15] , \regs_matrix[12][14] , 
        \regs_matrix[12][13] , \regs_matrix[12][12] , \regs_matrix[12][11] , 
        \regs_matrix[12][10] , \regs_matrix[12][9] , \regs_matrix[12][8] , 
        \regs_matrix[12][7] , \regs_matrix[12][6] , \regs_matrix[12][5] , 
        \regs_matrix[12][4] , \regs_matrix[12][3] , \regs_matrix[12][2] , 
        \regs_matrix[12][1] , \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n28), .new_value(w_data), .current_value({
        \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] , 
        \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] , 
        \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] , 
        \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] , 
        \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] , 
        \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n27), .new_value(w_data), .current_value({
        \regs_matrix[14][16] , \regs_matrix[14][15] , \regs_matrix[14][14] , 
        \regs_matrix[14][13] , \regs_matrix[14][12] , \regs_matrix[14][11] , 
        \regs_matrix[14][10] , \regs_matrix[14][9] , \regs_matrix[14][8] , 
        \regs_matrix[14][7] , \regs_matrix[14][6] , \regs_matrix[14][5] , 
        \regs_matrix[14][4] , \regs_matrix[14][3] , \regs_matrix[14][2] , 
        \regs_matrix[14][1] , \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n_reset), 
        .write_enable(n26), .new_value(w_data), .current_value({
        \regs_matrix[15][16] , \regs_matrix[15][15] , \regs_matrix[15][14] , 
        \regs_matrix[15][13] , \regs_matrix[15][12] , \regs_matrix[15][11] , 
        \regs_matrix[15][10] , \regs_matrix[15][9] , \regs_matrix[15][8] , 
        \regs_matrix[15][7] , \regs_matrix[15][6] , \regs_matrix[15][5] , 
        \regs_matrix[15][4] , \regs_matrix[15][3] , \regs_matrix[15][2] , 
        \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  OR2X2 U2 ( .A(n662), .B(n664), .Y(n1) );
  OR2X2 U3 ( .A(n666), .B(n668), .Y(n2) );
  OR2X2 U4 ( .A(n664), .B(n668), .Y(n3) );
  OR2X2 U5 ( .A(n666), .B(n667), .Y(n4) );
  OR2X2 U6 ( .A(n664), .B(n667), .Y(n5) );
  OR2X2 U7 ( .A(n665), .B(n666), .Y(n6) );
  OR2X2 U8 ( .A(n664), .B(n665), .Y(n7) );
  OR2X2 U9 ( .A(n662), .B(n663), .Y(n8) );
  OR2X2 U10 ( .A(n661), .B(n662), .Y(n9) );
  OR2X2 U11 ( .A(n663), .B(n668), .Y(n10) );
  OR2X2 U12 ( .A(n661), .B(n668), .Y(n11) );
  OR2X2 U13 ( .A(n663), .B(n667), .Y(n12) );
  OR2X2 U14 ( .A(n661), .B(n667), .Y(n13) );
  OR2X2 U15 ( .A(n663), .B(n665), .Y(n14) );
  OR2X2 U16 ( .A(n661), .B(n665), .Y(n15) );
  OR2X2 U17 ( .A(n662), .B(n666), .Y(n16) );
  INVX2 U18 ( .A(n9), .Y(n17) );
  INVX2 U19 ( .A(n8), .Y(n18) );
  INVX2 U20 ( .A(n7), .Y(n19) );
  INVX2 U21 ( .A(n6), .Y(n20) );
  INVX2 U22 ( .A(n5), .Y(n21) );
  INVX2 U23 ( .A(n4), .Y(n22) );
  INVX2 U24 ( .A(n3), .Y(n23) );
  INVX2 U25 ( .A(n2), .Y(n24) );
  INVX2 U26 ( .A(n1), .Y(n25) );
  INVX2 U27 ( .A(n15), .Y(n26) );
  INVX2 U28 ( .A(n14), .Y(n27) );
  INVX2 U29 ( .A(n13), .Y(n28) );
  INVX2 U30 ( .A(n12), .Y(n29) );
  INVX2 U31 ( .A(n11), .Y(n30) );
  INVX2 U32 ( .A(n10), .Y(n31) );
  INVX2 U33 ( .A(n16), .Y(n32) );
  BUFX2 U34 ( .A(n341), .Y(n33) );
  BUFX2 U35 ( .A(n647), .Y(n34) );
  BUFX2 U36 ( .A(n641), .Y(n35) );
  BUFX2 U37 ( .A(n335), .Y(n36) );
  BUFX2 U38 ( .A(n338), .Y(n37) );
  BUFX2 U39 ( .A(n644), .Y(n38) );
  BUFX2 U40 ( .A(n639), .Y(n39) );
  BUFX2 U41 ( .A(n333), .Y(n40) );
  BUFX2 U42 ( .A(n649), .Y(n41) );
  BUFX2 U43 ( .A(n343), .Y(n42) );
  BUFX2 U44 ( .A(n640), .Y(n43) );
  BUFX2 U45 ( .A(n334), .Y(n44) );
  BUFX2 U46 ( .A(n648), .Y(n45) );
  BUFX2 U47 ( .A(n638), .Y(n46) );
  BUFX2 U48 ( .A(n332), .Y(n47) );
  BUFX2 U49 ( .A(n342), .Y(n48) );
  NOR2X1 U50 ( .A(n353), .B(N12), .Y(n51) );
  NAND2X1 U51 ( .A(n51), .B(N10), .Y(n333) );
  NOR2X1 U52 ( .A(N11), .B(N12), .Y(n52) );
  NAND2X1 U53 ( .A(n52), .B(N10), .Y(n332) );
  OAI22X1 U54 ( .A(\regs_matrix[11][0] ), .B(n333), .C(\regs_matrix[9][0] ), 
        .D(n332), .Y(n50) );
  NOR2X1 U55 ( .A(n354), .B(n353), .Y(n55) );
  NAND2X1 U56 ( .A(N10), .B(n55), .Y(n335) );
  NOR2X1 U57 ( .A(n354), .B(N11), .Y(n56) );
  NAND2X1 U58 ( .A(n56), .B(N10), .Y(n334) );
  OAI22X1 U59 ( .A(\regs_matrix[15][0] ), .B(n335), .C(\regs_matrix[13][0] ), 
        .D(n334), .Y(n49) );
  NOR2X1 U60 ( .A(n50), .B(n49), .Y(n68) );
  NAND2X1 U61 ( .A(n51), .B(n352), .Y(n341) );
  NAND2X1 U62 ( .A(n52), .B(n352), .Y(n338) );
  NOR2X1 U63 ( .A(\regs_matrix[8][0] ), .B(n338), .Y(n53) );
  NOR2X1 U64 ( .A(n351), .B(n53), .Y(n54) );
  OAI21X1 U65 ( .A(\regs_matrix[10][0] ), .B(n341), .C(n54), .Y(n58) );
  NAND2X1 U66 ( .A(n55), .B(n352), .Y(n343) );
  NAND2X1 U67 ( .A(n56), .B(n352), .Y(n342) );
  OAI22X1 U68 ( .A(\regs_matrix[14][0] ), .B(n343), .C(\regs_matrix[12][0] ), 
        .D(n342), .Y(n57) );
  NOR2X1 U69 ( .A(n58), .B(n57), .Y(n67) );
  OAI22X1 U70 ( .A(\regs_matrix[3][0] ), .B(n333), .C(\regs_matrix[1][0] ), 
        .D(n332), .Y(n60) );
  OAI22X1 U71 ( .A(\regs_matrix[7][0] ), .B(n335), .C(\regs_matrix[5][0] ), 
        .D(n334), .Y(n59) );
  NOR2X1 U72 ( .A(n60), .B(n59), .Y(n66) );
  NOR2X1 U73 ( .A(outreg_data[0]), .B(n338), .Y(n61) );
  NOR2X1 U74 ( .A(N13), .B(n61), .Y(n62) );
  OAI21X1 U75 ( .A(\regs_matrix[2][0] ), .B(n341), .C(n62), .Y(n64) );
  OAI22X1 U76 ( .A(\regs_matrix[6][0] ), .B(n343), .C(\regs_matrix[4][0] ), 
        .D(n342), .Y(n63) );
  NOR2X1 U77 ( .A(n64), .B(n63), .Y(n65) );
  AOI22X1 U78 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n69) );
  OAI22X1 U79 ( .A(\regs_matrix[11][1] ), .B(n333), .C(\regs_matrix[9][1] ), 
        .D(n332), .Y(n71) );
  OAI22X1 U80 ( .A(\regs_matrix[15][1] ), .B(n335), .C(\regs_matrix[13][1] ), 
        .D(n334), .Y(n70) );
  NOR2X1 U81 ( .A(n71), .B(n70), .Y(n85) );
  NOR2X1 U82 ( .A(\regs_matrix[8][1] ), .B(n338), .Y(n72) );
  NOR2X1 U83 ( .A(n351), .B(n72), .Y(n73) );
  OAI21X1 U84 ( .A(\regs_matrix[10][1] ), .B(n341), .C(n73), .Y(n75) );
  OAI22X1 U85 ( .A(\regs_matrix[14][1] ), .B(n343), .C(\regs_matrix[12][1] ), 
        .D(n342), .Y(n74) );
  NOR2X1 U86 ( .A(n75), .B(n74), .Y(n84) );
  OAI22X1 U87 ( .A(\regs_matrix[3][1] ), .B(n333), .C(\regs_matrix[1][1] ), 
        .D(n332), .Y(n77) );
  OAI22X1 U88 ( .A(\regs_matrix[7][1] ), .B(n335), .C(\regs_matrix[5][1] ), 
        .D(n334), .Y(n76) );
  NOR2X1 U89 ( .A(n77), .B(n76), .Y(n83) );
  NOR2X1 U90 ( .A(outreg_data[1]), .B(n338), .Y(n78) );
  NOR2X1 U91 ( .A(N13), .B(n78), .Y(n79) );
  OAI21X1 U92 ( .A(\regs_matrix[2][1] ), .B(n341), .C(n79), .Y(n81) );
  OAI22X1 U93 ( .A(\regs_matrix[6][1] ), .B(n343), .C(\regs_matrix[4][1] ), 
        .D(n342), .Y(n80) );
  NOR2X1 U94 ( .A(n81), .B(n80), .Y(n82) );
  AOI22X1 U95 ( .A(n85), .B(n84), .C(n83), .D(n82), .Y(n86) );
  OAI22X1 U96 ( .A(\regs_matrix[11][2] ), .B(n333), .C(\regs_matrix[9][2] ), 
        .D(n332), .Y(n88) );
  OAI22X1 U97 ( .A(\regs_matrix[15][2] ), .B(n335), .C(\regs_matrix[13][2] ), 
        .D(n334), .Y(n87) );
  NOR2X1 U98 ( .A(n88), .B(n87), .Y(n102) );
  NOR2X1 U99 ( .A(\regs_matrix[8][2] ), .B(n338), .Y(n89) );
  NOR2X1 U100 ( .A(n351), .B(n89), .Y(n90) );
  OAI21X1 U101 ( .A(\regs_matrix[10][2] ), .B(n341), .C(n90), .Y(n92) );
  OAI22X1 U102 ( .A(\regs_matrix[14][2] ), .B(n343), .C(\regs_matrix[12][2] ), 
        .D(n342), .Y(n91) );
  NOR2X1 U103 ( .A(n92), .B(n91), .Y(n101) );
  OAI22X1 U104 ( .A(\regs_matrix[3][2] ), .B(n333), .C(\regs_matrix[1][2] ), 
        .D(n332), .Y(n94) );
  OAI22X1 U105 ( .A(\regs_matrix[7][2] ), .B(n335), .C(\regs_matrix[5][2] ), 
        .D(n334), .Y(n93) );
  NOR2X1 U106 ( .A(n94), .B(n93), .Y(n100) );
  NOR2X1 U107 ( .A(outreg_data[2]), .B(n338), .Y(n95) );
  NOR2X1 U108 ( .A(N13), .B(n95), .Y(n96) );
  OAI21X1 U109 ( .A(\regs_matrix[2][2] ), .B(n341), .C(n96), .Y(n98) );
  OAI22X1 U110 ( .A(\regs_matrix[6][2] ), .B(n343), .C(\regs_matrix[4][2] ), 
        .D(n342), .Y(n97) );
  NOR2X1 U111 ( .A(n98), .B(n97), .Y(n99) );
  AOI22X1 U112 ( .A(n102), .B(n101), .C(n100), .D(n99), .Y(n103) );
  OAI22X1 U113 ( .A(\regs_matrix[11][3] ), .B(n333), .C(\regs_matrix[9][3] ), 
        .D(n332), .Y(n105) );
  OAI22X1 U114 ( .A(\regs_matrix[15][3] ), .B(n335), .C(\regs_matrix[13][3] ), 
        .D(n334), .Y(n104) );
  NOR2X1 U115 ( .A(n105), .B(n104), .Y(n119) );
  NOR2X1 U116 ( .A(\regs_matrix[8][3] ), .B(n338), .Y(n106) );
  NOR2X1 U117 ( .A(n351), .B(n106), .Y(n107) );
  OAI21X1 U118 ( .A(\regs_matrix[10][3] ), .B(n341), .C(n107), .Y(n109) );
  OAI22X1 U119 ( .A(\regs_matrix[14][3] ), .B(n343), .C(\regs_matrix[12][3] ), 
        .D(n342), .Y(n108) );
  NOR2X1 U120 ( .A(n109), .B(n108), .Y(n118) );
  OAI22X1 U121 ( .A(\regs_matrix[3][3] ), .B(n333), .C(\regs_matrix[1][3] ), 
        .D(n332), .Y(n111) );
  OAI22X1 U122 ( .A(\regs_matrix[7][3] ), .B(n335), .C(\regs_matrix[5][3] ), 
        .D(n334), .Y(n110) );
  NOR2X1 U123 ( .A(n111), .B(n110), .Y(n117) );
  NOR2X1 U124 ( .A(outreg_data[3]), .B(n338), .Y(n112) );
  NOR2X1 U125 ( .A(N13), .B(n112), .Y(n113) );
  OAI21X1 U126 ( .A(\regs_matrix[2][3] ), .B(n341), .C(n113), .Y(n115) );
  OAI22X1 U127 ( .A(\regs_matrix[6][3] ), .B(n343), .C(\regs_matrix[4][3] ), 
        .D(n342), .Y(n114) );
  NOR2X1 U128 ( .A(n115), .B(n114), .Y(n116) );
  AOI22X1 U129 ( .A(n119), .B(n118), .C(n117), .D(n116), .Y(n120) );
  OAI22X1 U130 ( .A(\regs_matrix[11][4] ), .B(n40), .C(\regs_matrix[9][4] ), 
        .D(n332), .Y(n122) );
  OAI22X1 U131 ( .A(\regs_matrix[15][4] ), .B(n36), .C(\regs_matrix[13][4] ), 
        .D(n334), .Y(n121) );
  NOR2X1 U132 ( .A(n122), .B(n121), .Y(n136) );
  NOR2X1 U133 ( .A(\regs_matrix[8][4] ), .B(n338), .Y(n123) );
  NOR2X1 U134 ( .A(n351), .B(n123), .Y(n124) );
  OAI21X1 U135 ( .A(\regs_matrix[10][4] ), .B(n341), .C(n124), .Y(n126) );
  OAI22X1 U136 ( .A(\regs_matrix[14][4] ), .B(n42), .C(\regs_matrix[12][4] ), 
        .D(n342), .Y(n125) );
  NOR2X1 U137 ( .A(n126), .B(n125), .Y(n135) );
  OAI22X1 U138 ( .A(\regs_matrix[3][4] ), .B(n40), .C(\regs_matrix[1][4] ), 
        .D(n47), .Y(n128) );
  OAI22X1 U139 ( .A(\regs_matrix[7][4] ), .B(n36), .C(\regs_matrix[5][4] ), 
        .D(n44), .Y(n127) );
  NOR2X1 U140 ( .A(n128), .B(n127), .Y(n134) );
  NOR2X1 U141 ( .A(outreg_data[4]), .B(n338), .Y(n129) );
  NOR2X1 U142 ( .A(N13), .B(n129), .Y(n130) );
  OAI21X1 U143 ( .A(\regs_matrix[2][4] ), .B(n33), .C(n130), .Y(n132) );
  OAI22X1 U144 ( .A(\regs_matrix[6][4] ), .B(n42), .C(\regs_matrix[4][4] ), 
        .D(n48), .Y(n131) );
  NOR2X1 U145 ( .A(n132), .B(n131), .Y(n133) );
  AOI22X1 U146 ( .A(n136), .B(n135), .C(n134), .D(n133), .Y(n137) );
  OAI22X1 U147 ( .A(\regs_matrix[11][5] ), .B(n40), .C(\regs_matrix[9][5] ), 
        .D(n47), .Y(n139) );
  OAI22X1 U148 ( .A(\regs_matrix[15][5] ), .B(n36), .C(\regs_matrix[13][5] ), 
        .D(n44), .Y(n138) );
  NOR2X1 U149 ( .A(n139), .B(n138), .Y(n153) );
  NOR2X1 U150 ( .A(\regs_matrix[8][5] ), .B(n338), .Y(n140) );
  NOR2X1 U151 ( .A(n351), .B(n140), .Y(n141) );
  OAI21X1 U152 ( .A(\regs_matrix[10][5] ), .B(n33), .C(n141), .Y(n143) );
  OAI22X1 U153 ( .A(\regs_matrix[14][5] ), .B(n42), .C(\regs_matrix[12][5] ), 
        .D(n48), .Y(n142) );
  NOR2X1 U154 ( .A(n143), .B(n142), .Y(n152) );
  OAI22X1 U155 ( .A(\regs_matrix[3][5] ), .B(n40), .C(\regs_matrix[1][5] ), 
        .D(n47), .Y(n145) );
  OAI22X1 U156 ( .A(\regs_matrix[7][5] ), .B(n36), .C(\regs_matrix[5][5] ), 
        .D(n44), .Y(n144) );
  NOR2X1 U157 ( .A(n145), .B(n144), .Y(n151) );
  NOR2X1 U158 ( .A(outreg_data[5]), .B(n338), .Y(n146) );
  NOR2X1 U159 ( .A(N13), .B(n146), .Y(n147) );
  OAI21X1 U160 ( .A(\regs_matrix[2][5] ), .B(n33), .C(n147), .Y(n149) );
  OAI22X1 U161 ( .A(\regs_matrix[6][5] ), .B(n42), .C(\regs_matrix[4][5] ), 
        .D(n48), .Y(n148) );
  NOR2X1 U162 ( .A(n149), .B(n148), .Y(n150) );
  AOI22X1 U163 ( .A(n153), .B(n152), .C(n151), .D(n150), .Y(n154) );
  OAI22X1 U164 ( .A(\regs_matrix[11][6] ), .B(n40), .C(\regs_matrix[9][6] ), 
        .D(n47), .Y(n156) );
  OAI22X1 U165 ( .A(\regs_matrix[15][6] ), .B(n36), .C(\regs_matrix[13][6] ), 
        .D(n44), .Y(n155) );
  NOR2X1 U166 ( .A(n156), .B(n155), .Y(n170) );
  NOR2X1 U167 ( .A(\regs_matrix[8][6] ), .B(n338), .Y(n157) );
  NOR2X1 U168 ( .A(n351), .B(n157), .Y(n158) );
  OAI21X1 U169 ( .A(\regs_matrix[10][6] ), .B(n33), .C(n158), .Y(n160) );
  OAI22X1 U170 ( .A(\regs_matrix[14][6] ), .B(n42), .C(\regs_matrix[12][6] ), 
        .D(n48), .Y(n159) );
  NOR2X1 U171 ( .A(n160), .B(n159), .Y(n169) );
  OAI22X1 U172 ( .A(\regs_matrix[3][6] ), .B(n40), .C(\regs_matrix[1][6] ), 
        .D(n47), .Y(n162) );
  OAI22X1 U173 ( .A(\regs_matrix[7][6] ), .B(n36), .C(\regs_matrix[5][6] ), 
        .D(n44), .Y(n161) );
  NOR2X1 U174 ( .A(n162), .B(n161), .Y(n168) );
  NOR2X1 U175 ( .A(outreg_data[6]), .B(n37), .Y(n163) );
  NOR2X1 U176 ( .A(N13), .B(n163), .Y(n164) );
  OAI21X1 U177 ( .A(\regs_matrix[2][6] ), .B(n33), .C(n164), .Y(n166) );
  OAI22X1 U178 ( .A(\regs_matrix[6][6] ), .B(n42), .C(\regs_matrix[4][6] ), 
        .D(n48), .Y(n165) );
  NOR2X1 U179 ( .A(n166), .B(n165), .Y(n167) );
  AOI22X1 U180 ( .A(n170), .B(n169), .C(n168), .D(n167), .Y(n171) );
  OAI22X1 U181 ( .A(\regs_matrix[11][7] ), .B(n40), .C(\regs_matrix[9][7] ), 
        .D(n47), .Y(n173) );
  OAI22X1 U182 ( .A(\regs_matrix[15][7] ), .B(n36), .C(\regs_matrix[13][7] ), 
        .D(n44), .Y(n172) );
  NOR2X1 U183 ( .A(n173), .B(n172), .Y(n187) );
  NOR2X1 U184 ( .A(\regs_matrix[8][7] ), .B(n37), .Y(n174) );
  NOR2X1 U185 ( .A(n351), .B(n174), .Y(n175) );
  OAI21X1 U186 ( .A(\regs_matrix[10][7] ), .B(n33), .C(n175), .Y(n177) );
  OAI22X1 U187 ( .A(\regs_matrix[14][7] ), .B(n42), .C(\regs_matrix[12][7] ), 
        .D(n48), .Y(n176) );
  NOR2X1 U188 ( .A(n177), .B(n176), .Y(n186) );
  OAI22X1 U189 ( .A(\regs_matrix[3][7] ), .B(n40), .C(\regs_matrix[1][7] ), 
        .D(n47), .Y(n179) );
  OAI22X1 U190 ( .A(\regs_matrix[7][7] ), .B(n36), .C(\regs_matrix[5][7] ), 
        .D(n44), .Y(n178) );
  NOR2X1 U191 ( .A(n179), .B(n178), .Y(n185) );
  NOR2X1 U192 ( .A(outreg_data[7]), .B(n37), .Y(n180) );
  NOR2X1 U193 ( .A(N13), .B(n180), .Y(n181) );
  OAI21X1 U194 ( .A(\regs_matrix[2][7] ), .B(n33), .C(n181), .Y(n183) );
  OAI22X1 U195 ( .A(\regs_matrix[6][7] ), .B(n42), .C(\regs_matrix[4][7] ), 
        .D(n48), .Y(n182) );
  NOR2X1 U196 ( .A(n183), .B(n182), .Y(n184) );
  AOI22X1 U197 ( .A(n187), .B(n186), .C(n185), .D(n184), .Y(n188) );
  OAI22X1 U198 ( .A(\regs_matrix[11][8] ), .B(n40), .C(\regs_matrix[9][8] ), 
        .D(n47), .Y(n190) );
  OAI22X1 U199 ( .A(\regs_matrix[15][8] ), .B(n36), .C(\regs_matrix[13][8] ), 
        .D(n44), .Y(n189) );
  NOR2X1 U200 ( .A(n190), .B(n189), .Y(n204) );
  NOR2X1 U201 ( .A(\regs_matrix[8][8] ), .B(n37), .Y(n191) );
  NOR2X1 U202 ( .A(n351), .B(n191), .Y(n192) );
  OAI21X1 U203 ( .A(\regs_matrix[10][8] ), .B(n33), .C(n192), .Y(n194) );
  OAI22X1 U204 ( .A(\regs_matrix[14][8] ), .B(n42), .C(\regs_matrix[12][8] ), 
        .D(n48), .Y(n193) );
  NOR2X1 U205 ( .A(n194), .B(n193), .Y(n203) );
  OAI22X1 U206 ( .A(\regs_matrix[3][8] ), .B(n40), .C(\regs_matrix[1][8] ), 
        .D(n47), .Y(n196) );
  OAI22X1 U207 ( .A(\regs_matrix[7][8] ), .B(n36), .C(\regs_matrix[5][8] ), 
        .D(n44), .Y(n195) );
  NOR2X1 U208 ( .A(n196), .B(n195), .Y(n202) );
  NOR2X1 U209 ( .A(outreg_data[8]), .B(n37), .Y(n197) );
  NOR2X1 U210 ( .A(N13), .B(n197), .Y(n198) );
  OAI21X1 U211 ( .A(\regs_matrix[2][8] ), .B(n33), .C(n198), .Y(n200) );
  OAI22X1 U212 ( .A(\regs_matrix[6][8] ), .B(n42), .C(\regs_matrix[4][8] ), 
        .D(n48), .Y(n199) );
  NOR2X1 U213 ( .A(n200), .B(n199), .Y(n201) );
  AOI22X1 U214 ( .A(n204), .B(n203), .C(n202), .D(n201), .Y(n205) );
  OAI22X1 U215 ( .A(\regs_matrix[11][9] ), .B(n40), .C(\regs_matrix[9][9] ), 
        .D(n47), .Y(n207) );
  OAI22X1 U216 ( .A(\regs_matrix[15][9] ), .B(n36), .C(\regs_matrix[13][9] ), 
        .D(n44), .Y(n206) );
  NOR2X1 U217 ( .A(n207), .B(n206), .Y(n221) );
  NOR2X1 U218 ( .A(\regs_matrix[8][9] ), .B(n37), .Y(n208) );
  NOR2X1 U219 ( .A(n351), .B(n208), .Y(n209) );
  OAI21X1 U220 ( .A(\regs_matrix[10][9] ), .B(n33), .C(n209), .Y(n211) );
  OAI22X1 U221 ( .A(\regs_matrix[14][9] ), .B(n42), .C(\regs_matrix[12][9] ), 
        .D(n48), .Y(n210) );
  NOR2X1 U222 ( .A(n211), .B(n210), .Y(n220) );
  OAI22X1 U223 ( .A(\regs_matrix[3][9] ), .B(n40), .C(\regs_matrix[1][9] ), 
        .D(n47), .Y(n213) );
  OAI22X1 U224 ( .A(\regs_matrix[7][9] ), .B(n36), .C(\regs_matrix[5][9] ), 
        .D(n44), .Y(n212) );
  NOR2X1 U225 ( .A(n213), .B(n212), .Y(n219) );
  NOR2X1 U226 ( .A(outreg_data[9]), .B(n37), .Y(n214) );
  NOR2X1 U227 ( .A(N13), .B(n214), .Y(n215) );
  OAI21X1 U228 ( .A(\regs_matrix[2][9] ), .B(n33), .C(n215), .Y(n217) );
  OAI22X1 U229 ( .A(\regs_matrix[6][9] ), .B(n42), .C(\regs_matrix[4][9] ), 
        .D(n48), .Y(n216) );
  NOR2X1 U230 ( .A(n217), .B(n216), .Y(n218) );
  AOI22X1 U231 ( .A(n221), .B(n220), .C(n219), .D(n218), .Y(n222) );
  OAI22X1 U232 ( .A(\regs_matrix[11][10] ), .B(n40), .C(\regs_matrix[9][10] ), 
        .D(n47), .Y(n224) );
  OAI22X1 U233 ( .A(\regs_matrix[15][10] ), .B(n36), .C(\regs_matrix[13][10] ), 
        .D(n44), .Y(n223) );
  NOR2X1 U234 ( .A(n224), .B(n223), .Y(n238) );
  NOR2X1 U235 ( .A(\regs_matrix[8][10] ), .B(n37), .Y(n225) );
  NOR2X1 U236 ( .A(n351), .B(n225), .Y(n226) );
  OAI21X1 U237 ( .A(\regs_matrix[10][10] ), .B(n33), .C(n226), .Y(n228) );
  OAI22X1 U238 ( .A(\regs_matrix[14][10] ), .B(n42), .C(\regs_matrix[12][10] ), 
        .D(n48), .Y(n227) );
  NOR2X1 U239 ( .A(n228), .B(n227), .Y(n237) );
  OAI22X1 U240 ( .A(\regs_matrix[3][10] ), .B(n40), .C(\regs_matrix[1][10] ), 
        .D(n47), .Y(n230) );
  OAI22X1 U241 ( .A(\regs_matrix[7][10] ), .B(n36), .C(\regs_matrix[5][10] ), 
        .D(n44), .Y(n229) );
  NOR2X1 U242 ( .A(n230), .B(n229), .Y(n236) );
  NOR2X1 U243 ( .A(outreg_data[10]), .B(n37), .Y(n231) );
  NOR2X1 U244 ( .A(N13), .B(n231), .Y(n232) );
  OAI21X1 U245 ( .A(\regs_matrix[2][10] ), .B(n33), .C(n232), .Y(n234) );
  OAI22X1 U246 ( .A(\regs_matrix[6][10] ), .B(n42), .C(\regs_matrix[4][10] ), 
        .D(n48), .Y(n233) );
  NOR2X1 U247 ( .A(n234), .B(n233), .Y(n235) );
  AOI22X1 U248 ( .A(n238), .B(n237), .C(n236), .D(n235), .Y(n239) );
  OAI22X1 U249 ( .A(\regs_matrix[11][11] ), .B(n40), .C(\regs_matrix[9][11] ), 
        .D(n47), .Y(n241) );
  OAI22X1 U250 ( .A(\regs_matrix[15][11] ), .B(n36), .C(\regs_matrix[13][11] ), 
        .D(n44), .Y(n240) );
  NOR2X1 U251 ( .A(n241), .B(n240), .Y(n255) );
  NOR2X1 U252 ( .A(\regs_matrix[8][11] ), .B(n37), .Y(n242) );
  NOR2X1 U253 ( .A(n351), .B(n242), .Y(n243) );
  OAI21X1 U254 ( .A(\regs_matrix[10][11] ), .B(n33), .C(n243), .Y(n245) );
  OAI22X1 U255 ( .A(\regs_matrix[14][11] ), .B(n42), .C(\regs_matrix[12][11] ), 
        .D(n48), .Y(n244) );
  NOR2X1 U256 ( .A(n245), .B(n244), .Y(n254) );
  OAI22X1 U257 ( .A(\regs_matrix[3][11] ), .B(n40), .C(\regs_matrix[1][11] ), 
        .D(n47), .Y(n247) );
  OAI22X1 U258 ( .A(\regs_matrix[7][11] ), .B(n36), .C(\regs_matrix[5][11] ), 
        .D(n44), .Y(n246) );
  NOR2X1 U259 ( .A(n247), .B(n246), .Y(n253) );
  NOR2X1 U260 ( .A(outreg_data[11]), .B(n37), .Y(n248) );
  NOR2X1 U261 ( .A(N13), .B(n248), .Y(n249) );
  OAI21X1 U262 ( .A(\regs_matrix[2][11] ), .B(n33), .C(n249), .Y(n251) );
  OAI22X1 U263 ( .A(\regs_matrix[6][11] ), .B(n42), .C(\regs_matrix[4][11] ), 
        .D(n48), .Y(n250) );
  NOR2X1 U264 ( .A(n251), .B(n250), .Y(n252) );
  AOI22X1 U265 ( .A(n255), .B(n254), .C(n253), .D(n252), .Y(n256) );
  OAI22X1 U266 ( .A(\regs_matrix[11][12] ), .B(n40), .C(\regs_matrix[9][12] ), 
        .D(n47), .Y(n258) );
  OAI22X1 U267 ( .A(\regs_matrix[15][12] ), .B(n36), .C(\regs_matrix[13][12] ), 
        .D(n44), .Y(n257) );
  NOR2X1 U268 ( .A(n258), .B(n257), .Y(n272) );
  NOR2X1 U269 ( .A(\regs_matrix[8][12] ), .B(n37), .Y(n259) );
  NOR2X1 U270 ( .A(n351), .B(n259), .Y(n260) );
  OAI21X1 U271 ( .A(\regs_matrix[10][12] ), .B(n33), .C(n260), .Y(n262) );
  OAI22X1 U272 ( .A(\regs_matrix[14][12] ), .B(n42), .C(\regs_matrix[12][12] ), 
        .D(n48), .Y(n261) );
  NOR2X1 U273 ( .A(n262), .B(n261), .Y(n271) );
  OAI22X1 U274 ( .A(\regs_matrix[3][12] ), .B(n40), .C(\regs_matrix[1][12] ), 
        .D(n47), .Y(n264) );
  OAI22X1 U275 ( .A(\regs_matrix[7][12] ), .B(n36), .C(\regs_matrix[5][12] ), 
        .D(n44), .Y(n263) );
  NOR2X1 U276 ( .A(n264), .B(n263), .Y(n270) );
  NOR2X1 U277 ( .A(outreg_data[12]), .B(n37), .Y(n265) );
  NOR2X1 U278 ( .A(N13), .B(n265), .Y(n266) );
  OAI21X1 U279 ( .A(\regs_matrix[2][12] ), .B(n33), .C(n266), .Y(n268) );
  OAI22X1 U280 ( .A(\regs_matrix[6][12] ), .B(n42), .C(\regs_matrix[4][12] ), 
        .D(n48), .Y(n267) );
  NOR2X1 U281 ( .A(n268), .B(n267), .Y(n269) );
  AOI22X1 U282 ( .A(n272), .B(n271), .C(n270), .D(n269), .Y(n273) );
  OAI22X1 U283 ( .A(\regs_matrix[11][13] ), .B(n40), .C(\regs_matrix[9][13] ), 
        .D(n47), .Y(n275) );
  OAI22X1 U284 ( .A(\regs_matrix[15][13] ), .B(n36), .C(\regs_matrix[13][13] ), 
        .D(n44), .Y(n274) );
  NOR2X1 U285 ( .A(n275), .B(n274), .Y(n289) );
  NOR2X1 U286 ( .A(\regs_matrix[8][13] ), .B(n37), .Y(n276) );
  NOR2X1 U287 ( .A(n351), .B(n276), .Y(n277) );
  OAI21X1 U288 ( .A(\regs_matrix[10][13] ), .B(n33), .C(n277), .Y(n279) );
  OAI22X1 U289 ( .A(\regs_matrix[14][13] ), .B(n42), .C(\regs_matrix[12][13] ), 
        .D(n48), .Y(n278) );
  NOR2X1 U290 ( .A(n279), .B(n278), .Y(n288) );
  OAI22X1 U291 ( .A(\regs_matrix[3][13] ), .B(n40), .C(\regs_matrix[1][13] ), 
        .D(n47), .Y(n281) );
  OAI22X1 U292 ( .A(\regs_matrix[7][13] ), .B(n36), .C(\regs_matrix[5][13] ), 
        .D(n44), .Y(n280) );
  NOR2X1 U293 ( .A(n281), .B(n280), .Y(n287) );
  NOR2X1 U294 ( .A(outreg_data[13]), .B(n37), .Y(n282) );
  NOR2X1 U295 ( .A(N13), .B(n282), .Y(n283) );
  OAI21X1 U296 ( .A(\regs_matrix[2][13] ), .B(n33), .C(n283), .Y(n285) );
  OAI22X1 U297 ( .A(\regs_matrix[6][13] ), .B(n42), .C(\regs_matrix[4][13] ), 
        .D(n48), .Y(n284) );
  NOR2X1 U298 ( .A(n285), .B(n284), .Y(n286) );
  AOI22X1 U299 ( .A(n289), .B(n288), .C(n287), .D(n286), .Y(n290) );
  OAI22X1 U300 ( .A(\regs_matrix[11][14] ), .B(n40), .C(\regs_matrix[9][14] ), 
        .D(n47), .Y(n292) );
  OAI22X1 U301 ( .A(\regs_matrix[15][14] ), .B(n36), .C(\regs_matrix[13][14] ), 
        .D(n44), .Y(n291) );
  NOR2X1 U302 ( .A(n292), .B(n291), .Y(n306) );
  NOR2X1 U303 ( .A(\regs_matrix[8][14] ), .B(n37), .Y(n293) );
  NOR2X1 U304 ( .A(n351), .B(n293), .Y(n294) );
  OAI21X1 U305 ( .A(\regs_matrix[10][14] ), .B(n33), .C(n294), .Y(n296) );
  OAI22X1 U306 ( .A(\regs_matrix[14][14] ), .B(n42), .C(\regs_matrix[12][14] ), 
        .D(n48), .Y(n295) );
  NOR2X1 U307 ( .A(n296), .B(n295), .Y(n305) );
  OAI22X1 U308 ( .A(\regs_matrix[3][14] ), .B(n40), .C(\regs_matrix[1][14] ), 
        .D(n47), .Y(n298) );
  OAI22X1 U309 ( .A(\regs_matrix[7][14] ), .B(n36), .C(\regs_matrix[5][14] ), 
        .D(n44), .Y(n297) );
  NOR2X1 U310 ( .A(n298), .B(n297), .Y(n304) );
  NOR2X1 U311 ( .A(outreg_data[14]), .B(n37), .Y(n299) );
  NOR2X1 U312 ( .A(N13), .B(n299), .Y(n300) );
  OAI21X1 U313 ( .A(\regs_matrix[2][14] ), .B(n33), .C(n300), .Y(n302) );
  OAI22X1 U314 ( .A(\regs_matrix[6][14] ), .B(n42), .C(\regs_matrix[4][14] ), 
        .D(n48), .Y(n301) );
  NOR2X1 U315 ( .A(n302), .B(n301), .Y(n303) );
  AOI22X1 U316 ( .A(n306), .B(n305), .C(n304), .D(n303), .Y(n307) );
  OAI22X1 U317 ( .A(\regs_matrix[11][15] ), .B(n40), .C(\regs_matrix[9][15] ), 
        .D(n47), .Y(n309) );
  OAI22X1 U318 ( .A(\regs_matrix[15][15] ), .B(n36), .C(\regs_matrix[13][15] ), 
        .D(n44), .Y(n308) );
  NOR2X1 U319 ( .A(n309), .B(n308), .Y(n323) );
  NOR2X1 U320 ( .A(\regs_matrix[8][15] ), .B(n37), .Y(n310) );
  NOR2X1 U321 ( .A(n351), .B(n310), .Y(n311) );
  OAI21X1 U322 ( .A(\regs_matrix[10][15] ), .B(n33), .C(n311), .Y(n313) );
  OAI22X1 U323 ( .A(\regs_matrix[14][15] ), .B(n42), .C(\regs_matrix[12][15] ), 
        .D(n48), .Y(n312) );
  NOR2X1 U324 ( .A(n313), .B(n312), .Y(n322) );
  OAI22X1 U325 ( .A(\regs_matrix[3][15] ), .B(n40), .C(\regs_matrix[1][15] ), 
        .D(n47), .Y(n315) );
  OAI22X1 U326 ( .A(\regs_matrix[7][15] ), .B(n36), .C(\regs_matrix[5][15] ), 
        .D(n44), .Y(n314) );
  NOR2X1 U327 ( .A(n315), .B(n314), .Y(n321) );
  NOR2X1 U328 ( .A(outreg_data[15]), .B(n37), .Y(n316) );
  NOR2X1 U329 ( .A(N13), .B(n316), .Y(n317) );
  OAI21X1 U330 ( .A(\regs_matrix[2][15] ), .B(n33), .C(n317), .Y(n319) );
  OAI22X1 U331 ( .A(\regs_matrix[6][15] ), .B(n42), .C(\regs_matrix[4][15] ), 
        .D(n48), .Y(n318) );
  NOR2X1 U332 ( .A(n319), .B(n318), .Y(n320) );
  AOI22X1 U333 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(n324) );
  OAI22X1 U334 ( .A(\regs_matrix[13][16] ), .B(n44), .C(\regs_matrix[11][16] ), 
        .D(n333), .Y(n326) );
  OAI21X1 U335 ( .A(\regs_matrix[15][16] ), .B(n335), .C(N13), .Y(n325) );
  NOR2X1 U336 ( .A(n326), .B(n325), .Y(n349) );
  NOR2X1 U337 ( .A(\regs_matrix[8][16] ), .B(n37), .Y(n328) );
  NOR2X1 U338 ( .A(\regs_matrix[10][16] ), .B(n33), .Y(n327) );
  NOR2X1 U339 ( .A(n328), .B(n327), .Y(n329) );
  OAI21X1 U340 ( .A(\regs_matrix[12][16] ), .B(n48), .C(n329), .Y(n331) );
  OAI22X1 U341 ( .A(\regs_matrix[9][16] ), .B(n47), .C(\regs_matrix[14][16] ), 
        .D(n343), .Y(n330) );
  NOR2X1 U342 ( .A(n331), .B(n330), .Y(n348) );
  OAI22X1 U343 ( .A(\regs_matrix[3][16] ), .B(n40), .C(\regs_matrix[1][16] ), 
        .D(n47), .Y(n337) );
  OAI22X1 U344 ( .A(\regs_matrix[7][16] ), .B(n36), .C(\regs_matrix[5][16] ), 
        .D(n44), .Y(n336) );
  NOR2X1 U345 ( .A(n337), .B(n336), .Y(n347) );
  NOR2X1 U346 ( .A(outreg_data[16]), .B(n37), .Y(n339) );
  NOR2X1 U347 ( .A(N13), .B(n339), .Y(n340) );
  OAI21X1 U348 ( .A(\regs_matrix[2][16] ), .B(n33), .C(n340), .Y(n345) );
  OAI22X1 U349 ( .A(\regs_matrix[6][16] ), .B(n42), .C(\regs_matrix[4][16] ), 
        .D(n48), .Y(n344) );
  NOR2X1 U350 ( .A(n345), .B(n344), .Y(n346) );
  AOI22X1 U351 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n350) );
  INVX2 U352 ( .A(N13), .Y(n351) );
  INVX2 U353 ( .A(N10), .Y(n352) );
  INVX2 U354 ( .A(N11), .Y(n353) );
  INVX2 U355 ( .A(N12), .Y(n354) );
  INVX2 U356 ( .A(n69), .Y(r1_data[0]) );
  INVX2 U357 ( .A(n86), .Y(r1_data[1]) );
  INVX2 U358 ( .A(n103), .Y(r1_data[2]) );
  INVX2 U359 ( .A(n120), .Y(r1_data[3]) );
  INVX2 U360 ( .A(n137), .Y(r1_data[4]) );
  INVX2 U361 ( .A(n154), .Y(r1_data[5]) );
  INVX2 U362 ( .A(n171), .Y(r1_data[6]) );
  INVX2 U363 ( .A(n188), .Y(r1_data[7]) );
  INVX2 U364 ( .A(n205), .Y(r1_data[8]) );
  INVX2 U365 ( .A(n222), .Y(r1_data[9]) );
  INVX2 U366 ( .A(n239), .Y(r1_data[10]) );
  INVX2 U367 ( .A(n256), .Y(r1_data[11]) );
  INVX2 U368 ( .A(n273), .Y(r1_data[12]) );
  INVX2 U369 ( .A(n290), .Y(r1_data[13]) );
  INVX2 U370 ( .A(n307), .Y(r1_data[14]) );
  INVX2 U371 ( .A(n324), .Y(r1_data[15]) );
  INVX2 U372 ( .A(n350), .Y(r1_data[16]) );
  NOR2X1 U373 ( .A(n659), .B(N16), .Y(n357) );
  NAND2X1 U374 ( .A(n357), .B(N14), .Y(n639) );
  NOR2X1 U375 ( .A(N15), .B(N16), .Y(n358) );
  NAND2X1 U376 ( .A(n358), .B(N14), .Y(n638) );
  OAI22X1 U377 ( .A(\regs_matrix[11][0] ), .B(n639), .C(\regs_matrix[9][0] ), 
        .D(n638), .Y(n356) );
  NOR2X1 U378 ( .A(n657), .B(n659), .Y(n361) );
  NAND2X1 U379 ( .A(N14), .B(n361), .Y(n641) );
  NOR2X1 U380 ( .A(n657), .B(N15), .Y(n362) );
  NAND2X1 U381 ( .A(n362), .B(N14), .Y(n640) );
  OAI22X1 U382 ( .A(\regs_matrix[15][0] ), .B(n641), .C(\regs_matrix[13][0] ), 
        .D(n640), .Y(n355) );
  NOR2X1 U383 ( .A(n356), .B(n355), .Y(n374) );
  NAND2X1 U384 ( .A(n357), .B(n660), .Y(n647) );
  NAND2X1 U385 ( .A(n358), .B(n660), .Y(n644) );
  NOR2X1 U386 ( .A(\regs_matrix[8][0] ), .B(n644), .Y(n359) );
  NOR2X1 U387 ( .A(n658), .B(n359), .Y(n360) );
  OAI21X1 U388 ( .A(\regs_matrix[10][0] ), .B(n647), .C(n360), .Y(n364) );
  NAND2X1 U389 ( .A(n361), .B(n660), .Y(n649) );
  NAND2X1 U390 ( .A(n362), .B(n660), .Y(n648) );
  OAI22X1 U391 ( .A(\regs_matrix[14][0] ), .B(n649), .C(\regs_matrix[12][0] ), 
        .D(n648), .Y(n363) );
  NOR2X1 U392 ( .A(n364), .B(n363), .Y(n373) );
  OAI22X1 U393 ( .A(\regs_matrix[3][0] ), .B(n639), .C(\regs_matrix[1][0] ), 
        .D(n638), .Y(n366) );
  OAI22X1 U394 ( .A(\regs_matrix[7][0] ), .B(n641), .C(\regs_matrix[5][0] ), 
        .D(n640), .Y(n365) );
  NOR2X1 U395 ( .A(n366), .B(n365), .Y(n372) );
  NOR2X1 U396 ( .A(outreg_data[0]), .B(n644), .Y(n367) );
  NOR2X1 U397 ( .A(N17), .B(n367), .Y(n368) );
  OAI21X1 U398 ( .A(\regs_matrix[2][0] ), .B(n647), .C(n368), .Y(n370) );
  OAI22X1 U399 ( .A(\regs_matrix[6][0] ), .B(n649), .C(\regs_matrix[4][0] ), 
        .D(n648), .Y(n369) );
  NOR2X1 U400 ( .A(n370), .B(n369), .Y(n371) );
  AOI22X1 U401 ( .A(n374), .B(n373), .C(n372), .D(n371), .Y(n375) );
  OAI22X1 U402 ( .A(\regs_matrix[11][1] ), .B(n639), .C(\regs_matrix[9][1] ), 
        .D(n638), .Y(n377) );
  OAI22X1 U403 ( .A(\regs_matrix[15][1] ), .B(n641), .C(\regs_matrix[13][1] ), 
        .D(n640), .Y(n376) );
  NOR2X1 U404 ( .A(n377), .B(n376), .Y(n391) );
  NOR2X1 U405 ( .A(\regs_matrix[8][1] ), .B(n644), .Y(n378) );
  NOR2X1 U406 ( .A(n658), .B(n378), .Y(n379) );
  OAI21X1 U407 ( .A(\regs_matrix[10][1] ), .B(n647), .C(n379), .Y(n381) );
  OAI22X1 U408 ( .A(\regs_matrix[14][1] ), .B(n649), .C(\regs_matrix[12][1] ), 
        .D(n648), .Y(n380) );
  NOR2X1 U409 ( .A(n381), .B(n380), .Y(n390) );
  OAI22X1 U410 ( .A(\regs_matrix[3][1] ), .B(n639), .C(\regs_matrix[1][1] ), 
        .D(n638), .Y(n383) );
  OAI22X1 U411 ( .A(\regs_matrix[7][1] ), .B(n641), .C(\regs_matrix[5][1] ), 
        .D(n640), .Y(n382) );
  NOR2X1 U412 ( .A(n383), .B(n382), .Y(n389) );
  NOR2X1 U413 ( .A(outreg_data[1]), .B(n644), .Y(n384) );
  NOR2X1 U414 ( .A(N17), .B(n384), .Y(n385) );
  OAI21X1 U415 ( .A(\regs_matrix[2][1] ), .B(n647), .C(n385), .Y(n387) );
  OAI22X1 U416 ( .A(\regs_matrix[6][1] ), .B(n649), .C(\regs_matrix[4][1] ), 
        .D(n648), .Y(n386) );
  NOR2X1 U417 ( .A(n387), .B(n386), .Y(n388) );
  AOI22X1 U418 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(n392) );
  OAI22X1 U419 ( .A(\regs_matrix[11][2] ), .B(n639), .C(\regs_matrix[9][2] ), 
        .D(n638), .Y(n394) );
  OAI22X1 U420 ( .A(\regs_matrix[15][2] ), .B(n641), .C(\regs_matrix[13][2] ), 
        .D(n640), .Y(n393) );
  NOR2X1 U421 ( .A(n394), .B(n393), .Y(n408) );
  NOR2X1 U422 ( .A(\regs_matrix[8][2] ), .B(n644), .Y(n395) );
  NOR2X1 U423 ( .A(n658), .B(n395), .Y(n396) );
  OAI21X1 U424 ( .A(\regs_matrix[10][2] ), .B(n647), .C(n396), .Y(n398) );
  OAI22X1 U425 ( .A(\regs_matrix[14][2] ), .B(n649), .C(\regs_matrix[12][2] ), 
        .D(n648), .Y(n397) );
  NOR2X1 U426 ( .A(n398), .B(n397), .Y(n407) );
  OAI22X1 U427 ( .A(\regs_matrix[3][2] ), .B(n639), .C(\regs_matrix[1][2] ), 
        .D(n638), .Y(n400) );
  OAI22X1 U428 ( .A(\regs_matrix[7][2] ), .B(n641), .C(\regs_matrix[5][2] ), 
        .D(n640), .Y(n399) );
  NOR2X1 U429 ( .A(n400), .B(n399), .Y(n406) );
  NOR2X1 U430 ( .A(outreg_data[2]), .B(n644), .Y(n401) );
  NOR2X1 U431 ( .A(N17), .B(n401), .Y(n402) );
  OAI21X1 U432 ( .A(\regs_matrix[2][2] ), .B(n647), .C(n402), .Y(n404) );
  OAI22X1 U433 ( .A(\regs_matrix[6][2] ), .B(n649), .C(\regs_matrix[4][2] ), 
        .D(n648), .Y(n403) );
  NOR2X1 U434 ( .A(n404), .B(n403), .Y(n405) );
  AOI22X1 U435 ( .A(n408), .B(n407), .C(n406), .D(n405), .Y(n409) );
  OAI22X1 U436 ( .A(\regs_matrix[11][3] ), .B(n639), .C(\regs_matrix[9][3] ), 
        .D(n638), .Y(n411) );
  OAI22X1 U437 ( .A(\regs_matrix[15][3] ), .B(n641), .C(\regs_matrix[13][3] ), 
        .D(n640), .Y(n410) );
  NOR2X1 U438 ( .A(n411), .B(n410), .Y(n425) );
  NOR2X1 U439 ( .A(\regs_matrix[8][3] ), .B(n644), .Y(n412) );
  NOR2X1 U440 ( .A(n658), .B(n412), .Y(n413) );
  OAI21X1 U441 ( .A(\regs_matrix[10][3] ), .B(n647), .C(n413), .Y(n415) );
  OAI22X1 U442 ( .A(\regs_matrix[14][3] ), .B(n649), .C(\regs_matrix[12][3] ), 
        .D(n648), .Y(n414) );
  NOR2X1 U443 ( .A(n415), .B(n414), .Y(n424) );
  OAI22X1 U444 ( .A(\regs_matrix[3][3] ), .B(n639), .C(\regs_matrix[1][3] ), 
        .D(n638), .Y(n417) );
  OAI22X1 U445 ( .A(\regs_matrix[7][3] ), .B(n641), .C(\regs_matrix[5][3] ), 
        .D(n640), .Y(n416) );
  NOR2X1 U446 ( .A(n417), .B(n416), .Y(n423) );
  NOR2X1 U447 ( .A(outreg_data[3]), .B(n644), .Y(n418) );
  NOR2X1 U448 ( .A(N17), .B(n418), .Y(n419) );
  OAI21X1 U449 ( .A(\regs_matrix[2][3] ), .B(n647), .C(n419), .Y(n421) );
  OAI22X1 U450 ( .A(\regs_matrix[6][3] ), .B(n649), .C(\regs_matrix[4][3] ), 
        .D(n648), .Y(n420) );
  NOR2X1 U451 ( .A(n421), .B(n420), .Y(n422) );
  AOI22X1 U452 ( .A(n425), .B(n424), .C(n423), .D(n422), .Y(n426) );
  OAI22X1 U453 ( .A(\regs_matrix[11][4] ), .B(n39), .C(\regs_matrix[9][4] ), 
        .D(n638), .Y(n428) );
  OAI22X1 U454 ( .A(\regs_matrix[15][4] ), .B(n35), .C(\regs_matrix[13][4] ), 
        .D(n640), .Y(n427) );
  NOR2X1 U455 ( .A(n428), .B(n427), .Y(n442) );
  NOR2X1 U456 ( .A(\regs_matrix[8][4] ), .B(n644), .Y(n429) );
  NOR2X1 U457 ( .A(n658), .B(n429), .Y(n430) );
  OAI21X1 U458 ( .A(\regs_matrix[10][4] ), .B(n647), .C(n430), .Y(n432) );
  OAI22X1 U459 ( .A(\regs_matrix[14][4] ), .B(n41), .C(\regs_matrix[12][4] ), 
        .D(n648), .Y(n431) );
  NOR2X1 U460 ( .A(n432), .B(n431), .Y(n441) );
  OAI22X1 U461 ( .A(\regs_matrix[3][4] ), .B(n39), .C(\regs_matrix[1][4] ), 
        .D(n46), .Y(n434) );
  OAI22X1 U462 ( .A(\regs_matrix[7][4] ), .B(n35), .C(\regs_matrix[5][4] ), 
        .D(n43), .Y(n433) );
  NOR2X1 U463 ( .A(n434), .B(n433), .Y(n440) );
  NOR2X1 U464 ( .A(outreg_data[4]), .B(n644), .Y(n435) );
  NOR2X1 U465 ( .A(N17), .B(n435), .Y(n436) );
  OAI21X1 U466 ( .A(\regs_matrix[2][4] ), .B(n34), .C(n436), .Y(n438) );
  OAI22X1 U467 ( .A(\regs_matrix[6][4] ), .B(n41), .C(\regs_matrix[4][4] ), 
        .D(n45), .Y(n437) );
  NOR2X1 U468 ( .A(n438), .B(n437), .Y(n439) );
  AOI22X1 U469 ( .A(n442), .B(n441), .C(n440), .D(n439), .Y(n443) );
  OAI22X1 U470 ( .A(\regs_matrix[11][5] ), .B(n39), .C(\regs_matrix[9][5] ), 
        .D(n46), .Y(n445) );
  OAI22X1 U471 ( .A(\regs_matrix[15][5] ), .B(n35), .C(\regs_matrix[13][5] ), 
        .D(n43), .Y(n444) );
  NOR2X1 U472 ( .A(n445), .B(n444), .Y(n459) );
  NOR2X1 U473 ( .A(\regs_matrix[8][5] ), .B(n644), .Y(n446) );
  NOR2X1 U474 ( .A(n658), .B(n446), .Y(n447) );
  OAI21X1 U475 ( .A(\regs_matrix[10][5] ), .B(n34), .C(n447), .Y(n449) );
  OAI22X1 U476 ( .A(\regs_matrix[14][5] ), .B(n41), .C(\regs_matrix[12][5] ), 
        .D(n45), .Y(n448) );
  NOR2X1 U477 ( .A(n449), .B(n448), .Y(n458) );
  OAI22X1 U478 ( .A(\regs_matrix[3][5] ), .B(n39), .C(\regs_matrix[1][5] ), 
        .D(n46), .Y(n451) );
  OAI22X1 U479 ( .A(\regs_matrix[7][5] ), .B(n35), .C(\regs_matrix[5][5] ), 
        .D(n43), .Y(n450) );
  NOR2X1 U480 ( .A(n451), .B(n450), .Y(n457) );
  NOR2X1 U481 ( .A(outreg_data[5]), .B(n644), .Y(n452) );
  NOR2X1 U482 ( .A(N17), .B(n452), .Y(n453) );
  OAI21X1 U483 ( .A(\regs_matrix[2][5] ), .B(n34), .C(n453), .Y(n455) );
  OAI22X1 U484 ( .A(\regs_matrix[6][5] ), .B(n41), .C(\regs_matrix[4][5] ), 
        .D(n45), .Y(n454) );
  NOR2X1 U485 ( .A(n455), .B(n454), .Y(n456) );
  AOI22X1 U486 ( .A(n459), .B(n458), .C(n457), .D(n456), .Y(n460) );
  OAI22X1 U487 ( .A(\regs_matrix[11][6] ), .B(n39), .C(\regs_matrix[9][6] ), 
        .D(n46), .Y(n462) );
  OAI22X1 U488 ( .A(\regs_matrix[15][6] ), .B(n35), .C(\regs_matrix[13][6] ), 
        .D(n43), .Y(n461) );
  NOR2X1 U489 ( .A(n462), .B(n461), .Y(n476) );
  NOR2X1 U490 ( .A(\regs_matrix[8][6] ), .B(n644), .Y(n463) );
  NOR2X1 U491 ( .A(n658), .B(n463), .Y(n464) );
  OAI21X1 U492 ( .A(\regs_matrix[10][6] ), .B(n34), .C(n464), .Y(n466) );
  OAI22X1 U493 ( .A(\regs_matrix[14][6] ), .B(n41), .C(\regs_matrix[12][6] ), 
        .D(n45), .Y(n465) );
  NOR2X1 U494 ( .A(n466), .B(n465), .Y(n475) );
  OAI22X1 U495 ( .A(\regs_matrix[3][6] ), .B(n39), .C(\regs_matrix[1][6] ), 
        .D(n46), .Y(n468) );
  OAI22X1 U496 ( .A(\regs_matrix[7][6] ), .B(n35), .C(\regs_matrix[5][6] ), 
        .D(n43), .Y(n467) );
  NOR2X1 U497 ( .A(n468), .B(n467), .Y(n474) );
  NOR2X1 U498 ( .A(outreg_data[6]), .B(n38), .Y(n469) );
  NOR2X1 U499 ( .A(N17), .B(n469), .Y(n470) );
  OAI21X1 U500 ( .A(\regs_matrix[2][6] ), .B(n34), .C(n470), .Y(n472) );
  OAI22X1 U501 ( .A(\regs_matrix[6][6] ), .B(n41), .C(\regs_matrix[4][6] ), 
        .D(n45), .Y(n471) );
  NOR2X1 U502 ( .A(n472), .B(n471), .Y(n473) );
  AOI22X1 U503 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(n477) );
  OAI22X1 U504 ( .A(\regs_matrix[11][7] ), .B(n39), .C(\regs_matrix[9][7] ), 
        .D(n46), .Y(n479) );
  OAI22X1 U505 ( .A(\regs_matrix[15][7] ), .B(n35), .C(\regs_matrix[13][7] ), 
        .D(n43), .Y(n478) );
  NOR2X1 U506 ( .A(n479), .B(n478), .Y(n493) );
  NOR2X1 U507 ( .A(\regs_matrix[8][7] ), .B(n38), .Y(n480) );
  NOR2X1 U508 ( .A(n658), .B(n480), .Y(n481) );
  OAI21X1 U509 ( .A(\regs_matrix[10][7] ), .B(n34), .C(n481), .Y(n483) );
  OAI22X1 U510 ( .A(\regs_matrix[14][7] ), .B(n41), .C(\regs_matrix[12][7] ), 
        .D(n45), .Y(n482) );
  NOR2X1 U511 ( .A(n483), .B(n482), .Y(n492) );
  OAI22X1 U512 ( .A(\regs_matrix[3][7] ), .B(n39), .C(\regs_matrix[1][7] ), 
        .D(n46), .Y(n485) );
  OAI22X1 U513 ( .A(\regs_matrix[7][7] ), .B(n35), .C(\regs_matrix[5][7] ), 
        .D(n43), .Y(n484) );
  NOR2X1 U514 ( .A(n485), .B(n484), .Y(n491) );
  NOR2X1 U515 ( .A(outreg_data[7]), .B(n38), .Y(n486) );
  NOR2X1 U516 ( .A(N17), .B(n486), .Y(n487) );
  OAI21X1 U517 ( .A(\regs_matrix[2][7] ), .B(n34), .C(n487), .Y(n489) );
  OAI22X1 U518 ( .A(\regs_matrix[6][7] ), .B(n41), .C(\regs_matrix[4][7] ), 
        .D(n45), .Y(n488) );
  NOR2X1 U519 ( .A(n489), .B(n488), .Y(n490) );
  AOI22X1 U520 ( .A(n493), .B(n492), .C(n491), .D(n490), .Y(n494) );
  OAI22X1 U521 ( .A(\regs_matrix[11][8] ), .B(n39), .C(\regs_matrix[9][8] ), 
        .D(n46), .Y(n496) );
  OAI22X1 U522 ( .A(\regs_matrix[15][8] ), .B(n35), .C(\regs_matrix[13][8] ), 
        .D(n43), .Y(n495) );
  NOR2X1 U523 ( .A(n496), .B(n495), .Y(n510) );
  NOR2X1 U524 ( .A(\regs_matrix[8][8] ), .B(n38), .Y(n497) );
  NOR2X1 U525 ( .A(n658), .B(n497), .Y(n498) );
  OAI21X1 U526 ( .A(\regs_matrix[10][8] ), .B(n34), .C(n498), .Y(n500) );
  OAI22X1 U527 ( .A(\regs_matrix[14][8] ), .B(n41), .C(\regs_matrix[12][8] ), 
        .D(n45), .Y(n499) );
  NOR2X1 U528 ( .A(n500), .B(n499), .Y(n509) );
  OAI22X1 U529 ( .A(\regs_matrix[3][8] ), .B(n39), .C(\regs_matrix[1][8] ), 
        .D(n46), .Y(n502) );
  OAI22X1 U530 ( .A(\regs_matrix[7][8] ), .B(n35), .C(\regs_matrix[5][8] ), 
        .D(n43), .Y(n501) );
  NOR2X1 U531 ( .A(n502), .B(n501), .Y(n508) );
  NOR2X1 U532 ( .A(outreg_data[8]), .B(n38), .Y(n503) );
  NOR2X1 U533 ( .A(N17), .B(n503), .Y(n504) );
  OAI21X1 U534 ( .A(\regs_matrix[2][8] ), .B(n34), .C(n504), .Y(n506) );
  OAI22X1 U535 ( .A(\regs_matrix[6][8] ), .B(n41), .C(\regs_matrix[4][8] ), 
        .D(n45), .Y(n505) );
  NOR2X1 U536 ( .A(n506), .B(n505), .Y(n507) );
  AOI22X1 U537 ( .A(n510), .B(n509), .C(n508), .D(n507), .Y(n511) );
  OAI22X1 U538 ( .A(\regs_matrix[11][9] ), .B(n39), .C(\regs_matrix[9][9] ), 
        .D(n46), .Y(n513) );
  OAI22X1 U539 ( .A(\regs_matrix[15][9] ), .B(n35), .C(\regs_matrix[13][9] ), 
        .D(n43), .Y(n512) );
  NOR2X1 U540 ( .A(n513), .B(n512), .Y(n527) );
  NOR2X1 U541 ( .A(\regs_matrix[8][9] ), .B(n38), .Y(n514) );
  NOR2X1 U542 ( .A(n658), .B(n514), .Y(n515) );
  OAI21X1 U543 ( .A(\regs_matrix[10][9] ), .B(n34), .C(n515), .Y(n517) );
  OAI22X1 U544 ( .A(\regs_matrix[14][9] ), .B(n41), .C(\regs_matrix[12][9] ), 
        .D(n45), .Y(n516) );
  NOR2X1 U545 ( .A(n517), .B(n516), .Y(n526) );
  OAI22X1 U546 ( .A(\regs_matrix[3][9] ), .B(n39), .C(\regs_matrix[1][9] ), 
        .D(n46), .Y(n519) );
  OAI22X1 U547 ( .A(\regs_matrix[7][9] ), .B(n35), .C(\regs_matrix[5][9] ), 
        .D(n43), .Y(n518) );
  NOR2X1 U548 ( .A(n519), .B(n518), .Y(n525) );
  NOR2X1 U549 ( .A(outreg_data[9]), .B(n38), .Y(n520) );
  NOR2X1 U550 ( .A(N17), .B(n520), .Y(n521) );
  OAI21X1 U551 ( .A(\regs_matrix[2][9] ), .B(n34), .C(n521), .Y(n523) );
  OAI22X1 U552 ( .A(\regs_matrix[6][9] ), .B(n41), .C(\regs_matrix[4][9] ), 
        .D(n45), .Y(n522) );
  NOR2X1 U553 ( .A(n523), .B(n522), .Y(n524) );
  AOI22X1 U554 ( .A(n527), .B(n526), .C(n525), .D(n524), .Y(n528) );
  OAI22X1 U555 ( .A(\regs_matrix[11][10] ), .B(n39), .C(\regs_matrix[9][10] ), 
        .D(n46), .Y(n530) );
  OAI22X1 U556 ( .A(\regs_matrix[15][10] ), .B(n35), .C(\regs_matrix[13][10] ), 
        .D(n43), .Y(n529) );
  NOR2X1 U557 ( .A(n530), .B(n529), .Y(n544) );
  NOR2X1 U558 ( .A(\regs_matrix[8][10] ), .B(n38), .Y(n531) );
  NOR2X1 U559 ( .A(n658), .B(n531), .Y(n532) );
  OAI21X1 U560 ( .A(\regs_matrix[10][10] ), .B(n34), .C(n532), .Y(n534) );
  OAI22X1 U561 ( .A(\regs_matrix[14][10] ), .B(n41), .C(\regs_matrix[12][10] ), 
        .D(n45), .Y(n533) );
  NOR2X1 U562 ( .A(n534), .B(n533), .Y(n543) );
  OAI22X1 U563 ( .A(\regs_matrix[3][10] ), .B(n39), .C(\regs_matrix[1][10] ), 
        .D(n46), .Y(n536) );
  OAI22X1 U564 ( .A(\regs_matrix[7][10] ), .B(n35), .C(\regs_matrix[5][10] ), 
        .D(n43), .Y(n535) );
  NOR2X1 U565 ( .A(n536), .B(n535), .Y(n542) );
  NOR2X1 U566 ( .A(outreg_data[10]), .B(n38), .Y(n537) );
  NOR2X1 U567 ( .A(N17), .B(n537), .Y(n538) );
  OAI21X1 U568 ( .A(\regs_matrix[2][10] ), .B(n34), .C(n538), .Y(n540) );
  OAI22X1 U569 ( .A(\regs_matrix[6][10] ), .B(n41), .C(\regs_matrix[4][10] ), 
        .D(n45), .Y(n539) );
  NOR2X1 U570 ( .A(n540), .B(n539), .Y(n541) );
  AOI22X1 U571 ( .A(n544), .B(n543), .C(n542), .D(n541), .Y(n545) );
  OAI22X1 U572 ( .A(\regs_matrix[11][11] ), .B(n39), .C(\regs_matrix[9][11] ), 
        .D(n46), .Y(n547) );
  OAI22X1 U573 ( .A(\regs_matrix[15][11] ), .B(n35), .C(\regs_matrix[13][11] ), 
        .D(n43), .Y(n546) );
  NOR2X1 U574 ( .A(n547), .B(n546), .Y(n561) );
  NOR2X1 U575 ( .A(\regs_matrix[8][11] ), .B(n38), .Y(n548) );
  NOR2X1 U576 ( .A(n658), .B(n548), .Y(n549) );
  OAI21X1 U577 ( .A(\regs_matrix[10][11] ), .B(n34), .C(n549), .Y(n551) );
  OAI22X1 U578 ( .A(\regs_matrix[14][11] ), .B(n41), .C(\regs_matrix[12][11] ), 
        .D(n45), .Y(n550) );
  NOR2X1 U579 ( .A(n551), .B(n550), .Y(n560) );
  OAI22X1 U580 ( .A(\regs_matrix[3][11] ), .B(n39), .C(\regs_matrix[1][11] ), 
        .D(n46), .Y(n553) );
  OAI22X1 U581 ( .A(\regs_matrix[7][11] ), .B(n35), .C(\regs_matrix[5][11] ), 
        .D(n43), .Y(n552) );
  NOR2X1 U582 ( .A(n553), .B(n552), .Y(n559) );
  NOR2X1 U583 ( .A(outreg_data[11]), .B(n38), .Y(n554) );
  NOR2X1 U584 ( .A(N17), .B(n554), .Y(n555) );
  OAI21X1 U585 ( .A(\regs_matrix[2][11] ), .B(n34), .C(n555), .Y(n557) );
  OAI22X1 U586 ( .A(\regs_matrix[6][11] ), .B(n41), .C(\regs_matrix[4][11] ), 
        .D(n45), .Y(n556) );
  NOR2X1 U587 ( .A(n557), .B(n556), .Y(n558) );
  AOI22X1 U588 ( .A(n561), .B(n560), .C(n559), .D(n558), .Y(n562) );
  OAI22X1 U589 ( .A(\regs_matrix[11][12] ), .B(n39), .C(\regs_matrix[9][12] ), 
        .D(n46), .Y(n564) );
  OAI22X1 U590 ( .A(\regs_matrix[15][12] ), .B(n35), .C(\regs_matrix[13][12] ), 
        .D(n43), .Y(n563) );
  NOR2X1 U591 ( .A(n564), .B(n563), .Y(n578) );
  NOR2X1 U592 ( .A(\regs_matrix[8][12] ), .B(n38), .Y(n565) );
  NOR2X1 U593 ( .A(n658), .B(n565), .Y(n566) );
  OAI21X1 U594 ( .A(\regs_matrix[10][12] ), .B(n34), .C(n566), .Y(n568) );
  OAI22X1 U595 ( .A(\regs_matrix[14][12] ), .B(n41), .C(\regs_matrix[12][12] ), 
        .D(n45), .Y(n567) );
  NOR2X1 U596 ( .A(n568), .B(n567), .Y(n577) );
  OAI22X1 U597 ( .A(\regs_matrix[3][12] ), .B(n39), .C(\regs_matrix[1][12] ), 
        .D(n46), .Y(n570) );
  OAI22X1 U598 ( .A(\regs_matrix[7][12] ), .B(n35), .C(\regs_matrix[5][12] ), 
        .D(n43), .Y(n569) );
  NOR2X1 U599 ( .A(n570), .B(n569), .Y(n576) );
  NOR2X1 U600 ( .A(outreg_data[12]), .B(n38), .Y(n571) );
  NOR2X1 U601 ( .A(N17), .B(n571), .Y(n572) );
  OAI21X1 U602 ( .A(\regs_matrix[2][12] ), .B(n34), .C(n572), .Y(n574) );
  OAI22X1 U603 ( .A(\regs_matrix[6][12] ), .B(n41), .C(\regs_matrix[4][12] ), 
        .D(n45), .Y(n573) );
  NOR2X1 U604 ( .A(n574), .B(n573), .Y(n575) );
  AOI22X1 U605 ( .A(n578), .B(n577), .C(n576), .D(n575), .Y(n579) );
  OAI22X1 U606 ( .A(\regs_matrix[11][13] ), .B(n39), .C(\regs_matrix[9][13] ), 
        .D(n46), .Y(n581) );
  OAI22X1 U607 ( .A(\regs_matrix[15][13] ), .B(n35), .C(\regs_matrix[13][13] ), 
        .D(n43), .Y(n580) );
  NOR2X1 U608 ( .A(n581), .B(n580), .Y(n595) );
  NOR2X1 U609 ( .A(\regs_matrix[8][13] ), .B(n38), .Y(n582) );
  NOR2X1 U610 ( .A(n658), .B(n582), .Y(n583) );
  OAI21X1 U611 ( .A(\regs_matrix[10][13] ), .B(n34), .C(n583), .Y(n585) );
  OAI22X1 U612 ( .A(\regs_matrix[14][13] ), .B(n41), .C(\regs_matrix[12][13] ), 
        .D(n45), .Y(n584) );
  NOR2X1 U613 ( .A(n585), .B(n584), .Y(n594) );
  OAI22X1 U614 ( .A(\regs_matrix[3][13] ), .B(n39), .C(\regs_matrix[1][13] ), 
        .D(n46), .Y(n587) );
  OAI22X1 U615 ( .A(\regs_matrix[7][13] ), .B(n35), .C(\regs_matrix[5][13] ), 
        .D(n43), .Y(n586) );
  NOR2X1 U616 ( .A(n587), .B(n586), .Y(n593) );
  NOR2X1 U617 ( .A(outreg_data[13]), .B(n38), .Y(n588) );
  NOR2X1 U618 ( .A(N17), .B(n588), .Y(n589) );
  OAI21X1 U619 ( .A(\regs_matrix[2][13] ), .B(n34), .C(n589), .Y(n591) );
  OAI22X1 U620 ( .A(\regs_matrix[6][13] ), .B(n41), .C(\regs_matrix[4][13] ), 
        .D(n45), .Y(n590) );
  NOR2X1 U621 ( .A(n591), .B(n590), .Y(n592) );
  AOI22X1 U622 ( .A(n595), .B(n594), .C(n593), .D(n592), .Y(n596) );
  OAI22X1 U623 ( .A(\regs_matrix[11][14] ), .B(n39), .C(\regs_matrix[9][14] ), 
        .D(n46), .Y(n598) );
  OAI22X1 U624 ( .A(\regs_matrix[15][14] ), .B(n35), .C(\regs_matrix[13][14] ), 
        .D(n43), .Y(n597) );
  NOR2X1 U625 ( .A(n598), .B(n597), .Y(n612) );
  NOR2X1 U626 ( .A(\regs_matrix[8][14] ), .B(n38), .Y(n599) );
  NOR2X1 U627 ( .A(n658), .B(n599), .Y(n600) );
  OAI21X1 U628 ( .A(\regs_matrix[10][14] ), .B(n34), .C(n600), .Y(n602) );
  OAI22X1 U629 ( .A(\regs_matrix[14][14] ), .B(n41), .C(\regs_matrix[12][14] ), 
        .D(n45), .Y(n601) );
  NOR2X1 U630 ( .A(n602), .B(n601), .Y(n611) );
  OAI22X1 U631 ( .A(\regs_matrix[3][14] ), .B(n39), .C(\regs_matrix[1][14] ), 
        .D(n46), .Y(n604) );
  OAI22X1 U632 ( .A(\regs_matrix[7][14] ), .B(n35), .C(\regs_matrix[5][14] ), 
        .D(n43), .Y(n603) );
  NOR2X1 U633 ( .A(n604), .B(n603), .Y(n610) );
  NOR2X1 U634 ( .A(outreg_data[14]), .B(n38), .Y(n605) );
  NOR2X1 U635 ( .A(N17), .B(n605), .Y(n606) );
  OAI21X1 U636 ( .A(\regs_matrix[2][14] ), .B(n34), .C(n606), .Y(n608) );
  OAI22X1 U637 ( .A(\regs_matrix[6][14] ), .B(n41), .C(\regs_matrix[4][14] ), 
        .D(n45), .Y(n607) );
  NOR2X1 U638 ( .A(n608), .B(n607), .Y(n609) );
  AOI22X1 U639 ( .A(n612), .B(n611), .C(n610), .D(n609), .Y(n613) );
  OAI22X1 U640 ( .A(\regs_matrix[11][15] ), .B(n39), .C(\regs_matrix[9][15] ), 
        .D(n46), .Y(n615) );
  OAI22X1 U641 ( .A(\regs_matrix[15][15] ), .B(n35), .C(\regs_matrix[13][15] ), 
        .D(n43), .Y(n614) );
  NOR2X1 U642 ( .A(n615), .B(n614), .Y(n629) );
  NOR2X1 U643 ( .A(\regs_matrix[8][15] ), .B(n38), .Y(n616) );
  NOR2X1 U644 ( .A(n658), .B(n616), .Y(n617) );
  OAI21X1 U645 ( .A(\regs_matrix[10][15] ), .B(n34), .C(n617), .Y(n619) );
  OAI22X1 U646 ( .A(\regs_matrix[14][15] ), .B(n41), .C(\regs_matrix[12][15] ), 
        .D(n45), .Y(n618) );
  NOR2X1 U647 ( .A(n619), .B(n618), .Y(n628) );
  OAI22X1 U648 ( .A(\regs_matrix[3][15] ), .B(n39), .C(\regs_matrix[1][15] ), 
        .D(n46), .Y(n621) );
  OAI22X1 U649 ( .A(\regs_matrix[7][15] ), .B(n35), .C(\regs_matrix[5][15] ), 
        .D(n43), .Y(n620) );
  NOR2X1 U650 ( .A(n621), .B(n620), .Y(n627) );
  NOR2X1 U651 ( .A(outreg_data[15]), .B(n38), .Y(n622) );
  NOR2X1 U652 ( .A(N17), .B(n622), .Y(n623) );
  OAI21X1 U653 ( .A(\regs_matrix[2][15] ), .B(n34), .C(n623), .Y(n625) );
  OAI22X1 U654 ( .A(\regs_matrix[6][15] ), .B(n41), .C(\regs_matrix[4][15] ), 
        .D(n45), .Y(n624) );
  NOR2X1 U655 ( .A(n625), .B(n624), .Y(n626) );
  AOI22X1 U656 ( .A(n629), .B(n628), .C(n627), .D(n626), .Y(n630) );
  OAI22X1 U657 ( .A(\regs_matrix[13][16] ), .B(n43), .C(\regs_matrix[11][16] ), 
        .D(n639), .Y(n632) );
  OAI21X1 U658 ( .A(\regs_matrix[15][16] ), .B(n641), .C(N17), .Y(n631) );
  NOR2X1 U659 ( .A(n632), .B(n631), .Y(n655) );
  NOR2X1 U660 ( .A(\regs_matrix[8][16] ), .B(n38), .Y(n634) );
  NOR2X1 U661 ( .A(\regs_matrix[10][16] ), .B(n34), .Y(n633) );
  NOR2X1 U662 ( .A(n634), .B(n633), .Y(n635) );
  OAI21X1 U663 ( .A(\regs_matrix[12][16] ), .B(n45), .C(n635), .Y(n637) );
  OAI22X1 U664 ( .A(\regs_matrix[9][16] ), .B(n46), .C(\regs_matrix[14][16] ), 
        .D(n649), .Y(n636) );
  NOR2X1 U665 ( .A(n637), .B(n636), .Y(n654) );
  OAI22X1 U666 ( .A(\regs_matrix[3][16] ), .B(n39), .C(\regs_matrix[1][16] ), 
        .D(n46), .Y(n643) );
  OAI22X1 U667 ( .A(\regs_matrix[7][16] ), .B(n35), .C(\regs_matrix[5][16] ), 
        .D(n43), .Y(n642) );
  NOR2X1 U668 ( .A(n643), .B(n642), .Y(n653) );
  NOR2X1 U669 ( .A(outreg_data[16]), .B(n38), .Y(n645) );
  NOR2X1 U670 ( .A(N17), .B(n645), .Y(n646) );
  OAI21X1 U671 ( .A(\regs_matrix[2][16] ), .B(n34), .C(n646), .Y(n651) );
  OAI22X1 U672 ( .A(\regs_matrix[6][16] ), .B(n41), .C(\regs_matrix[4][16] ), 
        .D(n45), .Y(n650) );
  NOR2X1 U673 ( .A(n651), .B(n650), .Y(n652) );
  AOI22X1 U674 ( .A(n655), .B(n654), .C(n653), .D(n652), .Y(n656) );
  INVX2 U675 ( .A(N16), .Y(n657) );
  INVX2 U676 ( .A(N17), .Y(n658) );
  INVX2 U677 ( .A(N15), .Y(n659) );
  INVX2 U678 ( .A(N14), .Y(n660) );
  INVX2 U679 ( .A(n375), .Y(r2_data[0]) );
  INVX2 U680 ( .A(n392), .Y(r2_data[1]) );
  INVX2 U681 ( .A(n409), .Y(r2_data[2]) );
  INVX2 U682 ( .A(n426), .Y(r2_data[3]) );
  INVX2 U683 ( .A(n443), .Y(r2_data[4]) );
  INVX2 U684 ( .A(n460), .Y(r2_data[5]) );
  INVX2 U685 ( .A(n477), .Y(r2_data[6]) );
  INVX2 U686 ( .A(n494), .Y(r2_data[7]) );
  INVX2 U687 ( .A(n511), .Y(r2_data[8]) );
  INVX2 U688 ( .A(n528), .Y(r2_data[9]) );
  INVX2 U689 ( .A(n545), .Y(r2_data[10]) );
  INVX2 U690 ( .A(n562), .Y(r2_data[11]) );
  INVX2 U691 ( .A(n579), .Y(r2_data[12]) );
  INVX2 U692 ( .A(n596), .Y(r2_data[13]) );
  INVX2 U693 ( .A(n613), .Y(r2_data[14]) );
  INVX2 U694 ( .A(n630), .Y(r2_data[15]) );
  INVX2 U695 ( .A(n656), .Y(r2_data[16]) );
  NAND3X1 U696 ( .A(w_en), .B(n669), .C(w_sel[0]), .Y(n664) );
  NAND2X1 U697 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n665) );
  NAND2X1 U698 ( .A(w_sel[2]), .B(n670), .Y(n667) );
  NAND3X1 U699 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n661) );
  NAND2X1 U700 ( .A(w_sel[1]), .B(n671), .Y(n668) );
  NAND3X1 U701 ( .A(w_en), .B(n672), .C(w_sel[3]), .Y(n663) );
  NAND3X1 U702 ( .A(n672), .B(n669), .C(w_en), .Y(n666) );
  INVX1 U703 ( .A(w_sel[3]), .Y(n669) );
  INVX1 U704 ( .A(w_sel[0]), .Y(n672) );
  NAND2X1 U705 ( .A(n670), .B(n671), .Y(n662) );
  INVX1 U706 ( .A(w_sel[2]), .Y(n671) );
  INVX1 U707 ( .A(w_sel[1]), .Y(n670) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data({dest_data[16], n12, n14, n16, 
        n18, n20, n22, n2, n4, n6, n8, n10, n23, n24, n25, n26, n27}), 
        .r1_data(src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX1 U2 ( .A(dest_data[9]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX1 U4 ( .A(dest_data[8]), .Y(n3) );
  INVX2 U5 ( .A(n3), .Y(n4) );
  INVX1 U6 ( .A(dest_data[7]), .Y(n5) );
  INVX2 U7 ( .A(n5), .Y(n6) );
  INVX1 U8 ( .A(dest_data[6]), .Y(n7) );
  INVX2 U9 ( .A(n7), .Y(n8) );
  INVX1 U10 ( .A(dest_data[5]), .Y(n9) );
  INVX2 U11 ( .A(n9), .Y(n10) );
  INVX1 U12 ( .A(dest_data[15]), .Y(n11) );
  INVX2 U13 ( .A(n11), .Y(n12) );
  INVX1 U14 ( .A(dest_data[14]), .Y(n13) );
  INVX2 U15 ( .A(n13), .Y(n14) );
  INVX1 U16 ( .A(dest_data[13]), .Y(n15) );
  INVX2 U17 ( .A(n15), .Y(n16) );
  INVX1 U18 ( .A(dest_data[12]), .Y(n17) );
  INVX2 U19 ( .A(n17), .Y(n18) );
  INVX1 U20 ( .A(dest_data[11]), .Y(n19) );
  INVX2 U21 ( .A(n19), .Y(n20) );
  INVX1 U22 ( .A(dest_data[10]), .Y(n21) );
  INVX2 U23 ( .A(n21), .Y(n22) );
  BUFX2 U24 ( .A(dest_data[4]), .Y(n23) );
  BUFX2 U25 ( .A(dest_data[3]), .Y(n24) );
  BUFX2 U26 ( .A(dest_data[2]), .Y(n25) );
  BUFX2 U27 ( .A(dest_data[1]), .Y(n26) );
  BUFX2 U28 ( .A(dest_data[0]), .Y(n27) );
  AND2X2 U29 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  AND2X2 U30 ( .A(w_data_sel[0]), .B(n30), .Y(n32) );
  INVX2 U31 ( .A(w_data_sel[1]), .Y(n30) );
  BUFX2 U32 ( .A(n33), .Y(n28) );
  OAI21X1 U33 ( .A(n29), .B(n30), .C(n31), .Y(dest_data[9]) );
  AOI22X1 U34 ( .A(ext_data2[9]), .B(n32), .C(ext_data1[9]), .D(n28), .Y(n31)
         );
  INVX1 U35 ( .A(alu_result[9]), .Y(n29) );
  OAI21X1 U36 ( .A(n30), .B(n34), .C(n35), .Y(dest_data[8]) );
  AOI22X1 U37 ( .A(ext_data2[8]), .B(n32), .C(ext_data1[8]), .D(n28), .Y(n35)
         );
  INVX1 U38 ( .A(alu_result[8]), .Y(n34) );
  OAI21X1 U39 ( .A(n30), .B(n36), .C(n37), .Y(dest_data[7]) );
  AOI22X1 U40 ( .A(ext_data2[7]), .B(n32), .C(ext_data1[7]), .D(n28), .Y(n37)
         );
  INVX1 U41 ( .A(alu_result[7]), .Y(n36) );
  OAI21X1 U42 ( .A(n30), .B(n38), .C(n39), .Y(dest_data[6]) );
  AOI22X1 U43 ( .A(ext_data2[6]), .B(n32), .C(ext_data1[6]), .D(n28), .Y(n39)
         );
  INVX1 U44 ( .A(alu_result[6]), .Y(n38) );
  OAI21X1 U45 ( .A(n30), .B(n40), .C(n41), .Y(dest_data[5]) );
  AOI22X1 U46 ( .A(ext_data2[5]), .B(n32), .C(ext_data1[5]), .D(n28), .Y(n41)
         );
  INVX1 U47 ( .A(alu_result[5]), .Y(n40) );
  OAI21X1 U48 ( .A(n30), .B(n42), .C(n43), .Y(dest_data[4]) );
  AOI22X1 U49 ( .A(ext_data2[4]), .B(n32), .C(ext_data1[4]), .D(n28), .Y(n43)
         );
  INVX1 U50 ( .A(alu_result[4]), .Y(n42) );
  OAI21X1 U51 ( .A(n30), .B(n44), .C(n45), .Y(dest_data[3]) );
  AOI22X1 U52 ( .A(ext_data2[3]), .B(n32), .C(ext_data1[3]), .D(n28), .Y(n45)
         );
  INVX1 U53 ( .A(alu_result[3]), .Y(n44) );
  OAI21X1 U54 ( .A(n30), .B(n46), .C(n47), .Y(dest_data[2]) );
  AOI22X1 U55 ( .A(ext_data2[2]), .B(n32), .C(ext_data1[2]), .D(n28), .Y(n47)
         );
  INVX1 U56 ( .A(alu_result[2]), .Y(n46) );
  OAI21X1 U57 ( .A(n30), .B(n48), .C(n49), .Y(dest_data[1]) );
  AOI22X1 U58 ( .A(ext_data2[1]), .B(n32), .C(ext_data1[1]), .D(n28), .Y(n49)
         );
  INVX1 U59 ( .A(alu_result[1]), .Y(n48) );
  OAI21X1 U60 ( .A(n30), .B(n50), .C(n51), .Y(dest_data[15]) );
  AOI22X1 U61 ( .A(ext_data2[15]), .B(n32), .C(ext_data1[15]), .D(n28), .Y(n51) );
  INVX1 U62 ( .A(alu_result[15]), .Y(n50) );
  OAI21X1 U63 ( .A(n30), .B(n52), .C(n53), .Y(dest_data[14]) );
  AOI22X1 U64 ( .A(ext_data2[14]), .B(n32), .C(ext_data1[14]), .D(n28), .Y(n53) );
  INVX1 U65 ( .A(alu_result[14]), .Y(n52) );
  OAI21X1 U66 ( .A(n30), .B(n54), .C(n55), .Y(dest_data[13]) );
  AOI22X1 U67 ( .A(ext_data2[13]), .B(n32), .C(ext_data1[13]), .D(n28), .Y(n55) );
  INVX1 U68 ( .A(alu_result[13]), .Y(n54) );
  OAI21X1 U69 ( .A(n30), .B(n56), .C(n57), .Y(dest_data[12]) );
  AOI22X1 U70 ( .A(ext_data2[12]), .B(n32), .C(ext_data1[12]), .D(n28), .Y(n57) );
  INVX1 U71 ( .A(alu_result[12]), .Y(n56) );
  OAI21X1 U72 ( .A(n30), .B(n58), .C(n59), .Y(dest_data[11]) );
  AOI22X1 U73 ( .A(ext_data2[11]), .B(n32), .C(ext_data1[11]), .D(n28), .Y(n59) );
  INVX1 U74 ( .A(alu_result[11]), .Y(n58) );
  OAI21X1 U75 ( .A(n30), .B(n60), .C(n61), .Y(dest_data[10]) );
  AOI22X1 U76 ( .A(ext_data2[10]), .B(n32), .C(ext_data1[10]), .D(n28), .Y(n61) );
  INVX1 U77 ( .A(alu_result[10]), .Y(n60) );
  OAI21X1 U78 ( .A(n30), .B(n62), .C(n63), .Y(dest_data[0]) );
  AOI22X1 U79 ( .A(ext_data2[0]), .B(n32), .C(ext_data1[0]), .D(n28), .Y(n63)
         );
  NOR2X1 U80 ( .A(w_data_sel[0]), .B(w_data_sel[1]), .Y(n33) );
  INVX1 U81 ( .A(alu_result[0]), .Y(n62) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n1, n2, n3, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n51, n52, n53;

  DFFSR \count_out_reg[0]  ( .D(n50), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n45), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n44), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR rollover_flag_reg ( .D(n49), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[9]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_26 ( .A({N16, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7}), .SUM({N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17}) );
  INVX1 U6 ( .A(n1), .Y(n50) );
  AOI22X1 U15 ( .A(n2), .B(count_out[0]), .C(n3), .D(N17), .Y(n1) );
  OAI21X1 U16 ( .A(n15), .B(n16), .C(n17), .Y(n49) );
  NAND2X1 U17 ( .A(n18), .B(n19), .Y(n17) );
  NOR2X1 U18 ( .A(n20), .B(n21), .Y(n19) );
  NAND3X1 U19 ( .A(n22), .B(n23), .C(n24), .Y(n21) );
  XNOR2X1 U20 ( .A(N20), .B(rollover_val[3]), .Y(n24) );
  XNOR2X1 U21 ( .A(N26), .B(rollover_val[9]), .Y(n23) );
  XNOR2X1 U22 ( .A(N19), .B(rollover_val[2]), .Y(n22) );
  NAND3X1 U23 ( .A(n25), .B(n3), .C(n26), .Y(n20) );
  XNOR2X1 U24 ( .A(N17), .B(rollover_val[0]), .Y(n26) );
  XNOR2X1 U25 ( .A(N18), .B(rollover_val[1]), .Y(n25) );
  NOR2X1 U26 ( .A(n27), .B(n28), .Y(n18) );
  NAND2X1 U27 ( .A(n29), .B(n30), .Y(n28) );
  XNOR2X1 U28 ( .A(N24), .B(rollover_val[7]), .Y(n30) );
  XNOR2X1 U29 ( .A(N25), .B(rollover_val[8]), .Y(n29) );
  NAND3X1 U30 ( .A(n31), .B(n32), .C(n33), .Y(n27) );
  XNOR2X1 U31 ( .A(N22), .B(rollover_val[5]), .Y(n33) );
  XNOR2X1 U32 ( .A(N23), .B(rollover_val[6]), .Y(n32) );
  XNOR2X1 U33 ( .A(N21), .B(rollover_val[4]), .Y(n31) );
  INVX1 U34 ( .A(n2), .Y(n15) );
  INVX1 U35 ( .A(n34), .Y(n48) );
  AOI22X1 U36 ( .A(n2), .B(count_out[1]), .C(n3), .D(N18), .Y(n34) );
  INVX1 U37 ( .A(n35), .Y(n47) );
  AOI22X1 U38 ( .A(n2), .B(count_out[2]), .C(n3), .D(N19), .Y(n35) );
  INVX1 U39 ( .A(n36), .Y(n46) );
  AOI22X1 U40 ( .A(n2), .B(count_out[3]), .C(n3), .D(N20), .Y(n36) );
  INVX1 U41 ( .A(n37), .Y(n45) );
  AOI22X1 U42 ( .A(n2), .B(count_out[4]), .C(n3), .D(N21), .Y(n37) );
  INVX1 U43 ( .A(n38), .Y(n44) );
  AOI22X1 U44 ( .A(n2), .B(count_out[5]), .C(n3), .D(N22), .Y(n38) );
  INVX1 U45 ( .A(n39), .Y(n43) );
  AOI22X1 U46 ( .A(n2), .B(count_out[6]), .C(n3), .D(N23), .Y(n39) );
  INVX1 U47 ( .A(n51), .Y(n42) );
  AOI22X1 U48 ( .A(n2), .B(count_out[7]), .C(n3), .D(N24), .Y(n51) );
  INVX1 U49 ( .A(n52), .Y(n41) );
  AOI22X1 U50 ( .A(n2), .B(count_out[8]), .C(n3), .D(N25), .Y(n52) );
  INVX1 U51 ( .A(n53), .Y(n40) );
  AOI22X1 U52 ( .A(n2), .B(count_out[9]), .C(n3), .D(N26), .Y(n53) );
  NOR2X1 U53 ( .A(n2), .B(clear), .Y(n3) );
  NOR2X1 U54 ( .A(count_enable), .B(clear), .Y(n2) );
  AND2X1 U55 ( .A(n16), .B(count_out[2]), .Y(N9) );
  AND2X1 U56 ( .A(n16), .B(count_out[1]), .Y(N8) );
  AND2X1 U57 ( .A(n16), .B(count_out[0]), .Y(N7) );
  AND2X1 U58 ( .A(n16), .B(count_out[9]), .Y(N16) );
  AND2X1 U59 ( .A(n16), .B(count_out[8]), .Y(N15) );
  AND2X1 U60 ( .A(n16), .B(count_out[7]), .Y(N14) );
  AND2X1 U61 ( .A(n16), .B(count_out[6]), .Y(N13) );
  AND2X1 U62 ( .A(n16), .B(count_out[5]), .Y(N12) );
  AND2X1 U63 ( .A(n16), .B(count_out[4]), .Y(N11) );
  AND2X1 U64 ( .A(n16), .B(count_out[3]), .Y(N10) );
  INVX1 U65 ( .A(rollover_flag), .Y(n16) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 fc ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude_DW01_dec_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n5, n7, n9, n11, n13, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  INVX2 U1 ( .A(A[13]), .Y(n1) );
  INVX2 U2 ( .A(n32), .Y(n2) );
  INVX2 U3 ( .A(A[12]), .Y(n3) );
  INVX2 U4 ( .A(n34), .Y(SUM[11]) );
  INVX2 U5 ( .A(A[10]), .Y(n5) );
  INVX2 U6 ( .A(n16), .Y(SUM[9]) );
  INVX2 U7 ( .A(A[8]), .Y(n7) );
  INVX2 U8 ( .A(n20), .Y(SUM[7]) );
  INVX2 U9 ( .A(A[6]), .Y(n9) );
  INVX2 U10 ( .A(n23), .Y(SUM[5]) );
  INVX2 U11 ( .A(A[4]), .Y(n11) );
  INVX2 U12 ( .A(n26), .Y(SUM[3]) );
  INVX2 U13 ( .A(A[2]), .Y(n13) );
  INVX2 U14 ( .A(n29), .Y(SUM[1]) );
  INVX2 U15 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U16 ( .A(n17), .B(A[9]), .C(n18), .Y(n16) );
  OAI21X1 U17 ( .A(n19), .B(n7), .C(n17), .Y(SUM[8]) );
  AOI21X1 U18 ( .A(n21), .B(A[7]), .C(n19), .Y(n20) );
  OAI21X1 U19 ( .A(n22), .B(n9), .C(n21), .Y(SUM[6]) );
  AOI21X1 U20 ( .A(n24), .B(A[5]), .C(n22), .Y(n23) );
  OAI21X1 U21 ( .A(n25), .B(n11), .C(n24), .Y(SUM[4]) );
  AOI21X1 U22 ( .A(n27), .B(A[3]), .C(n25), .Y(n26) );
  OAI21X1 U23 ( .A(n28), .B(n13), .C(n27), .Y(SUM[2]) );
  AOI21X1 U24 ( .A(A[0]), .B(A[1]), .C(n28), .Y(n29) );
  XOR2X1 U25 ( .A(A[15]), .B(n30), .Y(SUM[15]) );
  NOR2X1 U26 ( .A(A[14]), .B(n31), .Y(n30) );
  XNOR2X1 U27 ( .A(A[14]), .B(n31), .Y(SUM[14]) );
  OAI21X1 U28 ( .A(n2), .B(n1), .C(n31), .Y(SUM[13]) );
  NAND2X1 U29 ( .A(n2), .B(n1), .Y(n31) );
  OAI21X1 U30 ( .A(n33), .B(n3), .C(n32), .Y(SUM[12]) );
  NAND2X1 U31 ( .A(n33), .B(n3), .Y(n32) );
  AOI21X1 U32 ( .A(n35), .B(A[11]), .C(n33), .Y(n34) );
  NOR2X1 U33 ( .A(n35), .B(A[11]), .Y(n33) );
  OAI21X1 U34 ( .A(n18), .B(n5), .C(n35), .Y(SUM[10]) );
  NAND2X1 U35 ( .A(n18), .B(n5), .Y(n35) );
  NOR2X1 U36 ( .A(n17), .B(A[9]), .Y(n18) );
  NAND2X1 U37 ( .A(n19), .B(n7), .Y(n17) );
  NOR2X1 U38 ( .A(n21), .B(A[7]), .Y(n19) );
  NAND2X1 U39 ( .A(n22), .B(n9), .Y(n21) );
  NOR2X1 U40 ( .A(n24), .B(A[5]), .Y(n22) );
  NAND2X1 U41 ( .A(n25), .B(n11), .Y(n24) );
  NOR2X1 U42 ( .A(n27), .B(A[3]), .Y(n25) );
  NAND2X1 U43 ( .A(n28), .B(n13), .Y(n27) );
  NOR2X1 U44 ( .A(A[1]), .B(A[0]), .Y(n28) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16;

  magnitude_DW01_dec_0 sub_3 ( .A(in[15:0]), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}) );
  MUX2X1 U2 ( .B(n1), .A(N11), .S(in[16]), .Y(out[9]) );
  INVX1 U3 ( .A(in[9]), .Y(n1) );
  MUX2X1 U4 ( .B(n2), .A(N10), .S(in[16]), .Y(out[8]) );
  INVX1 U5 ( .A(in[8]), .Y(n2) );
  MUX2X1 U6 ( .B(n3), .A(N9), .S(in[16]), .Y(out[7]) );
  INVX1 U7 ( .A(in[7]), .Y(n3) );
  MUX2X1 U8 ( .B(n4), .A(N8), .S(in[16]), .Y(out[6]) );
  INVX1 U9 ( .A(in[6]), .Y(n4) );
  MUX2X1 U10 ( .B(n5), .A(N7), .S(in[16]), .Y(out[5]) );
  INVX1 U11 ( .A(in[5]), .Y(n5) );
  MUX2X1 U12 ( .B(n6), .A(N6), .S(in[16]), .Y(out[4]) );
  INVX1 U13 ( .A(in[4]), .Y(n6) );
  MUX2X1 U14 ( .B(n7), .A(N5), .S(in[16]), .Y(out[3]) );
  INVX1 U15 ( .A(in[3]), .Y(n7) );
  MUX2X1 U16 ( .B(n8), .A(N4), .S(in[16]), .Y(out[2]) );
  INVX1 U17 ( .A(in[2]), .Y(n8) );
  MUX2X1 U18 ( .B(n9), .A(N3), .S(in[16]), .Y(out[1]) );
  INVX1 U19 ( .A(in[1]), .Y(n9) );
  MUX2X1 U20 ( .B(n10), .A(N17), .S(in[16]), .Y(out[15]) );
  INVX1 U21 ( .A(in[15]), .Y(n10) );
  MUX2X1 U22 ( .B(n11), .A(N16), .S(in[16]), .Y(out[14]) );
  INVX1 U23 ( .A(in[14]), .Y(n11) );
  MUX2X1 U24 ( .B(n12), .A(N15), .S(in[16]), .Y(out[13]) );
  INVX1 U25 ( .A(in[13]), .Y(n12) );
  MUX2X1 U26 ( .B(n13), .A(N14), .S(in[16]), .Y(out[12]) );
  INVX1 U27 ( .A(in[12]), .Y(n13) );
  MUX2X1 U28 ( .B(n14), .A(N13), .S(in[16]), .Y(out[11]) );
  INVX1 U29 ( .A(in[11]), .Y(n14) );
  MUX2X1 U30 ( .B(n15), .A(N12), .S(in[16]), .Y(out[10]) );
  INVX1 U31 ( .A(in[10]), .Y(n15) );
  MUX2X1 U32 ( .B(n16), .A(N2), .S(in[16]), .Y(out[0]) );
  INVX1 U33 ( .A(in[0]), .Y(n16) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   dr_sync, lc_sync, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] raw_out;

  sync_low_1 sdr ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr_sync) );
  sync_low_0 slc ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc_sync) );
  controller c ( .clk(clk), .n_rst(n_reset), .dr(dr_sync), .lc(lc_sync), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), 
        .op(op), .src1(src1), .src2(src2), .dest(dest), .err(err) );
  datapath p ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), 
        .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), 
        .outreg_data(raw_out), .overflow(overflow) );
  counter sc ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude mag ( .in(raw_out), .out(fir_out) );
endmodule


module ahb_lite_fir_filter ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp );
  input [3:0] haddr;
  input [1:0] htrans;
  input [15:0] hwdata;
  output [15:0] hrdata;
  input clk, n_rst, hsel, hsize, hwrite;
  output hresp;
  wire   modwait, err, new_coefficient_set, data_ready, load_coeff;
  wire   [15:0] fir_out;
  wire   [1:0] coefficient_num;
  wire   [15:0] fir_coefficient;
  wire   [15:0] sample_data;

  ahb_lite_slave ahb ( .clk(clk), .n_rst(n_rst), .sample_data(sample_data), 
        .data_ready(data_ready), .new_coefficient_set(new_coefficient_set), 
        .coefficient_num(coefficient_num), .fir_coefficient(fir_coefficient), 
        .modwait(modwait), .fir_out(fir_out), .err(err), .hsel(hsel), .haddr(
        haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(
        hwdata), .hrdata(hrdata), .hresp(hresp) );
  coefficient_loader cldr ( .clk(clk), .n_rst(n_rst), .new_coefficient_set(
        new_coefficient_set), .modwait(modwait), .load_coeff(load_coeff), 
        .coefficient_num(coefficient_num) );
  fir_filter fir ( .clk(clk), .n_reset(n_rst), .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), .load_coeff(load_coeff), 
        .data_ready(data_ready), .modwait(modwait), .fir_out(fir_out), .err(
        err) );
endmodule

