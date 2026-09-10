# Create work library if not present
vlib work

# Compile DUT,Interface, Package, and Top module
vlog -sv 4_bit_mul.v mul_if.sv mul_pkg.sv tb_top.sv

# Load simulation with full signal visibility (+acc)
vsim -voptargs="+acc" tb_top +UVM_TESTNAME=test

#start simulation
vsim -voptargs=+acc tb_top
# Add waveforms for GUI debugging
#add wave -position insertpoint sim:/tb_top/mif/*
add wave -position insertpoint sim:/tb_top/dut/*

# Run simulation
run -all
