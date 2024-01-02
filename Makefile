rom := wl3.gbc

rom_obj := \
src/action_help.o \
src/audio.o \
src/golf.o \
src/home.o \
src/main.o \
src/wram.o \
src/hram.o \
src/gfx.o

wl3_obj := $(rom_obj:.o=.o)

### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all wl3 clean tidy compare tools

all: $(rom) compare
wl3: $(rom) compare

clean: tidy
	find src/gfx \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pal' -o -iname '*.rle' \) -delete
	find src/text \( -iname '*.rle' \) -delete
	find src/data \( -iname '*.rle' \) -delete

tidy:
	rm -f $(rom) $(rom_obj) $(rom:.gbc=.map) $(rom:.gbc=.sym) src/rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(rom)
	@$(SHA1) -c rom.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -h -P includes.asm -I src/ -L -Weverything
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

src/rgbdscheck.o: src/rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes -s -i src/ $2) | src/rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for objects
$(foreach obj, $(rom_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


%.asm: ;


opts = -Cjv -k 01 -l 0x33 -m 0x1b -p 0 -r 03 -t WARIOLAND3 -i AW8A

$(rom): $(rom_obj) src/layout.link
	$(RGBLINK) -p 0xff -m $(rom:.gbc=.map) -n $(rom:.gbc=.sym) -l src/layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) $(opts) $@

### Compression exceptions for matching purposes

src/gfx/overworld/overworld5.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/prince_froggy.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/webber.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/count_richtertoffen.2bpp.rle: tools/compressor += --force-trailing-copy
src/gfx/enemies/para_goom.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/fire_bot.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/togeba.2bpp.rle: tools/compressor += --force-trailing-repeat
src/gfx/enemies/octohon.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/anonster1.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/wormwould1.2bpp.rle: tools/compressor += --force-trailing-copy
src/gfx/enemies/anonster2.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/scowler2.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/muddee2.2bpp.rle: tools/compressor += --force-trailing-copy
src/gfx/enemies/shoot2.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/anonster3.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/shoot3.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/enemies/anonster4.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/golf/golf.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/golf/golf_lobby.2bpp.rle: tools/compressor += --no-trailing-repeat
src/gfx/misc/action_help_objects1.2bpp.rle: tools/compressor += --force-trailing-repeat
src/gfx/misc/action_help_objects2.2bpp.rle: tools/compressor += --force-trailing-repeat

src/gfx/bgmaps/map_b34c3.bin.rle: tools/compressor += --force-trailing-copy

src/text/text_b232f.bin.rle: tools/compressor += --force-trailing-copy
src/text/text_b2424.bin.rle: tools/compressor += --force-trailing-copy

src/data/levels/unknown2/data_ef52c.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/unknown2/data_10345c.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/unknown2/data_103a6d.bin.rle: tools/compressor += --force-trailing-copy

### Catch-all graphics rules

%.rle: %
	tools/compressor $(tools/compressor) $<

%.pal: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)
