Music_DesertRuins_Ch1:
	semitone_offset 0
	tempo 45
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 85
	audio_wait 96
	audio_wait 96

.loop
	wave WAVE_14
	audio_wait 96
	audio_wait 96
	note NOTE_DURATION_12, C_3, 22
	audio_wait 18
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_3, B_2
	audio_wait 12
	note G_2
	audio_wait 12
	note C_3
	audio_wait 48
	audio_wait 96
	note NOTE_DURATION_18
	audio_wait 18
	note NOTE_DURATION_6, D_3
	audio_wait 6
	note NOTE_DURATION_3, D#3
	audio_wait 12
	note G_3
	audio_wait 12
	note F#3
	audio_wait 48
	audio_wait 96
	note NOTE_DURATION_12, C_4
	audio_wait 18
	note NOTE_DURATION_6
	audio_wait 6
	note NOTE_DURATION_3, B_3
	audio_wait 12
	note G_3
	audio_wait 12
	note C_4
	audio_wait 48
	audio_wait 96
	note NOTE_DURATION_18
	audio_wait 18
	note NOTE_DURATION_6, D_4
	audio_wait 6
	note NOTE_DURATION_3, D#4
	audio_wait 12
	note G_4
	audio_wait 12
	note F#4
	audio_wait 48
	wave WAVE_17
	audio_wait 84
	note NOTE_DURATION_3, G_2, 22
	audio_wait 12
	note NOTE_DURATION_60, C_3
	audio_wait 60
	note NOTE_DURATION_3, D_3
	audio_wait 12
	note D#3
	audio_wait 12
	note G_3
	audio_wait 12
	note NOTE_DURATION_60, F#3
	audio_wait 60
	note NOTE_DURATION_3, D#3
	audio_wait 12
	note D_3
	audio_wait 12
	note C_3
	audio_wait 12
	note NOTE_DURATION_60, B_2
	audio_wait 60
	note NOTE_DURATION_3, G_2
	audio_wait 12
	note G#2
	audio_wait 12
	note G_2
	audio_wait 12
	note NOTE_DURATION_72, C_3
	audio_wait 84
	note NOTE_DURATION_3, G_3
	audio_wait 12
	note NOTE_DURATION_60, C_4
	audio_wait 60
	note NOTE_DURATION_3, D_4
	audio_wait 12
	note D#4
	audio_wait 12
	note G_4
	audio_wait 12
	note NOTE_DURATION_48, F#4
	audio_wait 60
	note NOTE_DURATION_3, D#4
	audio_wait 12
	note D_4
	audio_wait 12
	note C_4
	audio_wait 12
	note B_3
	audio_wait 12
	note NOTE_DURATION_3
	audio_wait 48
	note NOTE_DURATION_12, G_3
	audio_wait 12
	note NOTE_DURATION_4, G#3
	audio_wait 6
	note A_3
	audio_wait 6
	note A#3
	audio_wait 6
	note B_3
	audio_wait 6
	note NOTE_DURATION_3, C_4
	audio_wait 36
	wave WAVE_1A
	note NOTE_DURATION_3, G_2, 22
	audio_wait 12
	note A#2
	audio_wait 24
	note NOTE_DURATION_24, G_2
	audio_wait 24
	audio_wait 12
	note NOTE_DURATION_3, C_3
	audio_wait 24
	note G_2
	audio_wait 12
	note A#2
	audio_wait 24
	note NOTE_DURATION_24, G_2
	audio_wait 24
	note NOTE_DURATION_3, C_3
	audio_wait 36
	note G_3
	audio_wait 12
	note A#3
	audio_wait 24
	note NOTE_DURATION_24, G_3
	audio_wait 24
	audio_wait 12
	note NOTE_DURATION_3, C_4
	audio_wait 24
	note G_3
	audio_wait 12
	note A#3
	audio_wait 24
	note NOTE_DURATION_24, G_3
	audio_wait 24
	note NOTE_DURATION_3, C_4
	audio_wait 96
	audio_wait 96
	audio_jump .loop
.end
	audio_end

Music_DesertRuins_Ch2:
	semitone_offset 0
	wave WAVE_49
	volume 94
	note NOTE_DURATION_4, C_2, 19
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
.sub1
	note NOTE_DURATION_4, C_2, 19
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	note B_1
	audio_wait 6
	note D#2
	audio_wait 6
	audio_ret

