.PHONY: vdkcf kcf pad vdpad shake256 vdshake256

shake256:
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

vdshake256:
	verdi -sverilog -f filelist.f -top SHAKE256