#
# Ensure the compiler and necessary executables are on the search PATH
#

#
# Ensure you have set the following Variables
#
#

pipe:= |
empty:=
comma:= ,
space:= $(empty) $(empty)

export RISCV_COMPLIANCE_ROOTDIR ?= ../../../riscv-compliance
export RISCV_TARGET       ?= icebreaker_midgetv
export RISCV_DEVICE       ?= rv32i
export RISCV_PREFIX       ?= riscv32-unknown-elf-
export RISCV_TARGET_FLAGS ?=
export RISCV_ASSERT       ?= 0

RISCV_ISA_ALL = $(shell ls -c $(ROOTDIR)/riscv-target/$(RISCV_TARGET)/device)
RISCV_ISA_OPT = $(subst $(space),$(pipe),$(RISCV_ISA_ALL))

ifeq ($(RISCV_ISA),)
    RISCV_ISA = rv32i
    DEFAULT_TARGET=all_variant
else
    DEFAULT_TARGET=variant
endif

RVTEST_DEFINES = 
ifeq ($(RISCV_ASSERT),1)
	RVTEST_DEFINES += -DRVTEST_ASSERT
endif
export RVTEST_DEFINES

export ROOTDIR    = $(shell pwd)
export WORK       = $(ROOTDIR)/work
export SUITEDIR   = $(RISCV_COMPLIANCE_ROOTDIR)/riscv-test-suite/$(RISCV_ISA)
export TARGETDIR ?= $(ROOTDIR)/riscv-target

VERBOSE ?= 0
ifeq ($(VERBOSE),1)
    export V=
    export REDIR1 =
    export REDIR2 =
else
    export V=@
    export REDIR1 = 1>/dev/null
    export REDIR2 = 2>/dev/null
endif

PARALLEL ?= 1
ifeq ($(RISCV_TARGET),spike)
	PARALLEL = 0
endif
ifeq ($(PARALLEL),0)
    JOBS =
else
    ifeq ($(RISCV_TARGET),riscvOVPsim)
        JOBS ?= -j8 --max-load=4
    endif
endif

default: $(DEFAULT_TARGET)

variant: simulate verify

all_variant:
	for isa in $(RISCV_ISA_ALL); do \
		$(MAKE) $(JOBS) RISCV_TARGET=$(RISCV_TARGET) RISCV_TARGET_FLAGS="$(RISCV_TARGET_FLAGS)" RISCV_DEVICE=$$isa RISCV_ISA=$$isa variant; \
			rc=$$?; \
			if [ $$rc -ne 0 ]; then \
				exit $$rc; \
			fi \
	done

simulate:
	$(MAKE) $(JOBS) \
		RISCV_TARGET=$(RISCV_TARGET) \
		RISCV_DEVICE=$(RISCV_DEVICE) \
		RISCV_PREFIX=$(RISCV_PREFIX) \
		run -C $(SUITEDIR)

verify: simulate
	$(RISCV_COMPLIANCE_ROOTDIR)/riscv-test-env/verify.sh

cover:
	riscv-test-env/cover.sh

clean:
	$(MAKE) $(JOBS) \
		RISCV_TARGET=$(RISCV_TARGET) \
		RISCV_DEVICE=$(RISCV_DEVICE) \
		RISCV_PREFIX=$(RISCV_PREFIX) \
		clean -C $(SUITEDIR)

help:
	@echo "eg, make"
	@echo "RISCV_TARGET='riscvOVPsim|spike'"
	@echo "RISCV_TARGET_FLAGS="
	@echo "RISCV_DEVICE='rv32i|rv32im|...'"
	@echo "RISCV_ISA='$(RISCV_ISA_OPT)'"
	@echo "RISCV_TEST='I-ADD-01'"
	@echo "RISCV_ASSERT=0|1"
	@echo "make all_variant // all combinations"

