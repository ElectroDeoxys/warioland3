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
	ld c, LOW(rHDMA1)
	ld a, [hli] ; wPendingDMASourcePtr
	ld [$ff00+c], a ; rHDMA1
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA2
	ld a, [hli] ; wPendingDMADestinationBank
	ldh [rVBK], a
	inc c
	ld a, [hli] ; wPendingDMADestinationPtr
	ld [$ff00+c], a ; rHDMA3
	inc c
	ld a, [hli]
	ld [$ff00+c], a ; rHDMA4
	inc c
	ld a, [hl] ; wPendingDMALength
	ld [$ff00+c], a ; rHDMA5

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
