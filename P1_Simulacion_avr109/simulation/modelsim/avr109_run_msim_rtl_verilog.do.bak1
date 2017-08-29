transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/anfelo40/Documentos/Proyectos_Micros/avr109 {/home/anfelo40/Documentos/Proyectos_Micros/avr109/avr109tx.v}
vlog -vlog01compat -work work +incdir+/home/anfelo40/Documentos/Proyectos_Micros/avr109 {/home/anfelo40/Documentos/Proyectos_Micros/avr109/avr109rx.v}
vlog -vlog01compat -work work +incdir+/home/anfelo40/Documentos/Proyectos_Micros/avr109 {/home/anfelo40/Documentos/Proyectos_Micros/avr109/avr109.v}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/registro.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/codificador.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/contador_104us.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/control_path_us.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/ pkg_USART_transm.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/sim_avr_109.vhd}
vcom -93 -work work {/home/anfelo40/Documentos/Proyectos_Micros/P1_Simulacion_avr109/USART_transm.vhd}

