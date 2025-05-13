rom := warioland3.gbc

rom_obj := \
src/action_help.o \
src/audio.o \
src/gfx.o \
src/golf.o \
src/home.o \
src/main.o \
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
	find src/data \( -iname '*.rle' \) -delete

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

src/gfx/bgmaps/map_b34c3.attrmap.rle: tools/compressor += --force-trailing-copy
src/gfx/bgmaps/map_1c15c5.tilemap.rle: tools/compressor += --force-trailing-copy
src/gfx/bgmaps/map_1c1651.attrmap.rle: tools/compressor += --force-trailing-copy
src/gfx/bgmaps/map_1c168a.tilemap.rle: tools/compressor += --force-trailing-copy
src/gfx/bgmaps/map_1c1716.attrmap.rle: tools/compressor += --force-trailing-copy
src/gfx/bgmaps/map_1c1756.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c17c6.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1824.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1850.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1869.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c18be.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c18fd.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1973.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c19c5.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1a1c.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1a80.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1ae5.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1b2c.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1b78.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1bc6.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1c2b.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1c82.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1cd8.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1d24.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1d7a.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1dd0.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1e25.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1e6e.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1ed2.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1f18.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1f8f.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c1ffd.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2047.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2084.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c20c9.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c210b.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c218e.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c21e7.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c224f.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2287.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2303.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2361.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c23bc.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2410.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c247d.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c24db.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c254d.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c25b6.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c25e5.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c25f8.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2656.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c26ad.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2725.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c277e.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c27cc.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2819.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c288c.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c28e3.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c292c.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2970.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c29e1.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2a45.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2a73.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2aaf.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2b03.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2b55.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2b9b.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2bdd.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2c41.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2c9e.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2cec.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2d30.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2d93.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2ddc.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2e39.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2e88.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2efc.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2f55.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2fa8.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c2ffc.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c3062.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c30b7.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c3119.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c316a.tilemap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/map_1c31e4.attrmap.rle: tools/compressor += --force-trailing-repeat
src/gfx/bgmaps/hidden_figure2.tilemap.rle: tools/compressor += --force-trailing-repeat

src/text/text_b232f.tilemap.rle: tools/compressor += --force-trailing-copy
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

%.tilemap: %.txt
	tools/text $(tools/text) -o $@ $<

%.rle: %
	tools/compressor $(tools/compressor) $<
