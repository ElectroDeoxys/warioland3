; used for when game is actually writing data to SRAM
; only handles OAM and nothing else
VBlank_Saving:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end

; used for when game is showing the save progress bar
; updates the bar progress by overwriting tile and attribute
VBlank_SaveScreen:
	ld hl, .Func
	ld de, wVBlankFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wcee4]
	bit 7, a
	jr z, .transfer
	ld hl, wBGMapTileVRAM0Queue
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld [hl], $5 ; pal
	xor a
	ldh [rVBK], a
	ld [hl], $02
	ld hl, wcee4
	res 7, [hl]
.transfer
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM
	ret
.end
