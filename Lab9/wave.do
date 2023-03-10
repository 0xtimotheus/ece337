onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {System Signals} -color Gray60 /tb_ahb_lite_fir_filter/DUT/ahb/clk
add wave -noupdate -expand -group {System Signals} -color Black /tb_ahb_lite_fir_filter/DUT/ahb/n_rst
add wave -noupdate -expand -group {Transaction Controls} -color {Yellow Green} /tb_ahb_lite_fir_filter/DUT/ahb/hsel
add wave -noupdate -expand -group {Transaction Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/haddr
add wave -noupdate -expand -group {Transaction Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/addr
add wave -noupdate -expand -group {Transaction Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/hsize
add wave -noupdate -expand -group {Transaction Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/size
add wave -noupdate -expand -group {Transaction Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/htrans
add wave -noupdate -expand -group {Transaction Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/trans
add wave -noupdate -expand -group {Transaction Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/hwrite
add wave -noupdate -expand -group {Transaction Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/write
add wave -noupdate -expand -group Outputs -color Thistle /tb_ahb_lite_fir_filter/DUT/hrdata
add wave -noupdate -expand -group Outputs -color {Medium Violet Red} /tb_ahb_lite_fir_filter/DUT/hresp
add wave -noupdate -group Store -color Gold -childformat {{{/tb_ahb_lite_fir_filter/DUT/ahb/store[2]} -radix decimal}} -expand -subitemconfig {{/tb_ahb_lite_fir_filter/DUT/ahb/store[15]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[14]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[13]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[12]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[11]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[10]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[9]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[8]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[7]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[6]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[5]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[4]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[3]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[2]} {-color Gold -height 16 -radix decimal} {/tb_ahb_lite_fir_filter/DUT/ahb/store[1]} {-color Gold -height 16} {/tb_ahb_lite_fir_filter/DUT/ahb/store[0]} {-color Gold -height 16}} /tb_ahb_lite_fir_filter/DUT/ahb/store
add wave -noupdate -group {Filter Controls} -color {Yellow Green} /tb_ahb_lite_fir_filter/DUT/ahb/modwait
add wave -noupdate -group {Filter Controls} -color {Yellow Green} /tb_ahb_lite_fir_filter/DUT/ahb/err
add wave -noupdate -group {Filter Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/wsample
add wave -noupdate -group {Filter Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/data_ready
add wave -noupdate -group {Filter Controls} -color {Dark Olive Green} /tb_ahb_lite_fir_filter/DUT/ahb/wcoeffs
add wave -noupdate -group {Filter Controls} -color {Olive Drab} /tb_ahb_lite_fir_filter/DUT/ahb/new_coefficient_set
add wave -noupdate -expand -group {Filter Signals} -color {Dark Orchid} /tb_ahb_lite_fir_filter/DUT/ahb/sample_data
add wave -noupdate -expand -group {Filter Signals} -color {Slate Blue} /tb_ahb_lite_fir_filter/DUT/ahb/coefficient_num
add wave -noupdate -expand -group {Filter Signals} -color {Blue Violet} /tb_ahb_lite_fir_filter/DUT/ahb/fir_coefficient
add wave -noupdate -expand -group {Filter Signals} -color Magenta /tb_ahb_lite_fir_filter/DUT/ahb/fir_out
add wave -noupdate -expand -group {Filter Signals} -color Gold /tb_ahb_lite_fir_filter/DUT/fir/p/RF/regs_matrix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {880000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 346
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
configure wave -timelineunits ps
update
run 1000ns
WaveRestoreZoom {769963 ps} {910038 ps}
