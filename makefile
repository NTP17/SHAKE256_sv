.PHONY: svc
svc:
	vcs -sverilog -timescale=1ps/1ps -f filelist.f
	./simv
