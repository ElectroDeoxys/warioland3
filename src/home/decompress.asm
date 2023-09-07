; decompresses data from hl and writes to bc
; the game stores some data in compressed form, such as tile gfx and bg maps
; this routine decompresses it by doing the following logic:
; - if bit 7 is not set, repeat the following byte that amount of times
; - if bit 7 is set, copy the next amount of bytes literally
; the result is written to bc
Decompress:: ; 909 (0:909)
	ld a, [hli]
	and a
	jr z, .done
	bit 7, a
	jr nz, .literal_copy

; copies byte x times
	ld d, a
	ld a, [hli]
	ld e, a
.loop1
	ld a, e
	ld [bc], a
	inc bc
	dec d
	jr nz, .loop1
	jr Decompress

.literal_copy
; copies literal x bytes
	and %01111111
	ld d, a
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .loop2
	jr Decompress
.done
	ret
; 0x928
