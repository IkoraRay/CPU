transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/PC.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/RegBank.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/ULA.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/CACHE.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/MUX.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/Controle.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/Instruction_Reg.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/CPU.vhd}
vcom -93 -work work {C:/Users/luiss/Desktop/Pastas/Aula pratica/CPU/MUX_EXT.vhd}

