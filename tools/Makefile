.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c99 -Wall -Wextra -pedantic

tools := scan_includes gfx compressor text golf golf_patch

all: $(tools)
	@:

clean:
	rm -f $(tools)

gfx: common.h
%: %.c
	$(CC) $(CFLAGS) -o $@ $<
