Music_ThePeacefulVillageNight_Ch1: ; 33b48 (0c:7b48)
	semitone_offset 0
	tempo 35
	wave WAVE_62
	vibrato_speed 50
	vibrato_delay 5
	vibrato_amplitude 30
	vibrato_disabled FALSE
	volume 85
	audio_wait_96

.loop
.sub1
	note NOTE_DURATION_24, C_2, 21
	audio_wait_24
	note B_1
	audio_wait_24
	note G_1
	audio_wait_24
	note B_1
	audio_wait_24
	audio_ret

	note C_2
	audio_wait_96
.sub2
	note NOTE_DURATION_24, C_2, 21
	audio_wait_24
	note D_2
	audio_wait_24
	note D#2
	audio_wait_24
	note G_2
	audio_wait_24
	audio_ret

	note NOTE_DURATION_48, F#2
	audio_wait_48
	note NOTE_DURATION_24, G_2
	audio_wait_48
	audio_call .sub1
	note NOTE_DURATION_24, C_2, 21
	audio_wait_96
	audio_call .sub2
	note NOTE_DURATION_24, F#2, 21
	audio_wait_24
	note NOTE_DURATION_12, F_2
	audio_wait_12
	note D#2
	audio_wait_12
	note NOTE_DURATION_24, C_2
	audio_wait_48
	note G_0
	audio_wait_24
	note B_0
	audio_wait_24
	note D_1
	audio_wait_24
	note G_1
	audio_wait_24
	note G#1
	audio_wait_24
	note F#1
	audio_wait_24
	note G_1
	audio_wait_48
	note G#1
	audio_wait_24
	note C_2
	audio_wait_24
	note B_1
	audio_wait_48
	note C_2
	audio_wait_24
	note D#2
	audio_wait_24
	note D_2
	audio_wait_48
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_24, F#2, 21
	audio_wait_24
	note D_2
	audio_wait_24
	note G_2
	audio_wait_24
	note B_1
	audio_wait_24
	note NOTE_DURATION_72, C_2
	audio_wait_96
	audio_jump .loop
.end
	audio_end
; 0x33bbe

Music_ThePeacefulVillageNight_Ch2: ; 33bbe (0c:7bbe)
	semitone_offset 0
	wave WAVE_53
	volume 75
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8

.loop
.sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	audio_ret

.sub2
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note F#3
	audio_wait_8
	note A_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note D_3
	audio_wait_8
	note F_3
	audio_wait_8
	note G_3
	audio_wait_8
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note G#3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note C_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
.sub3
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note G#3
	audio_wait_8
	note F#3
	audio_wait_8
	note C_4
	audio_wait_8
	note G#3
	audio_wait_8
	note F#3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note F#3
	audio_wait_8
	note A_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note D_3
	audio_wait_8
	note G#3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note C_3
	audio_wait_24
	audio_jump .loop
.end
	audio_end
; 0x33cc5

Music_ThePeacefulVillageNight_Ch3: ; 33cc5 (0c:7cc5)
	semitone_offset 0
	wave WAVE_49
	volume 66
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_2

.loop
.sub1
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_2
	audio_ret

.sub2
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_8
	note B_3
	audio_wait_2
	audio_ret

	audio_call .sub1
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note F#3
	audio_wait_8
	note A_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note D_3
	audio_wait_8
	note F_3
	audio_wait_8
	note G_3
	audio_wait_2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note G#3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note C_3
	audio_wait_8
	note D#3
	audio_wait_8
	note G_3
	audio_wait_2
	audio_wait_6
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_2
.sub3
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note G#3
	audio_wait_8
	note F#3
	audio_wait_8
	note C_4
	audio_wait_8
	note G#3
	audio_wait_8
	note F#3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_2
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub1
	audio_call .sub1
	audio_wait_6
	note NOTE_DURATION_2, C_4, 17
	audio_wait_8
	note A_3
	audio_wait_8
	note F#3
	audio_wait_8
	note D#3
	audio_wait_8
	note F#3
	audio_wait_8
	note A_3
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note F_3
	audio_wait_8
	note D_3
	audio_wait_8
	note G#3
	audio_wait_8
	note G_3
	audio_wait_2
	audio_wait_6
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note B_3
	audio_wait_8
	note G_3
	audio_wait_8
	note C_4
	audio_wait_8
	note G_3
	audio_wait_8
	note D#3
	audio_wait_8
	note C_3
	audio_wait_18
	audio_jump .loop
.end
	audio_end
; 0x33dd5

Music_ThePeacefulVillageNight: ; 33dd5 (c:7dd5)
	db $3, $2
	dw Music_ThePeacefulVillageNight_Ch1
	dw Music_ThePeacefulVillageNight_Ch2
	dw Music_ThePeacefulVillageNight_Ch3

; unused?
	dw Music_ThePeacefulVillageNight_Ch1.loop
	dw Music_ThePeacefulVillageNight_Ch2.loop
	dw Music_ThePeacefulVillageNight_Ch3.loop

	dw Music_ThePeacefulVillageNight_Ch1.end
	dw Music_ThePeacefulVillageNight_Ch2.end
	dw Music_ThePeacefulVillageNight_Ch3.end
