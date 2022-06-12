Music_OverworldDay_Ch1: ; 38365 (0e:4365)
	semitone_offset 0

.loop
	tempo 65
	wave WAVE_55
	volume 85
	note NOTE_DURATION_3, C_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_24
	note G_2
	audio_wait_24
	note A_2
	audio_wait_12
	audio_wait_96
.sub1
	note NOTE_DURATION_3, D_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_24
	note A_2
	audio_wait_24
	note B_2
	audio_wait_12
	audio_ret

	audio_wait_96
.sub2
	note NOTE_DURATION_3, E_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_3
	audio_wait_24
	note B_2
	audio_wait_24
	note C_3
	audio_wait_12
	audio_ret

	audio_wait_96
	note F_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_3
	audio_wait_24
	note F_3
	audio_wait_24
	note D_3
	audio_wait_12
	audio_wait_60
	note NOTE_DURATION_6, G_1
	audio_wait_6
	note G#1
	audio_wait_6
	note A_1
	audio_wait_6
	note G#1
	audio_wait_6
	note NOTE_DURATION_3, G_1
	audio_wait_12
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_24
	note G_2
	audio_wait_24
	note A_2
	audio_wait_12
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	audio_call .sub2
	audio_wait_96
	note NOTE_DURATION_3, F_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, E_3
	audio_wait_12
	note D_3
	audio_wait_24
	note B_2
	audio_wait_24
	note C_3
	audio_wait_12
	audio_wait_96
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#2
	audio_wait_24
	note G#2
	audio_wait_24
	note C_3
	audio_wait_12
	audio_wait_96
	note E_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_3
	audio_wait_24
	note E_3
	audio_wait_24
	note D_3
	audio_wait_12
	audio_wait_96
	note D#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, E_3
	audio_wait_12
	audio_wait_96
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_3
	audio_wait_24
	note E_3
	audio_wait_24
	note D_3
	audio_wait_12
	audio_wait_96
	note C_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_3
	audio_wait_24
	note G_3
	audio_wait_24
	note A_3
	audio_wait_12
	audio_wait_96
	note D_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, C_4
	audio_wait_24
	note A_3
	audio_wait_24
	note B_3
	audio_wait_12
	audio_wait_96
	note E_4
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, D_4
	audio_wait_24
	note B_3
	audio_wait_24
	note C_4
	audio_wait_12
	audio_wait_96
	note F_4
	audio_wait_12
	note E_4
	audio_wait_12
	note D_4
	audio_wait_12
	note C_4
	audio_wait_24
	note B_3
	audio_wait_24
	note C_4
	audio_wait_12
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_72
	audio_jump .loop
.end
	wave WAVE_55
	volume 85
	note NOTE_DURATION_3, C_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, B_2
	audio_wait_24
	note G_2
	audio_wait_24
	note A_2
	audio_wait_3
	audio_end
; 0x38469

Music_OverworldDay_Ch2: ; 38469 (0e:4469)
	semitone_offset 0

.loop
	wave WAVE_4B
	volume 85
	note NOTE_DURATION_3, E_2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_2
	audio_wait_12
	audio_wait_96
.sub1
	note NOTE_DURATION_3, F#2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G_2
	audio_wait_12
	audio_ret

	audio_wait_96
.sub2
	note NOTE_DURATION_3, G#2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, A_2
	audio_wait_12
	audio_ret

	audio_wait_96
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_24
	note A_2
	audio_wait_24
	note F_2
	audio_wait_12
	audio_wait_96
	note E_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_2
	audio_wait_12
	audio_wait_96
	audio_call .sub1
	audio_wait_96
	audio_call .sub2
	audio_wait_96
	note NOTE_DURATION_3, A_2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_12
	note F_2
	audio_wait_24
	note D_2
	audio_wait_24
	note E_2
	audio_wait_12
	audio_wait_96
	note G#2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_2
	audio_wait_24
	note F_2
	audio_wait_24
	note E_2
	audio_wait_12
	audio_wait_96
