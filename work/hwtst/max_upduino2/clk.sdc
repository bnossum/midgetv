# ##############################################################################
# iCEcube SDC
# Version:            2017.08.27940
# File Generated:     Sep 21 2019 22:00:37
# ##############################################################################
# 2.74

####---- CreateClock list ----2
# create_clock  -period 1.6 -name {vfclk} [get_nets {i_fm_xmit.i_fclk.vfclk}] 
# create_clock  -period 3.2 -name {fclk} [get_nets {i_fm_xmit.fclk}] 
create_clock  -period 83.00 -name {CLK_I} [get_ports {CLK_I}] 

