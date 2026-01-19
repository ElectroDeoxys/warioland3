Music_ThePeacefulVillageDay_Ch1:
	semitone_offset 0

.loop
	tempo 60
	wave WAVE_17
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 85
	audio_wait 96
	audio_wait 96
.sub1
	note NOTE_DURATION_3, C_3, 19
	audio_wait 12
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_6, E_3
	audio_wait 6
	note NOTE_DURATION_3, G_3
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_12, A#3
	audio_wait 12
	note NOTE_DURATION_3, F_3
	audio_wait 12
	note D_3
	audio_wait 12
	note A#2
	audio_wait 12
	audio_ret

.sub2
	note NOTE_DURATION_12, C_3, 19
	audio_wait 12
	note NOTE_DURATION_3, G_2
	audio_wait 84
	audio_ret

.sub3
	note NOTE_DURATION_3, C_3, 19
	audio_wait 12
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_6, E_3
	audio_wait 6
	note NOTE_DURATION_3, G_3
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_12, D_4
	audio_wait 12
	note NOTE_DURATION_3, A#3
	audio_wait 12
	note F_3
	audio_wait 12
	note D_4
	audio_wait 12
	audio_ret

	note C_4
	audio_wait 96
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	note NOTE_DURATION_3, C_4, 19
	audio_wait 96
	wave WAVE_1A
	note NOTE_DURATION_12, C_4, 19
	audio_wait 18
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_3, A#3
	audio_wait 12
	note G#3
	audio_wait 12
	note C_4
	audio_wait 48
	note NOTE_DURATION_12
	audio_wait 18
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_3, B_3
	audio_wait 12
	note A_3
	audio_wait 12
	note C_4
	audio_wait 48
	note NOTE_DURATION_12
	audio_wait 18
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_3, B_3
	audio_wait 12
	note A_3
	audio_wait 12
	note C_4
	audio_wait 12
	note D_4
	audio_wait 12
	note E_4
	audio_wait 12
	note C_4
	audio_wait 12
	note D_4
	audio_wait 96
	wave WAVE_17
	note NOTE_DURATION_3, C_3, 19
	audio_wait 12
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_6, E_3
	audio_wait 6
	note NOTE_DURATION_3, G_3
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_12, A#3
	audio_wait 12
	note NOTE_DURATION_3, F_3
	audio_wait 12
	note D_3
	audio_wait 12
	note A#2
	audio_wait 12
	note NOTE_DURATION_3, C_3, 19
	audio_wait 12
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_6, E_3
	audio_wait 6
	note NOTE_DURATION_3, G_3
	audio_wait 12
	note C_4
	audio_wait 12
	note NOTE_DURATION_12, D_4
	audio_wait 12
	note NOTE_DURATION_3, A#3
	audio_wait 12
	note F_3
	audio_wait 12
	note D_3
	audio_wait 12
	note D#3
	audio_wait 12
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_6, G#3
	audio_wait 6
	note NOTE_DURATION_3, C_4
	audio_wait 12
	note D#4
	audio_wait 12
	note NOTE_DURATION_12, F_4
	audio_wait 12
	note NOTE_DURATION_3, D_4
	audio_wait 12
	note A#3
	audio_wait 12
	note G_3
	audio_wait 12
	note C_4
	audio_wait 96
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageDay_Ch2:
	semitone_offset 0

