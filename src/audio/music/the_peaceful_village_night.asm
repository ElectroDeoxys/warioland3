Music_ThePeacefulVillageNight_Ch1:
	semitone_offset 0
	tempo 35
	wave WAVE_62
	vibrato_speed 50
	vibrato_delay 5
	vibrato_amplitude 30
	vibrato_disabled FALSE
	volume 85
	audio_wait 96

.loop
.sub1
	note NOTE_DURATION_24, C_2, 21
	audio_wait 24
	note B_1
	audio_wait 24
	note G_1
	audio_wait 24
	note B_1
	audio_wait 24
	audio_ret

	note C_2
	audio_wait 96
.sub2
	note NOTE_DURATION_24, C_2, 21
	audio_wait 24
	note D_2
	audio_wait 24
	note D#2
	audio_wait 24
	note G_2
	audio_wait 24
	audio_ret

	note NOTE_DURATION_48, F#2
	audio_wait 48
	note NOTE_DURATION_24, G_2
	audio_wait 48
	audio_call .sub1
	note NOTE_DURATION_24, C_2, 21
	audio_wait 96
	audio_call .sub2
	note NOTE_DURATION_24, F#2, 21
	audio_wait 24
	note NOTE_DURATION_12, F_2
	audio_wait 12
	note D#2
	audio_wait 12
	note NOTE_DURATION_24, C_2
	audio_wait 48
	note G_0
	audio_wait 24
	note B_0
	audio_wait 24
	note D_1
	audio_wait 24
	note G_1
	audio_wait 24
	note G#1
	audio_wait 24
	note F#1
	audio_wait 24
	note G_1
	audio_wait 48
	note G#1
	audio_wait 24
	note C_2
	audio_wait 24
	note B_1
	audio_wait 48
	note C_2
	audio_wait 24
	note D#2
	audio_wait 24
	note D_2
	audio_wait 48
	audio_call .sub1
	audio_call .sub2
	note NOTE_DURATION_24, F#2, 21
	audio_wait 24
	note D_2
	audio_wait 24
	note G_2
	audio_wait 24
	note B_1
	audio_wait 24
	note NOTE_DURATION_72, C_2
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageNight_Ch2:
	semitone_offset 0
	wave WAVE_53
	volume 75
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8

.loop
.sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	audio_ret

.sub2
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	audio_ret

	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note F#3
	audio_wait 8
	note A_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note D_3
	audio_wait 8
	note F_3
	audio_wait 8
	note G_3
	audio_wait 8
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note G#3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note C_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
.sub3
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note G#3
	audio_wait 8
	note F#3
	audio_wait 8
	note C_4
	audio_wait 8
	note G#3
	audio_wait 8
	note F#3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub1
	audio_call .sub1
	note NOTE_DURATION_2, C_4, 19
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note F#3
	audio_wait 8
	note A_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note D_3
	audio_wait 8
	note G#3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note C_3
	audio_wait 24
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageNight_Ch3:
	semitone_offset 0
	wave WAVE_49
	volume 66
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 2

.loop
.sub1
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 2
	audio_ret

.sub2
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 8
	note B_3
	audio_wait 2
	audio_ret

	audio_call .sub1
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note F#3
	audio_wait 8
	note A_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note D_3
	audio_wait 8
	note F_3
	audio_wait 8
	note G_3
	audio_wait 2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note G#3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note C_3
	audio_wait 8
	note D#3
	audio_wait 8
	note G_3
	audio_wait 2
	audio_wait 6
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 2
.sub3
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note G#3
	audio_wait 8
	note F#3
	audio_wait 8
	note C_4
	audio_wait 8
	note G#3
	audio_wait 8
	note F#3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 2
	audio_ret

	audio_call .sub3
	audio_call .sub3
	audio_call .sub1
	audio_call .sub1
	audio_wait 6
	note NOTE_DURATION_2, C_4, 17
	audio_wait 8
	note A_3
	audio_wait 8
	note F#3
	audio_wait 8
	note D#3
	audio_wait 8
	note F#3
	audio_wait 8
	note A_3
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note F_3
	audio_wait 8
	note D_3
	audio_wait 8
	note G#3
	audio_wait 8
	note G_3
	audio_wait 2
	audio_wait 6
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note B_3
	audio_wait 8
	note G_3
	audio_wait 8
	note C_4
	audio_wait 8
	note G_3
	audio_wait 8
	note D#3
	audio_wait 8
	note C_3
	audio_wait 18
	audio_jump .loop
.end
	audio_end

Music_ThePeacefulVillageNight:
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
