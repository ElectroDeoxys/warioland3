InitHRAMCallFunc:: ; a92 (0:a92)
	ld hl, .func
	ld de, hCallFunc
	ld b, .func_end - .func
	call CopyHLToDE
	ret

.func
	ld a, [wROMBank]
	push af
	ld a, $0 ; placeholder bank
	bankswitch
	call $4000 ; placeholder function pointer
	pop af
	bankswitch
	ret
.func_end
; 0xab5
