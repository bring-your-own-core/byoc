# Makefile for WARP-V with OpenPiton

SHELL=/bin/bash

export PATH:=$(shell pwd)/env/bin:$(PATH)

.PHONY: all clean compile

# Run SandPiper Cloud Edition(TM) (SandPiper(TM) in the cloud for open-source code).
out/warp-v_openpiton.sv: warp-v_openpiton.tlv ./submodule/warp-v.tlv
	rm -rf rtl/spout
	curl -F 'top.tlv=@warp-v_openpiton.tlv' -F 'files[]=@./submodule/warp-v.tlv' http://saas.makerchip.com/sandpiper | tar -zx && cat out/stdout
	mv out rtl/spout
	sed -i 's/wire\( \[[^\[]\+\] L1_Mem_Value_\)/reg\1/' ./rtl/spout/warp-v_openpiton.sv
	sed -i 's/wire\( \[[^\[]\+\] FETCH_Instr_Regs_value_\)/reg\1/' ./rtl/spout/warp-v_openpiton_gen.sv
	exit `cat ./rtl/spout/status`

compile: .rtl/spout/warp-v_openpiton.sv

all: compile

clean:
	rm -rf rtl/spout
