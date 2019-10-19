#-----------------------------------------------------------------------------
# Part of midgetv
# 2019. Copyright B. Nossum.
# For licence, see LICENCE
# -----------------------------------------------------------------------------

OBJDIR = ../obj_dir
BINDIR = ../bin
VERILOGDIR = ../code
SB_SIMMOD = ../code/sb_sim_rtl

GCCFLAGS = -O3 -I $(OBJDIR) -I/usr/share/verilator/include -I/usr/share/verilator/include/vltstd -Wall

VERILATORFLAGS = -Wall -v m_ice_shortcuts.v -I$(VERILOGDIR) -I$(VERILOGDIR)/simcode -I$(SB_SIMMOD) -Mdir $(OBJDIR) -cc --x-assign 1

#
#MY = m_inputmux m_immexp_zfind_q m_rai m_wai \
#	m_bmask_emask m_condcode 


MY = m_ice40sim_EBRonly m_ice40sim_SRAM \
	m_ucodepc \
	m_alu_carryin m_alu m_cyclecnt m_shiftcounter 

#m_ice40sim_SRAM4_EBR16  \
#	m_ucodepc m_alu

TARGETS:=$(foreach i,$(MY),$(BINDIR)/$(i).bin)

#u
# I do not really master the build process of Verilator.
# The following is a quick and dirty solution to help 'make clean'
#
FORCLEANING:=$(foreach i,$(MY),$(OBJDIR)/V$(i)*)

all:$(TARGETS)

$(OBJDIR)/V%.cpp:$(VERILOGDIR)/%.v
	verilator $(VERILATORFLAGS) $<

$(OBJDIR)/V%.cpp:$(VERILOGDIR)/simcode/%.v
	verilator $(VERILATORFLAGS) $<

$(OBJDIR)/V%__ALL.a:$(OBJDIR)/V%.cpp
	cd $(OBJDIR); make -f V$(*F).mk; cd -; 

$(BINDIR)/%.bin:%.cpp $(OBJDIR)/V%__ALL.a 
	g++ $(GCCFLAGS) $< $(OBJDIR)/V$(*F)__ALL.a /usr/share/verilator/include/verilated.cpp -o $@


$(BINDIR)/m_ucodepc.bin:m_ucodepc.cpp $(OBJDIR)/Vm_ucodepc__ALL.a common.cpp ../code/ucode.h
	g++ $(GCCFLAGS) $< $(OBJDIR)/Vm_ucodepc$(*F)__ALL.a /usr/share/verilator/include/verilated.cpp common.cpp -o $@

$(BINDIR)/m_ice%.bin:m_ice%.cpp $(OBJDIR)/Vm_ice%__ALL.a common.cpp ../code/ucode.h
	g++ $(GCCFLAGS) $< $(OBJDIR)/Vm_ice$(*F)__ALL.a /usr/share/verilator/include/verilated.cpp common.cpp -o $@



clean:
	rm $(TARGETS) $(FORCLEANING)


# .SECONDARY:
# verilator -Wall -I.. -cc $<
