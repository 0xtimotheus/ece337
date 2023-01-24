onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /tb_adder_16bit/tb_test_case_num
add wave -noupdate -color Gold /tb_adder_16bit/tb_test_case
add wave -noupdate -color Gold /tb_adder_16bit/tb_test_case_stage
add wave -noupdate -color Gold /tb_adder_16bit/tb_test_case_err
add wave -noupdate -divider {DUT Signals}
add wave -noupdate -color {Green Yellow} /tb_adder_16bit/tb_a
add wave -noupdate -color {Green Yellow} /tb_adder_16bit/tb_b
add wave -noupdate -color {Green Yellow} /tb_adder_16bit/tb_carry_in
add wave -noupdate -expand -group Sum -color {Blue Violet} /tb_adder_16bit/tb_sum
add wave -noupdate -expand -group Sum -color Cyan /tb_adder_16bit/tb_overflow
add wave -noupdate -expand -group Overflow -color {Blue Violet} /tb_adder_16bit/tb_expected_sum
add wave -noupdate -expand -group Overflow -color Cyan /tb_adder_16bit/tb_expected_overflow
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
WaveRestoreZoom {0 ps} {155030 ps}
run 150ns
