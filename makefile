.PHONY: vdkcf kcf pad vdpad shake vdshake

shake:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top SHAKE256_tb
	./simv

kcf:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top KECCAK_f_tb
	./simv

pad:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top pad_tb
	./simv

vdkcf:
	verdi -sverilog -f filelist.f -top KECCAK_f

vdpad:
	verdi -sverilog -f filelist.f -top pad

vdshake:
	verdi -sverilog -f filelist.f -top SHAKE256