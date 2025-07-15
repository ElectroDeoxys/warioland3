rom := warioland3.gbc

rom_obj := \
src/action_help.o \
src/audio.o \
src/clear.o \
src/golf.o \
src/home.o \
src/level.o \
src/main.o \
src/pause.o \
src/title.o \
src/overworld.o \
src/ram.o

warioland3_obj := $(rom_obj:.o=.o)

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
.PHONY: all warioland3 clean tidy compare tools

all: $(rom) compare
warioland3: $(rom) compare

clean: tidy
	find src/gfx \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.rle' \) -delete
	find src/text \( -iname '*.rle' \) -delete
	find src/text/en \( -iname '*.tilemap' \) -delete
	find src/text/jp \( -iname '*.tilemap' \) -delete
	find src/data \( -iname '*.rle' \) -delete
	find src/data/golf/holes \( -iname '*.bin' -o -iname '*.tilemap' -o -iname '*.attrmap' \) -delete

tidy:
	rm -f $(rom) $(rom_obj) $(rom:.gbc=.map) $(rom:.gbc=.sym) src/rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(rom)
	@$(SHA1) -c rom.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -P includes.asm -I src/ -Weverything
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
$1: $2 $$(shell tools/scan_includes -s $2) | src/rgbdscheck.o
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


opts = -Cjv -k 01 -l 0x33 -m MBC5+RAM+BATTERY -p 0 -r 03 -t WARIOLAND3 -i AW8A

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

src/data/overworld/bgmaps/prologue.attrmap.rle: tools/compressor += --force-trailing-copy
src/data/bgmaps/golf/background_1.tilemap.rle: tools/compressor += --force-trailing-copy
src/data/bgmaps/golf/background_1.attrmap.rle: tools/compressor += --force-trailing-copy
src/data/bgmaps/golf/background_2.tilemap.rle: tools/compressor += --force-trailing-copy
src/data/bgmaps/golf/background_2.attrmap.rle: tools/compressor += --force-trailing-copy
src/data/golf/holes/%.tilemap.rle: tools/compressor += --force-trailing-repeat
src/data/golf/holes/%.attrmap.rle: tools/compressor += --force-trailing-repeat

src/text/jp/hidden_figure_replenish_power.tilemap.rle: tools/compressor += --force-trailing-copy
src/text/en/hidden_figure_replenish_power.tilemap.rle: tools/compressor += --force-trailing-copy

src/data/levels/block_map/the_peaceful_village_1.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/block_map/tower_of_revival.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/block_map/the_peaceful_village_2.bin.rle: tools/compressor += --force-trailing-copy

src/data/levels/blocksets/blockset_attributes_20.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/blocksets/blockset_attributes_50.bin.rle: tools/compressor += --force-trailing-copy
src/data/levels/blocksets/blockset_attributes_52.bin.rle: tools/compressor += --force-trailing-copy

### Interleaved gfx

src/gfx/cutscenes/%.2bpp: tools/gfx += --interleave --png=$<
src/gfx/enemies/%.2bpp: tools/gfx += --interleave --png=$<
src/gfx/golf/golf_flag.2bpp: tools/gfx += --interleave --png=$<
src/gfx/golf/golf_hole_flag.2bpp: tools/gfx += --interleave --png=$<
src/gfx/golf/unused_golf_flag.2bpp: tools/gfx += --interleave --png=$<
src/gfx/intro/plane.2bpp: tools/gfx += --interleave --png=$<
src/gfx/levels/common.2bpp: tools/gfx += --interleave --png=$<
src/gfx/misc/action_help_objects1.2bpp: tools/gfx += --interleave --png=$<
src/gfx/misc/action_help_objects2.2bpp: tools/gfx += --interleave --png=$<
src/gfx/treasures/%.2bpp: tools/gfx += --interleave --png=$<
src/gfx/wario/%.2bpp: tools/gfx += --interleave --png=$<

### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

### Golf holes
# golf_patch is used to take care of some discrepancies between
# tools/golf building algorithm and the original game, for matching purposes

%.bin %_1.tilemap %_2.tilemap %_1.attrmap %_2.attrmap &: %.golf
	tools/golf $(tools/golf) $< $*.bin $*_1.tilemap $*_2.tilemap $*_1.attrmap $*_2.attrmap
	tools/golf_patch $(tools/golf_patch) $(notdir $*) $*_1.tilemap $*_2.tilemap $*_1.attrmap $*_2.attrmap

### Text BG tile maps

%.tilemap: %.txt
	tools/text $(tools/text) -o $@ $<

### Compressed data

%.rle: %
	tools/compressor $(tools/compressor) $<
