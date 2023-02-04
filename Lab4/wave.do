onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Cyan /tb_flex_counter/DUT/clk
add wave -noupdate -expand -group Inputs -color {Yellow Green} /tb_flex_counter/DUT/n_rst
add wave -noupdate -expand -group Inputs -color {Yellow Green} /tb_flex_counter/DUT/clear
add wave -noupdate -expand -group Inputs -color {Yellow Green} /tb_flex_counter/DUT/count_enable
add wave -noupdate -expand -group Inputs -color {Olive Drab} /tb_flex_counter/DUT/rollover_val
add wave -noupdate -expand -group Outputs -color Gold /tb_flex_counter/DUT/count_out
add wave -noupdate -expand -group Outputs -color {Slate Blue} /tb_flex_counter/DUT/rollover_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1 ns}
run 150ns