.loop
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_4, C_2, 19
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
.sub3
	note NOTE_DURATION_4, C_2, 19
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	note C_2
	audio_wait 6
	note F#2
	audio_wait 6
	audio_ret

	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	audio_call .sub2
	audio_call .sub2
	audio_call .sub3
	note NOTE_DURATION_4, B_1, 19
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 6
	note F_2
	audio_wait 6
	note B_1
	audio_wait 12
	note G_1
	audio_wait 12
	note G#1
	audio_wait 6
	note A_1
	audio_wait 6
	note A#1
	audio_wait 6
	note B_1
	audio_wait 6
.sub4
	note NOTE_DURATION_4, C_2, 19
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note C_2
	audio_wait 6
	note D#2
	audio_wait 6
	note A#1
	audio_wait 6
	note D#2
	audio_wait 6
	note A#1
	audio_wait 6
	note D#2
	audio_wait 6
	note A#1
	audio_wait 6
	note D#2
	audio_wait 6
	note A#1
	audio_wait 6
	note D#2
	audio_wait 6
	audio_ret

	audio_call .sub4
	audio_call .sub4
	audio_call .sub4
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_DesertRuins_Ch3:
	semitone_offset 0
	wave WAVE_63
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	volume 120
	note NOTE_DURATION_4, C_1, 24
	audio_wait 36
	note G_0
	audio_wait 12
	note G#0
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
.sub1
	audio_wait 12
	note NOTE_DURATION_4, C_1, 24
	audio_wait 24
	note G_0
	audio_wait 12
	note G#0
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	audio_ret

.loop
.sub2
	note NOTE_DURATION_4, C_1, 24
	audio_wait 36
	note G_0
	audio_wait 12
	note G#0
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	audio_call .sub2
	audio_call .sub1
	note NOTE_DURATION_4, C_1, 24
	audio_wait 36
	note G_0
	audio_wait 12
	note C_1
	audio_wait 24
	note NOTE_DURATION_24
	audio_wait 24
	note NOTE_DURATION_4, D_1
	audio_wait 36
	note A_0
	audio_wait 12
	note D_1
	audio_wait 24
	note NOTE_DURATION_24
	audio_wait 24
	note NOTE_DURATION_4, G_0
	audio_wait 36
	note D_0
	audio_wait 12
	note G_0
	audio_wait 24
	note NOTE_DURATION_24
	audio_wait 24
	audio_call .sub2
	note NOTE_DURATION_4, C_1, 24
	audio_wait 36
	note G_0
	audio_wait 12
	note C_1
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	note NOTE_DURATION_4, D_0
	audio_wait 36
	note A_0
	audio_wait 12
	note D_0
	audio_wait 24
	note NOTE_DURATION_24
	audio_wait 24
	note NOTE_DURATION_4, G_0
	audio_wait 36
	note D_0
	audio_wait 12
	note G_0
	audio_wait 12
	note NOTE_DURATION_4
	audio_wait 12
	note NOTE_DURATION_4, G#0
	audio_wait 6
	note A_0
	audio_wait 6
	note A#0
	audio_wait 6
	note B_0
	audio_wait 6
.sub3
	note NOTE_DURATION_4, C_1, 24
	audio_wait 36
	note G_0
	audio_wait 12
	note A#0
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	audio_ret

.sub4
	audio_wait 12
	note NOTE_DURATION_4, C_1, 24
	audio_wait 24
	note G_0
	audio_wait 12
	note A#0
	audio_wait 24
	note NOTE_DURATION_24, G_0
	audio_wait 24
	audio_ret

	audio_call .sub3
	audio_call .sub4
	audio_call .sub2
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_DesertRuins:
	db $3, $2
	dw Music_DesertRuins_Ch1
	dw Music_DesertRuins_Ch2
	dw Music_DesertRuins_Ch3

; unused?
	dw Music_DesertRuins_Ch1.loop
	dw Music_DesertRuins_Ch2.loop
	dw Music_DesertRuins_Ch3.loop

	dw Music_DesertRuins_Ch1.end
	dw Music_DesertRuins_Ch2.end
	dw Music_DesertRuins_Ch3.end
