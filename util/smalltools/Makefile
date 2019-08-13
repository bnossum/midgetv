#
# Some very small utilities that I probably will forget I made
#

SRC = explain_RAM localsplit_to16 localsplit_to2 localsplit_to4 \
	localsplit_to8 mangle2 mangle4 mangle8 stupid_binwriter

TRGDIR = ../../obj_dir


BINTARGETSEBR := $(foreach i,$(SRC),$(TRGDIR)/$(i).bin)

all: $(BINTARGETSEBR)

$(TRGDIR)/%.bin:%.c
	gcc -Wall -Wextra -o $@ $<
