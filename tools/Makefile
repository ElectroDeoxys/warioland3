.PHONY: all clean

CC := gcc
CFLAGS := -O3 -std=c17 -Wall -Wextra -pedantic

tools := compressor gfx golf golf_patch make_patch scan_includes text

all: $(tools)
	@:

clean:
	rm -f $(tools)

%: %.c common.h
	$(CC) $(CFLAGS) -o $@ $<
