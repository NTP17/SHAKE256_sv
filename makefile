.PHONY: vd svc

svc:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f
	./simv

vd:
	verdi -sverilog KECCAK_f.sv S_to_A.sv A_to_S.sv theta.sv rho.sv pi.sv chi.sv rc.sv iota.sv Rnd.sv round_counter.sv
