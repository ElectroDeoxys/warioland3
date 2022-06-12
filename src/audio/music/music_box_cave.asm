Music_MusicBoxCave_Ch1: ; 39d67 (0e:5d67)
	semitone_offset 0

.loop
	tempo 74
	wave WAVE_1A
	vibrato_amplitude 0
	volume 47
	pitch_offset 0
	note NOTE_DURATION_2, B_5, 12
	audio_wait_4
	note A#5
	audio_wait_4
	note F#5
	audio_wait_4
	note D#5
	audio_wait_4
	note F#5
	audio_wait_4
	note A#5
	audio_wait_4
	audio_jump .loop
.end
	audio_end
; 0x39d85

Music_MusicBoxCave_Ch2: ; 39d85 (0e:5d85)
	semitone_offset 0

.loop
	wave WAVE_10
	vibrato_amplitude 0
	volume 47
	pitch_offset 0
	note NOTE_DURATION_2, B_4, 12
	audio_wait_4
	note A#4
	audio_wait_4
	note F#4
	audio_wait_4
	note D#4
	audio_wait_4
	note F#4
	audio_wait_4
	note A#4
	audio_wait_4
	audio_jump .loop
.end
	audio_end
; 0x39da1

Music_MusicBoxCave_Ch3: ; 39da1 (0e:5da1)
	semitone_offset 0

.loop
	wave WAVE_60
	vibrato_amplitude 0
	volume 56
	pitch_offset 0
	note NOTE_DURATION_3, B_5, 14
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	note NOTE_DURATION_3
	audio_wait_8
	audio_jump .loop
.end
	audio_end
; 0x39db7

Music_MusicBoxCave: ; 39db7 (0e:5db7)
	db 3, 2
	dw Music_MusicBoxCave_Ch1
	dw Music_MusicBoxCave_Ch2
	dw Music_MusicBoxCave_Ch3

; unused?
	dw Music_MusicBoxCave_Ch1.loop
	dw Music_MusicBoxCave_Ch2.loop
	dw Music_MusicBoxCave_Ch3.loop

	dw Music_MusicBoxCave_Ch1.end
	dw Music_MusicBoxCave_Ch2.end
	dw Music_MusicBoxCave_Ch3.end
; 0x39dcb
