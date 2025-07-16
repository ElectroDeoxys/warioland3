; this function is called during level V-Blank
LevelVBlankFunc::
	ld a, [wIsDMATransferPending]
	and a
	jr nz, .dma_transfer

	xor a ; SRAM0
	ld [rRAMB + $100], a

	; apply scroll X and Y, including shake effect
	ld hl, wSCYShake
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	; push OAM
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

; write tiles in wBGMapTileVRAM0Queue to the
; corresponding addresses in wBGMapAddressQueue
; this takes care of both VRAM0 and VRAM1
; since afterwards we got a jump to ProcessLevelTileQueue_VRAM1
	ld hl, wBGMapAddressQueue
	ld bc, wBGMapTileVRAM0Queue
	jp wVBlankFunc + $10

.dma_transfer
	ld hl, wPendingDMASourceBank
	ld a, [hli]
	ld [rROMB0 + $100], a
	ld c, LOW(rVDMA_SRC_HIGH)
	ld a, [hli] ; wPendingDMASourcePtr
	ld [$ff00+c], a ; rVDMA_SRC_HIGH
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rVDMA_SRC_LOW
	ld a, [hli] ; wPendingDMADestinationBank
	ldh [rVBK], a
	inc c
	ld a, [hli] ; wPendingDMADestinationPtr
	ld [$ff00+c], a ; rVDMA_DEST_HIGH
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rVDMA_DEST_LOW
	inc c
	ld a, [hl] ; wPendingDMALength
	ld [$ff00+c], a ; rVDMA_LEN

	xor a
	ld [wIsDMATransferPending], a

	; apply scroll X and Y, including shake effect
	ld hl, wSCYShake
	ld a, [wSCY]
	add [hl]
	ldh [rSCY], a
	ld a, [wSCX]
	ldh [rSCX], a

	; push OAM
	ld a, HIGH(wVirtualOAM)
	call hTransferVirtualOAM

	xor a
	ld [wBGMapTileQueueSize], a
	ld [wBGMapAddressQueueSize], a
	ret

; called within level VBlank
ProcessLevelTileQueue_VRAM1::
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, wBGMapAddressQueue
	ld bc, wBGMapTileVRAM1Queue
	jp wVBlankFuncExtended

ClearLevelTileQueue::
	xor a
	ld [wBGMapTileQueueSize], a
	ld [wBGMapAddressQueueSize], a
	ret
