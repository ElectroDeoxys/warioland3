; writes a to address in hl, b times
WriteAToHL_BTimes::
	ld [hli], a
	dec b
	jr nz, WriteAToHL_BTimes
	ret

; write a to hl, bc times
WriteAToHL_BCTimes::
	push af
	ld a, c
	and a
	jr z, .skip_inc_b
	inc b
.skip_inc_b
	pop af
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret

; copies bc bytes from hl to de
CopyHLToDE_BC::
	ld a, c
	and a
	jr z, .loop
	inc b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	ret

; switches bank to wTempBank
; then copies bc bytes from hl to de
FarCopyHLToDE_BC::
	ld a, [wROMBank]
	push af
	ld a, [wTempBank]
	bankswitch
	ld a, c
	and a
	jr z, .loop
	inc b
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	pop af
	bankswitch
	ret

; copies b bytes from hl to de
CopyHLToDE::
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyHLToDE
	ret
