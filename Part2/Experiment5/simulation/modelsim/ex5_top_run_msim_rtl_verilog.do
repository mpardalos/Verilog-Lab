transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment5 {/home/mpardalos/Documents/Imperial/Year_2/Lab/VERI/Part2/Experiment5/counter_8.v}

