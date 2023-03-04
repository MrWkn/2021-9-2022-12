onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib synapse_mem_0_opt

do {wave.do}

view wave
view structure
view signals

do {synapse_mem_0.udo}

run -all

quit -force
