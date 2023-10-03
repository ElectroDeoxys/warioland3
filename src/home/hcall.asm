InitHRAMCallFunc::
	ld hl, .Func
	ld de, hCallFunc
	ld b, .end - .Func
	call CopyHLToDE
	ret

.Func:
	ld a, [wROMBank]
	push af
	ld a, $0 ; placeholder bank
	bankswitch
	call $4000 ; placeholder function pointer
	pop af
	bankswitch
	ret
.end
