; store in wVBlankFunc a return function
VBlank_Ret:: ; 334 (0:334)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ret
.func_end

; store in wLCDFunc a return function
InitLCD:: ; 341 (0:341)
	ld a, $d9 ; reti
	ld [wLCDFunc], a
	xor a
	ldh [rIF], a
	ld hl, rIE
	res IEB_STAT, [hl]
	ld hl, rSTAT
	res STATB_LYC, [hl]
	ret
; 0x354

VBlank_354:: ; 354 (0:354)
	ld hl, .func
	ld de, wVBlankFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.func_end
; 0x370

WaitVBlank:: ; 370 (0:370)
	ldh a, [rSTAT]
	and STATF_LCD
	jr z, WaitVBlank
.is_on
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .is_on
	ret
; 0x37d
