transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6/clktick.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib/add3_ge5.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/lib/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6/ex6_top.v}
vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment6/counter_16.v}

