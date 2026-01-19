Music_LevelClearNoTreasure_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_52
	volume 94
	note NOTE_DURATION_1, C_3, 23
	audio_wait 24
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 24
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note NOTE_DURATION_1, C_3
	audio_wait 6
	note D_3
	audio_wait 6
	note E_3
	audio_wait 4
	note F_3
	audio_wait 8
	note NOTE_DURATION_1, G_3
	audio_wait 24
	note NOTE_DURATION_1, C_4
	audio_wait 6
	note D_4
	audio_wait 6
	note E_4
	audio_wait 6
	note F_4
	audio_wait 6
	note NOTE_DURATION_1, G_4
	audio_wait 24
	note F_4
	audio_wait 12
	note A_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 12
	note D_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 12
	note D_4
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_1, D_4
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note A_3
	audio_wait 6
	note NOTE_DURATION_1, G_3
	audio_wait 12
	audio_jump .loop
.end
	audio_end

Music_LevelClearNoTreasure_Ch2:
	semitone_offset 0

.loop
	wave WAVE_47
	volume 94
	note NOTE_DURATION_3, C_2, 23
	audio_wait 12
	note G_2
	audio_wait 12
	note E_2
	audio_wait 12
	note G_2
	audio_wait 12
	note D_2
	audio_wait 12
	note A_2
	audio_wait 12
	note F_2
	audio_wait 12
	note A_2
	audio_wait 12
	note E_2
	audio_wait 12
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note B_2
	audio_wait 12
	note F_2
	audio_wait 12
	note C_3
	audio_wait 12
	note A_2
	audio_wait 12
	note C_3
	audio_wait 12
	note G_2
	audio_wait 12
	note D_3
	audio_wait 12
	note B_2
	audio_wait 12
	note D_3
	audio_wait 12
	note F_2
	audio_wait 12
	note C_3
	audio_wait 12
	note A_2
	audio_wait 12
	note C_3
	audio_wait 12
	note E_2
	audio_wait 12
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note B_2
	audio_wait 12
	note D_2
	audio_wait 12
	note A_2
	audio_wait 12
	note F_2
	audio_wait 12
	note A_2
	audio_wait 12
	audio_jump .loop
.end
	audio_end

Music_LevelClearNoTreasure_Ch3:
	semitone_offset 0

.loop
	wave WAVE_61
	volume 94
	audio_wait 9
	note NOTE_DURATION_3, C_3, 21
	audio_wait 24
	note B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 24
	note B_2
	audio_wait 12
	note G_2
	audio_wait 3
	audio_wait 9
	note NOTE_DURATION_6, C_3
	audio_wait 6
	note D_3
	audio_wait 6
	note E_3
	audio_wait 4
	note F_3
	audio_wait 8
	note NOTE_DURATION_3, G_3
	audio_wait 24
	note NOTE_DURATION_6, C_4
	audio_wait 6
	note D_4
	audio_wait 6
	note E_4
	audio_wait 6
	note F_4
	audio_wait 6
	note NOTE_DURATION_3, G_4
	audio_wait 15
	audio_wait 9
	note F_4
	audio_wait 12
	note A_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 12
	note G_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 3
	audio_wait 9
	note D_4
	audio_wait 12
	note F_4
	audio_wait 12
	note E_4
	audio_wait 12
	note D_4
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_6, D_4
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note A_3
	audio_wait 6
	note NOTE_DURATION_3, G_3
	audio_wait 3
	audio_jump .loop
.end
	audio_end

Music_LevelClearNoTreasure:
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
