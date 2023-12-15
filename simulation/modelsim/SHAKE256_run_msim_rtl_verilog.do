transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv {C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv/KECCAK_f.sv}
vlog -sv -work work +incdir+C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv {C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv/S_to_A.sv}
vlog -sv -work work +incdir+C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv {C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv/A_to_S.sv}
vlog -sv -work work +incdir+C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv {C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv/theta.sv}

vlog -sv -work work +incdir+C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv {C:/Users/ngtph/OneDrive/references/Codes/GitHubs/SHAKE256_sv/KECCAK_f_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  KECCAK_f_tb

add wave *
view structure
view signals
run -all
