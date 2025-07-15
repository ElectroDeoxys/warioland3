InitTempleScene:
	farcall _InitTempleScene
	ret

UpdateTempleScene:
	farcall _UpdateTempleScene
	ret

Func_80e33:
	ld a, [wJoypadDown]
	bit B_BUTTON_F, a
	jr nz, .b_btn
	ld hl, wSubState
	inc [hl]
	ret
.b_btn
	ld a, SST_OVERWORLD_08
	ld [wSubState], a
	ret
