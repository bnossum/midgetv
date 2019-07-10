
OBJDIR = ../obj_dir
BINDIR = ../bin
VERILOGDIR = ../code
SB_SIMMOD = ../code/sb_sim_rtl

GCCFLAGS = -I $(OBJDIR) -I/usr/share/verilator/include -I/usr/share/verilator/include/vltstd -Wall

VERILATORFLAGS = -Wall -I$(VERILOGDIR) -I$(SB_SIMMOD) -Mdir $(OBJDIR) -cc --x-assign 1

#
#MY = m_inputmux m_cyclecnt m_alu_carryin m_alu m_immexp_zfind_q m_rai m_wai \
#	m_bmask_emask m_condcode m_shiftcounter \
#	m_ice40sim  m_ice40sim_EBRonly 

MY =  m_ice40sim_EBRonly m_ice40sim

TARGETS:=$(foreach i,$(MY),$(BINDIR)/$(i).bin)

all:$(TARGETS)

.SECONDARY:

$(OBJDIR)/V%.cpp:$(VERILOGDIR)/%.v
	verilator $(VERILATORFLAGS) $<

# verilator -Wall -I.. -cc $<

$(OBJDIR)/V%__ALL.a:$(OBJDIR)/V%.cpp
	cd $(OBJDIR); make -f V$(*F).mk; cd -; 

$(BINDIR)/%.bin:%.cpp $(OBJDIR)/V%__ALL.a
	g++ $(GCCFLAGS) $< $(OBJDIR)/V$(*F)__ALL.a /usr/share/verilator/include/verilated.cpp common.cpp -o $@


