onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Wheat /tb_fir_filter/tb_clk
add wave -noupdate -expand -group Input /tb_fir_filter/DUT/dr_sync
add wave -noupdate -expand -group Input /tb_fir_filter/DUT/lc_sync
add wave -noupdate -expand -group Datapath -color {Yellow Green} /tb_fir_filter/DUT/op
add wave -noupdate -expand -group Datapath -color Green /tb_fir_filter/DUT/src1
add wave -noupdate -expand -group Datapath -color Green /tb_fir_filter/DUT/src2
add wave -noupdate -expand -group Datapath -color Green /tb_fir_filter/DUT/dest
add wave -noupdate -expand -group Datapath -color Gold /tb_fir_filter/DUT/p/RF/regs_matrix
add wave -noupdate -expand -group Datapath -color Gold /tb_fir_filter/DUT/ext_data1
add wave -noupdate -expand -group Datapath -color Gold /tb_fir_filter/DUT/ext_data2
add wave -noupdate -expand -group Datapath -color {Medium Spring Green} /tb_fir_filter/DUT/overflow
add wave -noupdate -expand -group Output -color {Light Blue} /tb_fir_filter/DUT/raw_out
add wave -noupdate -expand -group Output -color {Slate Blue} /tb_fir_filter/DUT/fir_out
add wave -noupdate -expand -group State -color Wheat /tb_fir_filter/DUT/modwait
add wave -noupdate -expand -group State -color Firebrick /tb_fir_filter/DUT/err
add wave -noupdate -expand -group State -color {Blue Violet} /tb_fir_filter/DUT/c/s
add wave -noupdate -expand -group State -color {Blue Violet} /tb_fir_filter/DUT/c/d
add wave -noupdate -expand -group State -color {Blue Violet} /tb_fir_filter/DUT/c/i
add wave -noupdate -expand -group State -color {Dark Slate Blue} /tb_fir_filter/DUT/c/n
add wave -noupdate -expand -group State -color {Dark Slate Blue} /tb_fir_filter/DUT/c/nd
add wave -noupdate -expand -group State -color {Dark Slate Blue} /tb_fir_filter/DUT/c/ni
add wave -noupdate -expand -group Count -color Firebrick /tb_fir_filter/DUT/clear
add wave -noupdate -expand -group Count -color Gray60 /tb_fir_filter/DUT/cnt_up
add wave -noupdate -expand -group Count -color Turquoise /tb_fir_filter/DUT/one_k_samples
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {95000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 331
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {67618 ps} {318791 ps}
run 10000ns