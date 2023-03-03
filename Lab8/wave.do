onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group System -color Gray60 /tb_apb_uart_rx/tb_clk
add wave -noupdate -expand -group System -color Gray60 /tb_apb_uart_rx/tb_n_rst
add wave -noupdate -expand -group Controls -color Wheat /tb_apb_uart_rx/tb_psel
add wave -noupdate -expand -group Controls -color Wheat /tb_apb_uart_rx/tb_penable
add wave -noupdate -expand -group Controls -color Wheat /tb_apb_uart_rx/tb_pwrite
add wave -noupdate -expand -group {Config Write} -color {Dark Olive Green} /tb_apb_uart_rx/tb_paddr
add wave -noupdate -expand -group {Config Write} -color {Dark Olive Green} /tb_apb_uart_rx/tb_pwdata
add wave -noupdate -expand -group {Config State} -color {Olive Drab} /tb_apb_uart_rx/APB/data_size
add wave -noupdate -expand -group {Config State} -color {Olive Drab} /tb_apb_uart_rx/APB/bit_period
add wave -noupdate -expand -group {Config State} -color {Olive Drab} /tb_apb_uart_rx/APB/apb/data_buf
add wave -noupdate -expand -group {Config State} -color {Olive Drab} /tb_apb_uart_rx/APB/data_ready
add wave -noupdate -color {Dark Green} /tb_apb_uart_rx/APB/data_read
add wave -noupdate -color {Dark Green} /tb_apb_uart_rx/APB/overrun_error
add wave -noupdate -color {Dark Green} /tb_apb_uart_rx/APB/framing_error
add wave -noupdate -expand -group Input /tb_apb_uart_rx/APB/serial_in
add wave -noupdate -expand -group Output -color Gold /tb_apb_uart_rx/tb_prdata
add wave -noupdate -expand -group Output -color Gold /tb_apb_uart_rx/tb_pslverr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {145601 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
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
run 1000ns
WaveRestoreZoom {0 ps} {134942 ps}
