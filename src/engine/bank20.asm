	INCROM $80000, $80392

Func_80392: ; 80392 (20:4392)
	ld a, [wSubSequence]
	jumptable

    dw SubSeq_FastFadeToWhite
    dw $43f9
    dw SubSeq_SlowFadeFromWhite
    dw $44ec
    dw SubSeq_FastFadeToWhite
    dw $44f7
    dw SubSeq_SlowFadeFromWhite
    dw $4540
    dw FadeBGToWhite_Normal
    dw $455f
    dw DarkenBGToPal_Normal
    dw $45d7
    dw FadeBGToWhite_Normal
    dw $4dc0
    dw DarkenBGToPal_Normal
    dw $4dd0
    dw FadeBGToWhite_Normal
    dw $4d6c
    dw DarkenBGToPal_Normal
    dw $4d7c
    dw FadeBGToWhite_Normal
    dw $4db1
    dw FadeBGToWhite_Normal
    dw $4df3
    dw DarkenBGToPal_Normal
    dw $4e03
    dw FadeBGToWhite_Normal
    dw $4e13
    dw DarkenBGToPal_Normal
    dw $4e23
    dw $4e33
    dw FadeBGToWhite_Normal
    dw $4e45
    dw DarkenBGToPal_Normal
    dw $4e55
    dw SubSeq_FastFadeToWhite
    dw $4e65
    dw SubSeq_SlowFadeFromWhite
    dw $4e75
    dw $4e85
; 0x803e6

	INCROM $803e6, $82cb8
