Music_PauseMenu_Ch1:
	semitone_offset 1

.loop
	tempo 70
	wave WAVE_55
	volume 66
	note NOTE_DURATION_5, C_2, 17
	audio_wait 6
	note D_2
	audio_wait 6
	note E_2
	audio_wait 6
	note F_2
	audio_wait 6
	note G_2
	audio_wait 72
	note G_3
	audio_wait 6
	note F_3
	audio_wait 6
	note E_3
	audio_wait 6
	note D_3
	audio_wait 6
	note C_3
	audio_wait 72
	note G_1
	audio_wait 6
	note A_1
	audio_wait 6
	note B_1
	audio_wait 6
	note C_2
	audio_wait 6
	note D_2
	audio_wait 72
	note D_4
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note A_3
	audio_wait 6
	note G_3
	audio_wait 72
	audio_jump .loop
.end
	audio_end

Music_PauseMenu_Ch2:
	semitone_offset 1

.loop
	wave WAVE_48
	volume 56
	audio_wait 18
	note NOTE_DURATION_6, C_2, 12
	audio_wait 6
	note D_2
	audio_wait 6
	note E_2
	audio_wait 6
	note F_2
	audio_wait 6
	note G_2
	audio_wait 54
	audio_wait 18
	note G_3
	audio_wait 6
	note F_3
	audio_wait 6
	note E_3
	audio_wait 6
	note D_3
	audio_wait 6
	note C_3
	audio_wait 54
	audio_wait 18
	note G_1
	audio_wait 6
	note A_1
	audio_wait 6
	note B_1
	audio_wait 6
	note C_2
	audio_wait 6
	note D_2
	audio_wait 54
	audio_wait 18
	note D_4
	audio_wait 6
	note C_4
	audio_wait 6
	note B_3
	audio_wait 6
	note A_3
	audio_wait 6
	note G_3
	audio_wait 54
	audio_jump .loop
.end
	audio_end

Music_PauseMenu:
	db 2, 2
	dw Music_PauseMenu_Ch1
	dw Music_PauseMenu_Ch2

; unused?
	dw Music_PauseMenu_Ch1.loop
	dw Music_PauseMenu_Ch2.loop

	dw Music_PauseMenu_Ch1.end
	dw Music_PauseMenu_Ch2.end
