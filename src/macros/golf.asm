MACRO terrain_tee_box
REPT 7
	db GOLF_TERRAIN_TEE_BOX
ENDR
DEF num_terrain_blocks = 7
ENDM

MACRO terrain_tee_box_edge
REPT 5
	db GOLF_TERRAIN_TEE_BOX | GOLF_TERRAIN_EDGE_RIGHT
ENDR
REPT 2
	db GOLF_TERRAIN_TEE_BOX
ENDR
DEF num_terrain_blocks = 7
ENDM

; arg 1 = type of block
; arg 2 = n blocks to place
MACRO terrain_n_blocks
REPT \2
	db \1
ENDR
DEF num_terrain_blocks = num_terrain_blocks + \2
ENDM

; arg 1 = type of block
; arg 2 = n blocks to place (including edges)
MACRO terrain_n_blocks_edges
assert \2 >= 2, "Must be at least 2 blocks wide"
	db \1 | GOLF_TERRAIN_EDGE_LEFT
	terrain_n_blocks \1, \2 - 2
	db \1 | GOLF_TERRAIN_EDGE_RIGHT
DEF num_terrain_blocks = num_terrain_blocks + 2
ENDM

; arg 1 = n plain blocks to place
MACRO terrain_plain
	terrain_n_blocks GOLF_TERRAIN_PLAIN, \1
ENDM

; arg 1 = n bunker blocks to place
MACRO terrain_bunker
	terrain_n_blocks GOLF_TERRAIN_BUNKER, \1
ENDM

; arg 1 = n rough blocks to place
MACRO terrain_rough
	terrain_n_blocks GOLF_TERRAIN_ROUGH, \1
ENDM

; arg 1 = n water blocks to place
MACRO terrain_water_1
	terrain_n_blocks_edges GOLF_TERRAIN_WATER, \1
ENDM

; arg 1 = n water blocks to place
MACRO terrain_water_2
	terrain_n_blocks_edges GOLF_TERRAIN_WATER | GOLF_TERRAIN_2ND_WATER , \1
ENDM

; arg 1 = n water blocks to place
MACRO terrain_ob
	terrain_n_blocks_edges GOLF_TERRAIN_OB , \1
ENDM

MACRO terrain_hole
	terrain_n_blocks_edges GOLF_TERRAIN_HOLE, 2
ENDM

MACRO terrain_end
	db GOLF_TERRAIN_END
DEF num_terrain_blocks = num_terrain_blocks + 1
	assert num_terrain_blocks == NUM_GOLF_LEVEL_BLOCKS, "Expected {d:NUM_GOLF_LEVEL_BLOCKS} blocks, got {d:num_terrain_blocks}"
ENDM

; fills up with arg 1 block until the end
MACRO terrain_blocks_end
REPT (NUM_GOLF_LEVEL_BLOCKS - num_terrain_blocks - 1)
	db \1
DEF num_terrain_blocks = num_terrain_blocks + 1
ENDR
	terrain_end
ENDM

MACRO terrain_plain_end
	terrain_blocks_end GOLF_TERRAIN_PLAIN
ENDM

MACRO terrain_bunker_end
	terrain_blocks_end GOLF_TERRAIN_BUNKER
ENDM

MACRO terrain_ob_end
	db GOLF_TERRAIN_OB | GOLF_TERRAIN_EDGE_LEFT
DEF num_terrain_blocks = num_terrain_blocks + 1
	terrain_blocks_end GOLF_TERRAIN_OB
ENDM
