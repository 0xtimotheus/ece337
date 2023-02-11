onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gray60 /tb_mealy/tb_clk
add wave -noupdate -color Gray60 /tb_mealy/tb_n_rst
add wave -noupdate -color {Medium Slate Blue} /tb_mealy/tb_i
add wave -noupdate -color Magenta /tb_mealy/tb_o
add wave -noupdate -expand -group {Internal State} -color Gold /tb_mealy/m/state
add wave -noupdate -expand -group {Internal State} -color Wheat /tb_mealy/m/out
add wave -noupdate -expand -group {Internal Next State} -color Gold /tb_mealy/m/nstate
add wave -noupdate -expand -group {Internal Next State} -color Wheat /tb_mealy/m/nout
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
run 1000ns
