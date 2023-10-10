Music_LevelClearGotTreasure_Ch1:
	semitone_offset 0
	tempo 75
	wave WAVE_58
	volume 85
	vibrato_speed 20
	vibrato_delay 5
	vibrato_amplitude 10
	vibrato_disabled FALSE
	note NOTE_DURATION_48, G#2, 17
	audio_wait_48
	note A#2
	audio_wait_48
	note C_3
	audio_wait_48
	note C#3
	audio_wait_48
	note D#3
	audio_wait_48
	note C#3
	audio_wait_48
	note C_3
	audio_wait_48
	note NOTE_DURATION_24, A#2
	audio_wait_24
	note G#2
	audio_wait_24

.loop
	wave WAVE_52
	note NOTE_DURATION_3, C#3, 19
	audio_wait_24
	note C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note C#3
	audio_wait_24
	note C_3
	audio_wait_12
	note G#2
	audio_wait_12
	note NOTE_DURATION_6, C#3
	audio_wait_6
	note D#3
	audio_wait_6
	note F_3
	audio_wait_6
	note F#3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_24
	note NOTE_DURATION_6, C#4
	audio_wait_6
	note D#4
	audio_wait_6
	note F_4
	audio_wait_6
	note F#4
	audio_wait_6
	note NOTE_DURATION_3, G#4
	audio_wait_24
	note F#4
	audio_wait_12
	note A#4
	audio_wait_12
	note G#4
	audio_wait_12
	note F#4
	audio_wait_12
	note F_4
	audio_wait_12
	note G#4
	audio_wait_12
	note F#4
	audio_wait_12
	note F_4
	audio_wait_12
	note D#4
	audio_wait_12
	note F#4
	audio_wait_12
	note F_4
	audio_wait_12
	note D#4
	audio_wait_12
	note C#4
	audio_wait_12
	note NOTE_DURATION_6, D#4
	audio_wait_6
	note C#4
	audio_wait_6
	note C_4
	audio_wait_6
	note A#3
	audio_wait_6
	note NOTE_DURATION_3, G#3
	audio_wait_12
	audio_jump .loop
.end
	audio_end

Music_LevelClearGotTreasure_Ch2:
	semitone_offset 0
	wave WAVE_48
	volume 85
	audio_wait_12
	note NOTE_DURATION_3, F_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	audio_wait_12
	note NOTE_DURATION_3, G#2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, A#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub2
	audio_wait_12
	note NOTE_DURATION_3, C_3, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, A#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub3
	audio_wait_12
	note NOTE_DURATION_3, G#2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.loop
	audio_wait_12
	note NOTE_DURATION_3, F_2, 19
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_24
	note NOTE_DURATION_3, F#2
	audio_wait_24
	note NOTE_DURATION_3
	audio_wait_12
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_jump .loop
.end
	audio_end

Music_LevelClearGotTreasure_Ch3:
	semitone_offset 0
	wave WAVE_61
	volume 108
	note NOTE_DURATION_3, C#2, 19
	audio_wait_12
	note G#2
	audio_wait_12
	note G#1
	audio_wait_12
	note G#2
	audio_wait_12
	note D#2
	audio_wait_12
	note A#2
	audio_wait_12
	note A#1
	audio_wait_12
	note A#2
	audio_wait_12
.sub1
	note NOTE_DURATION_3, F_2, 19
	audio_wait_12
	note C_3
	audio_wait_12
	note C_2
	audio_wait_12
	note C_3
	audio_wait_12
	note F#2
	audio_wait_12
	note C#3
	audio_wait_12
	note C#2
	audio_wait_12
	note C#3
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, G#2, 19
	audio_wait_12
	note D#3
	audio_wait_12
	note D#2
	audio_wait_12
	note D#3
	audio_wait_12
	note F#2
	audio_wait_12
	note C#3
	audio_wait_12
	note C#2
	audio_wait_12
	note C#3
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_3, F_2, 19
	audio_wait_12
	note C_3
	audio_wait_12
	note C_2
	audio_wait_12
	note C_3
	audio_wait_12
	note D#2
	audio_wait_12
	note A#2
	audio_wait_12
	note A#1
	audio_wait_12
	note A#2
	audio_wait_12
	audio_ret

.loop
	note NOTE_DURATION_3, C#2, 19
	audio_wait_12
	note G#2
	audio_wait_12
	note G#1
	audio_wait_12
	note G#2
	audio_wait_12
	note D#2
	audio_wait_12
	note A#2
	audio_wait_12
	note A#1
	audio_wait_12
	note A#2
	audio_wait_12
	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_jump .loop
.end
	audio_end

Music_LevelClearGotTreasure_Ch4:
	semitone_offset 0
	wave WAVE_28
	volume 37
	note NOTE_DURATION_2, F#0, 19
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
.sub1
	note NOTE_DURATION_2, F#0, 19
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_2
	audio_wait_6
	note NOTE_DURATION_3, C#0
	audio_wait_6
	note NOTE_DURATION_2, F#0
	audio_wait_6
	audio_ret

	audio_call .sub1
	audio_call .sub1

.loop
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_jump .loop
.end
	audio_end

Music_LevelClearGotTreasure:
	db 4, 2
	dw Music_LevelClearGotTreasure_Ch1
	dw Music_LevelClearGotTreasure_Ch2
	dw Music_LevelClearGotTreasure_Ch3
	dw Music_LevelClearGotTreasure_Ch4

; unused?
	dw Music_LevelClearGotTreasure_Ch1.loop
	dw Music_LevelClearGotTreasure_Ch2.loop
	dw Music_LevelClearGotTreasure_Ch3.loop
	dw Music_LevelClearGotTreasure_Ch4.loop

	dw Music_LevelClearGotTreasure_Ch1.end
	dw Music_LevelClearGotTreasure_Ch2.end
	dw Music_LevelClearGotTreasure_Ch3.end
	dw Music_LevelClearGotTreasure_Ch4.end
