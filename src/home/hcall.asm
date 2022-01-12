InitHRAMCallFunc:: ; a92 (0:a92)
	ld hl, .func
	ld de, hCallFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wROMBank]
	push af
	ld a, $0
	bankswitch
	call $4000
	pop af
	bankswitch
	ret
.func_end
; 0xab5