.loop
	wave WAVE_47
	volume 85
	audio_wait 24
	note NOTE_DURATION_3, C_2, 19
	audio_wait 36
	note A#1
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
.sub1
	audio_wait 24
	note NOTE_DURATION_3, C_2, 19
	audio_wait 36
	note A#1
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_wait 24
	note NOTE_DURATION_3, C_2, 19
	audio_wait 36
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_6, G#1
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note G#1
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note G#1
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note G#1
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note G_1
	audio_wait 6
	note C_2
	audio_wait 6
	note E_2
	audio_wait 6
	note C_2
	audio_wait 6
	note G_1
	audio_wait 6
	note C_2
	audio_wait 6
	note E_2
	audio_wait 6
	note C_2
	audio_wait 6
	note G_1
	audio_wait 6
	note C_2
	audio_wait 6
	note E_2
	audio_wait 6
	note C_2
	audio_wait 6
	note G_1
	audio_wait 6
	note C_2
	audio_wait 6
	note E_2
	audio_wait 6
	note C_2
	audio_wait 6
	note A_1
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note A_1
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note A_1
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note A_1
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note B_1
	audio_wait 6
	note D_2
	audio_wait 6
	note G_2
	audio_wait 6
	note D_2
	audio_wait 6
	note A_1
	audio_wait 6
	note C_2
	audio_wait 6
	note F_2
	audio_wait 6
	note C_2
	audio_wait 6
	note G_1
	audio_wait 6
	note B_1
	audio_wait 6
	note E_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_1
	audio_wait 6
	note A_1
	audio_wait 6
	note D_2
	audio_wait 6
	note A_1
	audio_wait 6
	audio_call .sub1
	audio_call .sub1
	audio_wait 24
	note NOTE_DURATION_3, C_2, 19
	audio_wait 36
	note D_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageDay_Ch3:
	semitone_offset 0

.loop
	wave WAVE_5E
	volume 108
	note NOTE_DURATION_3, C_1, 19
	audio_wait 24
	note E_2
	audio_wait 12
	note C_1
	audio_wait 12
	note G_0
	audio_wait 12
	note D_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_6, A#0
	audio_wait 6
	note B_0
	audio_wait 6
.sub1
	note NOTE_DURATION_3, C_1, 19
	audio_wait 24
	note E_2
	audio_wait 12
	note C_1
	audio_wait 12
	note G_0
	audio_wait 12
	note D_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_6, A#0
	audio_wait 6
	note B_0
	audio_wait 6
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, C_1, 19
	audio_wait 24
	note E_2
	audio_wait 12
	note G_0
	audio_wait 12
	note C_1
	audio_wait 12
	note E_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_6, C_1
	audio_wait 6
	note A#0
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 36
	note D#0
	audio_wait 12
	note G#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, C_1
	audio_wait 36
	note G_0
	audio_wait 12
	note C_1
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_3, G_0
	audio_wait 12
	note D_0
	audio_wait 36
	note A_0
	audio_wait 12
	note D_0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 24
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G_0
	audio_wait 96
	audio_call .sub1
	note NOTE_DURATION_3, C_1, 19
	audio_wait 24
	note E_2
	audio_wait 12
	note C_1
	audio_wait 12
	note G_0
	audio_wait 12
	note D_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_6, F_0
	audio_wait 6
	note G_0
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 24
	note D#2
	audio_wait 12
	note G#0
	audio_wait 12
	note G_0
	audio_wait 12
	note F_2
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G_0
	audio_wait 12
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageDay_Ch4:
	semitone_offset 0

.loop
	wave WAVE_28
	volume 75
	note NOTE_DURATION_3, F#0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
.sub1
	note NOTE_DURATION_3, F#0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_3, F#0, 19
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3, G#0
	audio_wait 12
	note F#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
.sub2
	note NOTE_DURATION_3, F#0, 19
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	audio_ret

	audio_call .sub2
	audio_call .sub2
	note NOTE_DURATION_3, F#0, 19
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3, G#0
	audio_wait 6
	note F#0
	audio_wait 6
	note G#0
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 6
	note NOTE_DURATION_3
	audio_wait 6
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageDay:
	db $4, $2
	dw Music_ThePeacefulVillageDay_Ch1
	dw Music_ThePeacefulVillageDay_Ch2
	dw Music_ThePeacefulVillageDay_Ch3
	dw Music_ThePeacefulVillageDay_Ch4

; unused?
	dw Music_ThePeacefulVillageDay_Ch1.loop
	dw Music_ThePeacefulVillageDay_Ch2.loop
	dw Music_ThePeacefulVillageDay_Ch3.loop
	dw Music_ThePeacefulVillageDay_Ch4.loop

	dw Music_ThePeacefulVillageDay_Ch1.end
	dw Music_ThePeacefulVillageDay_Ch2.end
	dw Music_ThePeacefulVillageDay_Ch3.end
	dw Music_ThePeacefulVillageDay_Ch4.end
