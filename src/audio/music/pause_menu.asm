Music_PauseMenu_Ch1: ; 38b68 (0e:4b68)
	semitone_offset 1

.loop
	tempo 70
	wave WAVE_55
	volume 66
	note NOTE_DURATION_5, C_2, 17
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note F_2
	audio_wait_6
	note G_2
	audio_wait_72
	note G_3
	audio_wait_6
	note F_3
	audio_wait_6
	note E_3
	audio_wait_6
	note D_3
	audio_wait_6
	note C_3
	audio_wait_72
	note G_1
	audio_wait_6
	note A_1
	audio_wait_6
	note B_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_72
	note D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note A_3
	audio_wait_6
	note G_3
	audio_wait_72
	audio_jump .loop
.end
	audio_end
; 0x38b9e

Music_PauseMenu_Ch2: ; 38b9e (0e:4b9e)
	semitone_offset 1

.loop
	wave WAVE_48
	volume 56
	audio_wait_18
	note NOTE_DURATION_6, C_2, 12
	audio_wait_6
	note D_2
	audio_wait_6
	note E_2
	audio_wait_6
	note F_2
	audio_wait_6
	note G_2
	audio_wait_54
	audio_wait_18
	note G_3
	audio_wait_6
	note F_3
	audio_wait_6
	note E_3
	audio_wait_6
	note D_3
	audio_wait_6
	note C_3
	audio_wait_54
	audio_wait_18
	note G_1
	audio_wait_6
	note A_1
	audio_wait_6
	note B_1
	audio_wait_6
	note C_2
	audio_wait_6
	note D_2
	audio_wait_54
	audio_wait_18
	note D_4
	audio_wait_6
	note C_4
	audio_wait_6
	note B_3
	audio_wait_6
	note A_3
	audio_wait_6
	note G_3
	audio_wait_54
	audio_jump .loop
.end
	audio_end
; 0x38bd6

Music_PauseMenu: ; 38bd6 (0e:4bd6)
	db 2, 2
	dw Music_PauseMenu_Ch1
	dw Music_PauseMenu_Ch2

; unused?
	dw Music_PauseMenu_Ch1.loop
	dw Music_PauseMenu_Ch2.loop

	dw Music_PauseMenu_Ch1.end
	dw Music_PauseMenu_Ch2.end
; 0x38be4