.sub3
	note NOTE_DURATION_3, F#2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_2
	audio_wait_12
	audio_ret

	audio_wait_96
	note C_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#2
	audio_wait_24
	note G#2
	audio_wait_24
	note C_3
	audio_wait_12
	audio_wait_96
	audio_call .sub3
	audio_wait_96
	note NOTE_DURATION_3, E_3, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_3
	audio_wait_12
	audio_wait_96
	note F#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_3
	audio_wait_12
	audio_wait_96
	note G#3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, A_3
	audio_wait_12
	audio_wait_96
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G_3
	audio_wait_12
	note F_3
	audio_wait_12
	note E_3
	audio_wait_24
	note D_3
	audio_wait_24
	note D#3
	audio_wait_12
	audio_wait_12
	note F_3
	audio_wait_12
	note E_3
	audio_wait_72
	audio_jump .loop
.end
	wave WAVE_4B
	volume 85
	note NOTE_DURATION_3, E_2, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_2
	audio_wait_3
	audio_end
; 0x3855b

Music_OverworldDay_Ch3: ; 3855b (0e:455b)
	semitone_offset 0

.loop
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
.sub1
	note NOTE_DURATION_3, F_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub2
	note NOTE_DURATION_3, D_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub3
	note NOTE_DURATION_3, G_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub4
	note NOTE_DURATION_3, E_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

.sub5
	note NOTE_DURATION_3, A_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub2
	note NOTE_DURATION_3, G_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_6, G_0
	audio_wait_6
	note G#0
	audio_wait_6
	note A_0
	audio_wait_6
	note G#0
	audio_wait_6
	note NOTE_DURATION_3, G_0
	audio_wait_12
	note C_1
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F_1
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, C_1
	audio_wait_12
	note F_1
	audio_wait_12
	note E_1
	audio_wait_12
	audio_call .sub2
.sub6
	note NOTE_DURATION_3, G_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, D_1
	audio_wait_12
	note G_1
	audio_wait_12
	note F_1
	audio_wait_12
	audio_ret

	audio_call .sub4
	audio_call .sub5
	note NOTE_DURATION_3, D_1, 22
	audio_wait_36
	note G_1
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, C_2
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_12
.sub7
	note NOTE_DURATION_3, G#1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub3
.sub8
	note NOTE_DURATION_3, F#1, 22
	audio_wait_36
	note D_1
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_ret

	audio_call .sub3
	audio_call .sub7
	audio_call .sub3
	audio_call .sub8
	note NOTE_DURATION_3, G_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A_1
	audio_wait_12
	note B_1
	audio_wait_12
	note C_2
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	audio_call .sub1
	audio_call .sub2
	audio_call .sub6
	audio_call .sub4
	note NOTE_DURATION_3, A_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, D_1
	audio_wait_36
	note G_1
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, G#1
	audio_wait_12
	audio_wait_12
	note A#1
	audio_wait_12
	note C_2
	audio_wait_72
	audio_jump .loop
.end
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C_1, 22
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_36
	note NOTE_DURATION_3
	audio_wait_3
	audio_end
; 0x38651

Music_OverworldDay_Ch4: ; 38651 (0e:4651)
	semitone_offset 0

.loop
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, F#0, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
.sub1
	note NOTE_DURATION_3, F#0, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	wave WAVE_28
	volume 85
	note NOTE_DURATION_3, F#0, 22
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, G#0
	audio_wait_12
	note F#0
	audio_wait_3
	audio_end
; 0x386f6

Music_OverworldDay: ; 386f6 (0e:46f6)
	db 4, 2
	dw Music_OverworldDay_Ch1
	dw Music_OverworldDay_Ch2
	dw Music_OverworldDay_Ch3
	dw Music_OverworldDay_Ch4

; unused?
	dw Music_OverworldDay_Ch1.loop
	dw Music_OverworldDay_Ch2.loop
	dw Music_OverworldDay_Ch3.loop
	dw Music_OverworldDay_Ch4.loop

	dw Music_OverworldDay_Ch1.end
	dw Music_OverworldDay_Ch2.end
	dw Music_OverworldDay_Ch3.end
	dw Music_OverworldDay_Ch4.end
; 0x38710
