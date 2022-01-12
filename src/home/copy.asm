; writes a to address in hl, b times
WriteAToHL_BTimes:: ; 420 (0:420)
	ld [hli], a
	dec b
	jr nz, WriteAToHL_BTimes
	ret
; 0x425

; write a to hl, bc times
WriteAToHL_BCTimes:: ; 425 (0:425)
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
; 0x434

; copies bc bytes from hl to de
CopyHLToDE_BC:: ; 434 (0:434)
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
; 0x443

; switches bank to wTempBank
; then copies bc bytes from hl to de
FarCopyHLToDE_BC:: ; 443 (0:443)
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
; 0x466

; copies b bytes from hl to de
CopyHLToDE:: ; 466 (0:466)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyHLToDE
	ret
; 0x46d
