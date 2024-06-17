; store in wVBlankFunc a return function
VBlank_Ret::
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ret
.end

; store in wLCDFunc a return function
InitLCD::
	ld a, $d9 ; reti
	ld [wLCDFunc], a
	xor a
	ldh [rIF], a
	ld hl, rIE
	res IEB_STAT, [hl]
	ld hl, rSTAT
	res STATB_LYC, [hl]
	ret

VBlank_GBIncompatible::
VBlank_PauseMenu::
VBlank_GameOver::
VBlank_Perfect::
VBlank_TimeAttackDescription::
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wSCY]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

WaitVBlank::
	wait_lcd_on
	wait_lcd_off
	ret
