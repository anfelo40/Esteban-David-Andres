vsim -t ns sim_avr_109

add wave *

add wave -position insertpoint  \
sim:/sim_avr_109/avr_109/avr109rx_inst/rx_data \
sim:/sim_avr_109/avr_109/avr109rx_inst/rx_avail \
sim:/sim_avr_109/avr_109/avr109rx_inst/rxd \
sim:/sim_avr_109/avr_109/state_q \
sim:/sim_avr_109/avr_109/cnt_q

force clk 1 0, 0 {10 ns} -r 20

force reset_n 1
run 20us

force reset_n 0

force ena_in 1

# STATE_INACTIVE
force data_in "00011011"
run 36.1us

# STATE_ATTACHING
force data_in "10101010"
run 36.1us
force data_in "00011011"
run 36.1us
force data_in "10101010"
run 36.1us
force data_in "00011011"
run 36.1us
force data_in "10101010"
run 36.1us
force data_in "00011011"
run 36.1us

# STATE_IDLE
force data_in "01000001"
run 36.1us

# STATE_SET_ADDR_HI
# AH
force data_in "11110000"
run 36.1us
# AL
force data_in "11111111"
run 36.1us

force ena_in 0

run 0.4 ms