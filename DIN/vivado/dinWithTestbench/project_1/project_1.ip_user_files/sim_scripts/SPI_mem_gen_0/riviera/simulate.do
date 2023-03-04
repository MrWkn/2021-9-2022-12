onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+SPI_mem_gen_0 -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.SPI_mem_gen_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {SPI_mem_gen_0.udo}

run -all

endsim

quit -force
