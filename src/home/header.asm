; rst vectors
SECTION "rst00", ROM0
	jp Init
	ds 5
SECTION "rst08", ROM0
	ds 8
SECTION "rst10", ROM0
	ds 8
SECTION "rst18", ROM0
	ds 8
SECTION "rst20", ROM0
	ds 8
SECTION "rst28", ROM0
JumpTable::
	add a
	pop hl
	ld e, a
	ld d, $00
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ds 6
SECTION "rst38", ROM0
	ds 8

; interrupts
SECTION "vblank", ROM0
	jp VBlank
	ds 5
SECTION "lcd", ROM0
	jp wLCDFunc
	ds 5
SECTION "timer", ROM0
	reti
	ds 7
SECTION "serial", ROM0
	reti
	ds 7
SECTION "joypad", ROM0
	reti

VBlank:
	push af
	push bc
	push de
	push hl
	ld a, [wEnableVBlankFunc]
	and a
	jr z, .skip
	ld a, [wROMBank]
	push af
	ld a, [wSRAMBank]
	push af
	ldh a, [rWBK]
	push af
	ldh a, [rVBK]
	push af
	call wVBlankFunc
	pop af
	ldh [rVBK], a
	pop af
	ldh [rWBK], a
	pop af
	sramswitch
	pop af
	bankswitch
	ld a, TRUE
	ld [wVBlankFuncExecuted], a
.skip
	pop hl
	pop de
	pop bc
	pop af
	reti
	ds $66

SECTION "romheader", ROM0
	nop
	jp Start
	ds $4c
