LoadWarioGfx::
	ld a, [wDMASourceBank]
	ld [wPendingDMASourceBank], a
	ld a, [wDMASourcePtr + 0]
	ld [wPendingDMASourcePtr + 0], a
	ld a, [wDMASourcePtr + 1]
	ld [wPendingDMASourcePtr + 1], a

	ld a, HIGH(v0Tiles0)
	ld [wPendingDMADestinationPtr + 0], a
	ld a, LOW(v0Tiles0)
	ld [wPendingDMADestinationPtr + 1], a
	ld a, BANK("VRAM0")
	ld [wPendingDMADestinationBank], a
	ld a, 127
	ld [wPendingDMALength], a
	ld a, TRUE
	ld [wIsDMATransferPending], a
	ret
