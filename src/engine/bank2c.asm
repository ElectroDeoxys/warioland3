MusicBoxGfx: ; b0000 (2c:4000)
INCBIN "gfx/music_box.2bpp"
; 0xb0300

BGMap_b0300: ; b0300 (2c:4300)
INCBIN "gfx/bgmaps/map_b0300.bin"
; 0xb0540

BGMap_b0540: ; b0540 (2c:4540)
INCBIN "gfx/bgmaps/map_b0540.bin"
; 0xb0780

BGMap_b0780: ; b0780 (2c:4780)
INCBIN "gfx/bgmaps/map_b0780.bin"
; 0xb0f80

Tiles_b0f80: ; b0f80 (2c:4f80)
INCBIN "gfx/tiles_b0f80.2bpp"
; 0xb1780

PrologueGfx: ; b1780 (2c:5780)
INCBIN "gfx/cutscenes/prologue.2bpp.lz"
; 0xb1d0b

	INCROM $b1d0b, $b330c

BGMap_b330c: ; b330c (2c:730c)
INCBIN "gfx/bgmaps/map_b330c.bin"
; 0xb34c3

BGMap_b34c3: ; b34c3 (2c:74c3)
INCBIN "gfx/bgmaps/map_b34c3.bin"
; 0xb3675

Data_b3675: ; b3675 (2c:7675)
INCBIN "data/data_b3675.bin"
; 0xb37e6

	INCROM $b37e6, $b37f9

Data_b37f9: ; b37f9 (2c:77f9)
INCBIN "data/data_b37f9.bin"
; 0xb39f0

	INCROM $b39f0, $b3a03

BGMap_b3a03: ; b3a03 (2c:7a03)
INCBIN "gfx/bgmaps/map_b3a03.bin"
; 0xb3a5b

BGMap_b3a5b: ; b3a5b (2c:7a5b)
INCBIN "gfx/bgmaps/map_b3a5b.bin"
; 0xb3aaa

	INCROM $b3aaa, $b3c47
