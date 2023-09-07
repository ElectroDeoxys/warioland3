GolfLevel01:
	; terrain blocks
	terrain_tee_box
	terrain_plain 8
	terrain_bunker 6
	terrain_plain 5
	terrain_hole
	terrain_plain_end

	db PAR_3
	dw $360 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel00:
	; terrain blocks
	terrain_tee_box
	terrain_plain 9
	terrain_rough 10
	terrain_plain 4
	terrain_rough 4
	terrain_plain 1
	terrain_bunker 6
	terrain_plain 2
	terrain_hole
	terrain_plain 5
	terrain_ob_end

	db PAR_4
	dw $580 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel10:
	; terrain blocks
	terrain_tee_box
	terrain_plain 11
	terrain_bunker 8
	terrain_plain 3
	terrain_rough 6
	terrain_plain 4
	terrain_hole
	terrain_plain 1
	terrain_bunker 6
	terrain_plain_end

	db PAR_3
	dw $500 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel06:
	; terrain blocks
	terrain_tee_box
	terrain_plain 7
	terrain_water_1 8
	terrain_plain 3
	terrain_water_2 2
	terrain_plain 9
	terrain_ob 12
	terrain_plain 11
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_5
	dw $780 ; hole X pos
	db 13 ; 1st water patch spawn block
	db 24 ; 2nd water patch spawn block


GolfLevel05:
	; terrain blocks
	terrain_tee_box
	terrain_plain 1
	terrain_ob 6
	terrain_plain 6
	terrain_water_1 7
	terrain_plain 7
	terrain_water_2 12
	terrain_plain 1
	terrain_hole
	terrain_plain_end

	db PAR_4
	dw $600 ; hole X pos
	db 19 ; 1st water patch spawn block
	db 33 ; 2nd water patch spawn block


GolfLevel07:
	; terrain blocks
	terrain_tee_box
	terrain_plain 8
	terrain_bunker 6
	terrain_plain 1
	terrain_water_1 6
	terrain_plain 5
	terrain_water_2 2
	terrain_plain 1
	terrain_hole
	terrain_plain 8
	terrain_ob_end

	db PAR_4
	dw $4a0 ; hole X pos
	db 21 ; 1st water patch spawn block
	db 32 ; 2nd water patch spawn block


GolfLevel08:
	; terrain blocks
	terrain_tee_box_edge
	terrain_plain 3
	terrain_ob 6
	terrain_plain 3
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_3
	dw $280 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel13:
	; terrain blocks
	terrain_tee_box
	terrain_plain 19
	terrain_rough 10
	terrain_plain 1
	terrain_bunker 6
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_bunker_end

	db PAR_3
	dw $5a0 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel02:
	; terrain blocks
	terrain_tee_box
	terrain_plain 1
	terrain_bunker 8
	terrain_plain 5
	terrain_bunker 16
	terrain_plain 5
	terrain_bunker 12
	terrain_plain 3
	terrain_hole
	terrain_plain 2
	terrain_ob_end

	db PAR_4
	dw $740 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel18:
	; terrain blocks
	terrain_tee_box
	terrain_plain 6
	terrain_rough 8
	terrain_plain 4
	terrain_water_1 2
	terrain_plain 2
	terrain_ob 6
	terrain_plain 1
	terrain_bunker 4
	terrain_plain 1
	terrain_water_2 6
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_3
	dw $620 ; hole X pos
	db 24 ; 1st water patch spawn block
	db 40 ; 2nd water patch spawn block


GolfLevel16:
	; terrain blocks
	terrain_tee_box_edge
	terrain_plain 1
	terrain_ob 4
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_water_1 18
	terrain_plain_end

	db PAR_3
	dw $1c0 ; hole X pos
	db 15 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel11:
	; terrain blocks
	terrain_tee_box
	terrain_plain 5
	terrain_rough 6
	terrain_plain 5
	terrain_ob 2
	terrain_plain 5
	terrain_bunker 14
	terrain_plain 5
	terrain_ob 8
	terrain_plain 1
	terrain_hole
	terrain_plain 2
	terrain_ob_end

	db PAR_5
	dw $760 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel03:
	; terrain blocks
	terrain_tee_box
	terrain_plain 14
	terrain_rough 4
	terrain_plain 1
	terrain_water_1 13
	terrain_plain 4
	terrain_bunker 14
	terrain_plain 2
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_5
	dw $780 ; hole X pos
	db 25 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel09:
	; terrain blocks
	terrain_tee_box
	terrain_plain 10
	terrain_water_1 10
	terrain_plain 7
	terrain_rough 8
	terrain_plain 2
	terrain_water_2 6
	terrain_plain 5
	terrain_hole
	terrain_plain 5
	terrain_ob_end

	db PAR_4
	dw $700 ; hole X pos
	db 16 ; 1st water patch spawn block
	db 43 ; 2nd water patch spawn block


GolfLevel04:
	; terrain blocks
	terrain_tee_box
	terrain_plain 41
	terrain_ob 4
	terrain_plain 3
	terrain_hole
	terrain_plain 3
	terrain_ob_end

	db PAR_4
	dw $700 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel12:
	; terrain blocks
	terrain_tee_box
	terrain_plain 13
	terrain_water_1 18
	terrain_plain 10
	terrain_rough 6
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_rough 4
	terrain_plain 1
	terrain_ob_end

	db PAR_4
	dw $700 ; hole X pos
	db 19 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block


GolfLevel17:
	; terrain blocks
	terrain_tee_box
	terrain_plain 13
	terrain_ob 8
	terrain_plain 4
	terrain_water_1 6
	terrain_plain 4
	terrain_water_2 16
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_4
	dw $780 ; hole X pos
	db 31 ; 1st water patch spawn block
	db 41 ; 2nd water patch spawn block


GolfLevel14:
	; terrain blocks
	terrain_tee_box
	terrain_plain 2
	terrain_water_1 8
	terrain_plain 4
	terrain_bunker 6
	terrain_plain 4
	terrain_bunker 6
	terrain_plain 4
	terrain_bunker 6
	terrain_plain 4
	terrain_water_2 7
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_5
	dw $780 ; hole X pos
	db 8 ; 1st water patch spawn block
	db 50 ; 2nd water patch spawn block


GolfLevel15:
	; terrain blocks
	terrain_tee_box
	terrain_plain 6
	terrain_water_1 8
	terrain_plain 4
	terrain_water_2 2
	terrain_plain 2
	terrain_ob 15
	terrain_plain 6
	terrain_ob 2
	terrain_plain 1
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_5
	dw $6c0 ; hole X pos
	db 12 ; 1st water patch spawn block
	db 24 ; 2nd water patch spawn block


GolfLevel19:
	; terrain blocks
	terrain_tee_box
	terrain_plain 5
	terrain_ob 4
	terrain_plain 4
	terrain_ob 4
	terrain_plain 4
	terrain_ob 4
	terrain_plain 4
	terrain_ob 4
	terrain_plain 4
	terrain_ob 4
	terrain_plain 4
	terrain_ob 4
	terrain_plain 4
	terrain_hole
	terrain_plain 1
	terrain_ob_end

	db PAR_5
	dw $7a0 ; hole X pos
	db 0 ; 1st water patch spawn block
	db 0 ; 2nd water patch spawn block
