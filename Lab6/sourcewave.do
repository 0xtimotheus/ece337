onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Periodic -color Gold /tb_rcv_block/DUT/clk
add wave -noupdate -expand -group Periodic -color Gold /tb_rcv_block/DUT/strobe
add wave -noupdate -expand -group Periodic -color Wheat /tb_rcv_block/DUT/n_rst
add wave -noupdate -expand -group {Input Signal} -color {Yellow Green} /tb_rcv_block/DUT/serial_in
add wave -noupdate -expand -group {Input Signal} -color {Yellow Green} /tb_rcv_block/DUT/syncing
add wave -noupdate -expand -group {Input Signal} -color {Yellow Green} /tb_rcv_block/DUT/sync_in
add wave -noupdate -expand -group Packet -color Blue /tb_rcv_block/DUT/packet_data
add wave -noupdate -expand -group Packet -color Blue /tb_rcv_block/DUT/rx_data
add wave -noupdate -expand -group Packet -color Blue /tb_rcv_block/DUT/stop_bit
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/new_packet_detected
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/enable_timer
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/framing_error
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/overrun_error
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/packet_done
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/data_ready
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/load_buffer
add wave -noupdate -expand -group Flags -color Thistle /tb_rcv_block/DUT/data_read
add wave -noupdate -expand -group State -color Maroon /tb_rcv_block/DUT/rc/state
add wave -noupdate -expand -group State -color Maroon /tb_rcv_block/DUT/rc/nstate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 291
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
WaveRestoreZoom {0 ps} {1210 ps}
run 1000ns