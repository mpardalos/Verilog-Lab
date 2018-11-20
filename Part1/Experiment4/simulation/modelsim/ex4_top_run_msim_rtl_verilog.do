transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4/ex4_top.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part1/Experiment4/add3_ge5.v}

