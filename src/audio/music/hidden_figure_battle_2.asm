Music_HiddenFigureBattle2_Ch1: ; 3b4ed (0e:74ed)
	semitone_offset 0

.loop
	tempo 90
	wave WAVE_51
	volume 80
	note NOTE_DURATION_3, G_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	note NOTE_DURATION_3, A#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, A_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_3, G#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_3, G_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub4
	note NOTE_DURATION_3, F#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub5
	note NOTE_DURATION_3, G_2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub5
	note NOTE_DURATION_3, F#2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, F_2
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub6
	note NOTE_DURATION_3, D#2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub6
.sub7
	note NOTE_DURATION_3, D_2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub7
.sub8
	note NOTE_DURATION_3, C_2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub8
	audio_call .sub8
	audio_call .sub8
	audio_jump .loop
.end
	audio_end
; 0x3b60a

Music_HiddenFigureBattle2_Ch2: ; 3b60a (0e:760a)
	semitone_offset 0

.loop
	wave WAVE_47
	volume 80
	note NOTE_DURATION_3, C_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub1
	note NOTE_DURATION_3, D#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub2
	note NOTE_DURATION_3, D_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub3
	note NOTE_DURATION_3, C#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

.sub4
	note NOTE_DURATION_3, C_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub4
	note NOTE_DURATION_3, B_0, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#0
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub5
	note NOTE_DURATION_3, C_2, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub5
	note NOTE_DURATION_3, B_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3, A#1
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
.sub6
	note NOTE_DURATION_3, G#1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub6
.sub7
	note NOTE_DURATION_3, G_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub7
.sub8
	note NOTE_DURATION_3, F_1, 21
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_12
	audio_ret

	audio_call .sub8
	audio_call .sub8
	audio_call .sub8
	audio_jump .loop
.end
	audio_end
; 0x3b725

Music_HiddenFigureBattle2_Ch3: ; 3b725 (0e:7725)
	semitone_offset 0

.loop
	wave WAVE_5E
	volume 108
	note NOTE_DURATION_6, C_0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
.sub1
	note NOTE_DURATION_6, C_0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
	audio_call .sub1
.sub2
	note NOTE_DURATION_6, D#0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

.sub3
	note NOTE_DURATION_6, D_0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

.sub4
	note NOTE_DURATION_6, C#0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
	audio_ret

	audio_call .sub1
	audio_call .sub2
	audio_call .sub3
	audio_call .sub4
	audio_call .sub1
.sub5
	note NOTE_DURATION_6, C_0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_24
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6, D_0
	audio_wait_12
	note C#0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub5
	audio_call .sub1
.sub6
	audio_wait_12
	note NOTE_DURATION_6, C_0, 24
	audio_wait_36
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6
	audio_wait_12
	note NOTE_DURATION_6, D_0
	audio_wait_12
	note C#0
	audio_wait_12
	audio_ret

	audio_call .sub1
	audio_call .sub6
	audio_jump .loop
.end
	audio_end
; 0x3b7ab

Music_HiddenFigureBattle2_Ch4: ; 3b7ab (0e:77ab)
	semitone_offset 0

.loop
	wave WAVE_28
	volume 66
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
.sub1
	note NOTE_DURATION_3, D_0, 19
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_12
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
	note NOTE_DURATION_3
	audio_wait_6
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
	audio_jump .loop
.end
	audio_end
; 0x3b834

Music_HiddenFigureBattle2: ; 3b834 (0e:7834)
	db 4, 2
	dw Music_HiddenFigureBattle2_Ch1
	dw Music_HiddenFigureBattle2_Ch2
	dw Music_HiddenFigureBattle2_Ch3
	dw Music_HiddenFigureBattle2_Ch4

; unused?
	dw Music_HiddenFigureBattle2_Ch1.loop
	dw Music_HiddenFigureBattle2_Ch2.loop
	dw Music_HiddenFigureBattle2_Ch3.loop
	dw Music_HiddenFigureBattle2_Ch4.loop

	dw Music_HiddenFigureBattle2_Ch1.end
	dw Music_HiddenFigureBattle2_Ch2.end
	dw Music_HiddenFigureBattle2_Ch3.end
	dw Music_HiddenFigureBattle2_Ch4.end
; 0x3b84e
