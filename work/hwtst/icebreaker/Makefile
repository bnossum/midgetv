all:hardware.bin

icebreaker.json:icebreaker.v
	/home/bnossum/.apio/packages/toolchain-icestorm/bin/yosys -p 'synth_ice40 -json icebreaker.json' icebreaker.v > icebreaker_synth.log

icebreaker.blif:icebreaker.v
	/home/bnossum/.apio/packages/toolchain-icestorm/bin/yosys -p 'synth_ice40 -blif icebreaker.blif' icebreaker.v > icebreaker_synth.log

# At a certain stage, needed --seed to get forward progress
#
icebreaker.asc:icebreaker.json
	nextpnr-ice40 --up5k --package sg48 --json icebreaker.json --pcf icebreaker.pcf --asc icebreaker.asc -q --seed 0 -l icebreaker_placeroute.log

# nextpnr-ice40 --up5k --package sg48 --json icebreaker.json --pcf icebreaker.pcf --asc icebreaker.asc -q -l icebreaker_placeroute.log
 

hardware.bin:icebreaker.asc
	icepack icebreaker.asc hardware.bin

# Followed by
# sudo iceprog icebreaker.bin

clean:
	rm icebreaker.json icebreaker.asc icebreaker.blif hardware.bin

