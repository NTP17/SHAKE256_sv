.PHONY: vdkcf kcf pad vdpad shake vdshake

shake:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top SHAKE256_tb +rad
	./simv

kcf:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top KECCAK_f_tb +rad
	./simv

pad:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top pad_tb +rad
	./simv

vdkcf:
	verdi -sverilog -f filelist.f -top KECCAK_f +rad

vdpad:
	verdi -sverilog -f filelist.f -top pad +rad

vdshake:
	verdi -sverilog -f filelist.f -top SHAKE256 +rad