SECTION "VRAM0", VRAM

v0Tiles0:: ds $80 tiles ; 8000
v0Tiles1:: ds $80 tiles ; 8800
v0Tiles2:: ds $80 tiles ; 9000

v0BGMap0:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT ; 9800
v0BGMap1:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT ; 9c00

v0End:: ; a000

SECTION "VRAM1", VRAM

v1Tiles0:: ds $80 tiles ; 8000
v1Tiles1:: ds $80 tiles ; 8800
v1Tiles2:: ds $80 tiles ; 9000

v1BGMap0:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT ; 9800
v1BGMap1:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT ; 9c00

v1End:: ; a000
