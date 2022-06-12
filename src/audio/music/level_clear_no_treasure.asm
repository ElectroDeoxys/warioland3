Music_LevelClearNoTreasure_Ch1: ; 38965 (0e:4965)
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 94
	note NOTE_DURATION_1, C_3, 23
	audio_wait_24
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_24
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note NOTE_DURATION_1, C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_4
	note F_3
	audio_wait_8
	note NOTE_DURATION_1, G_3
	audio_wait_24
	note NOTE_DURATION_1, C_4
	audio_wait_6
	note D_4
	audio_wait_6
	note E_4
	audio_wait_6
	note F_4
	audio_wait_6
	note NOTE_DURATION_1, G_4
	audio_wait_24
	note F_4
	audio_wait_12
	note A_4
	audio_wait_12
	note G_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note G_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_1, D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note A_3
	audio_wait_6
	note NOTE_DURATION_1, G_3
	audio_wait_12
	audio_jump .loop
.end
	audio_end
; 0x389bd

Music_LevelClearNoTreasure_Ch2: ; 389bd (0e:49bd)
	semitone_offset 0

.loop
	wave WAVE_47
	volume 94
	note NOTE_DURATION_3, C_2, 23
	audio_wait_12
	note G_2
	audio_wait_12
	note E_2
	audio_wait_12
	note G_2
	audio_wait_12
	note D_2
	audio_wait_12
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	note E_2
	audio_wait_12
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note B_2
	audio_wait_12
	note F_2
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note G_2
	audio_wait_12
	note D_3
	audio_wait_12
	note B_2
	audio_wait_12
	note D_3
	audio_wait_12
	note F_2
	audio_wait_12
	note C_3
	audio_wait_12
	note A_2
	audio_wait_12
	note C_3
	audio_wait_12
	note E_2
	audio_wait_12
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note B_2
	audio_wait_12
	note D_2
	audio_wait_12
	note A_2
	audio_wait_12
	note F_2
	audio_wait_12
	note A_2
	audio_wait_12
	audio_jump .loop
.end
	audio_end
; 0x38a09

Music_LevelClearNoTreasure_Ch3: ; 38a09 (0e:4a09)
	semitone_offset 0

.loop
	wave WAVE_61
	volume 94
	audio_wait_9
	note NOTE_DURATION_3, C_3, 21
	audio_wait_24
	note B_2
	audio_wait_12
	note G_2
	audio_wait_12
	note C_3
	audio_wait_24
	note B_2
	audio_wait_12
	note G_2
	audio_wait_3
	audio_wait_9
	note NOTE_DURATION_6, C_3
	audio_wait_6
	note D_3
	audio_wait_6
	note E_3
	audio_wait_4
	note F_3
	audio_wait_8
	note NOTE_DURATION_3, G_3
	audio_wait_24
	note NOTE_DURATION_6, C_4
	audio_wait_6
	note D_4
	audio_wait_6
	note E_4
	audio_wait_6
	note F_4
	audio_wait_6
	note NOTE_DURATION_3, G_4
	audio_wait_15
	audio_wait_9
	note F_4
	audio_wait_12
	note A_4
	audio_wait_12
	note G_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note G_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_3
	audio_wait_9
	note D_4
	audio_wait_12
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_12
	note NOTE_DURATION_6, D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note A_3
	audio_wait_6
	note NOTE_DURATION_3, G_3
	audio_wait_3
	audio_jump .loop
.end
	audio_end
; 0x38a63

Music_LevelClearNoTreasure: ; 38a63 (0e:4a63)
	db 3, 2
	dw Music_LevelClearNoTreasure_Ch1
	dw Music_LevelClearNoTreasure_Ch2
	dw Music_LevelClearNoTreasure_Ch3

; unused?
	dw Music_LevelClearNoTreasure_Ch1.loop
	dw Music_LevelClearNoTreasure_Ch2.loop
	dw Music_LevelClearNoTreasure_Ch3.loop

	dw Music_LevelClearNoTreasure_Ch1.end
	dw Music_LevelClearNoTreasure_Ch2.end
	dw Music_LevelClearNoTreasure_Ch3.end
; 0x38a77
