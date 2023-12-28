.PHONY: vdkcf kcf pad vdpad shake vdshake

shake:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top SHAKE256_tb -v altera_mf.v +compsdf
	./simv

kcf:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top KECCAK_f_tb -v altera_mf.v +compsdf
	./simv

pad:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f -top pad_tb -v altera_mf.v +compsdf
	./simv

vdkcf:
	verdi -sverilog -f filelist.f -top KECCAK_f -v altera_mf.v

vdpad:
	verdi -sverilog -f filelist.f -top pad -v altera_mf.v

vdshake:
	verdi -sverilog -f filelist.f -top SHAKE256 -v altera_mf.v