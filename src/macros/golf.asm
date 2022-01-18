terrain_tee_box: MACRO
rept 7
	db GOLF_TERRAIN_TEE_BOX
endr
num_terrain_blocks = 7
ENDM

terrain_tee_box_edge: MACRO
rept 5
	db GOLF_TERRAIN_TEE_BOX | GOLF_TERRAIN_EDGE_RIGHT
endr
rept 2
	db GOLF_TERRAIN_TEE_BOX
endr
num_terrain_blocks = 7
ENDM

; arg 1 = type of block
; arg 2 = n blocks to place
terrain_n_blocks: MACRO
rept \2
	db \1
endr
num_terrain_blocks = num_terrain_blocks + \2
ENDM

; arg 1 = type of block
; arg 2 = n blocks to place (including edges)
terrain_n_blocks_edges: MACRO
assert \2 >= 2, "Must be at least 2 blocks wide"
	db \1 | GOLF_TERRAIN_EDGE_LEFT
	terrain_n_blocks \1, \2 - 2
	db \1 | GOLF_TERRAIN_EDGE_RIGHT
num_terrain_blocks = num_terrain_blocks + 2
ENDM

; arg 1 = n plain blocks to place
terrain_plain: MACRO
	terrain_n_blocks GOLF_TERRAIN_PLAIN, \1
ENDM

; arg 1 = n bunker blocks to place
terrain_bunker: MACRO
	terrain_n_blocks GOLF_TERRAIN_BUNKER, \1
ENDM

; arg 1 = n rough blocks to place
terrain_rough: MACRO
	terrain_n_blocks GOLF_TERRAIN_ROUGH, \1
ENDM

; arg 1 = n water blocks to place
terrain_water_1: MACRO
	terrain_n_blocks_edges GOLF_TERRAIN_WATER, \1
ENDM

; arg 1 = n water blocks to place
terrain_water_2: MACRO
	terrain_n_blocks_edges GOLF_TERRAIN_WATER | GOLF_TERRAIN_2ND_WATER , \1
ENDM

; arg 1 = n water blocks to place
terrain_ob: MACRO
	terrain_n_blocks_edges GOLF_TERRAIN_OB , \1
ENDM

terrain_hole: MACRO
	terrain_n_blocks_edges GOLF_TERRAIN_HOLE, 2
ENDM

terrain_end: MACRO
	db GOLF_TERRAIN_END
num_terrain_blocks = num_terrain_blocks + 1
	assert num_terrain_blocks == NUM_GOLF_LEVEL_BLOCKS, "Expected {d:NUM_GOLF_LEVEL_BLOCKS} blocks, got {d:num_terrain_blocks}"
ENDM

; fills up with arg 1 block until the end
terrain_blocks_end: MACRO
for n, (NUM_GOLF_LEVEL_BLOCKS - num_terrain_blocks - 1)
	db \1
num_terrain_blocks = num_terrain_blocks + 1
endr
	terrain_end
ENDM

terrain_plain_end: MACRO
	terrain_blocks_end GOLF_TERRAIN_PLAIN
ENDM

terrain_bunker_end: MACRO
	terrain_blocks_end GOLF_TERRAIN_BUNKER
ENDM

terrain_ob_end: MACRO
	db GOLF_TERRAIN_OB | GOLF_TERRAIN_EDGE_LEFT
num_terrain_blocks = num_terrain_blocks + 1
	terrain_blocks_end GOLF_TERRAIN_OB
ENDM
