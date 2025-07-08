ValidateSaveData::
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM0")
	sramswitch

	ld hl, sCheckVals
	call CheckSaveVals1
	jr nc, .checkvals_ok
	ld hl, s0a000
	call CheckSaveVals2
	jr nc, .checkvals_ok
	ld hl, s0a400
	call CheckSaveVals2
	jr nc, .checkvals_ok

	ld hl, sBackupCheckVals
	call CheckSaveVals1
	jr nc, .checkvals_ok
	ld hl, s0a800
	call CheckSaveVals2
	jr nc, .checkvals_ok
	ld hl, s0ac00
	call CheckSaveVals2
	jr nc, .checkvals_ok
	jp .asm_1f0d0f

.checkvals_ok
	ld a, [s0a790]
	ld b, a
	ld a, [s0a7e0]
	ld c, a
	ld a, [s0afa0]
	ld d, a
	cp b ; s0afa0 == s0a790?
	jr nz, .asm_1f0d08
	cp c ; s0afa0 == s0a7e0?
	jr z, .asm_1f0d03 ; both branches are the same
	ld [wcef1], a
	jr .asm_1f0d20
.asm_1f0d03
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d08
	; s0a790 != s0afa0
	cp c ; s0afa0 == s0a7e0?
	jr z, .asm_1f0d16
	ld a, b
	cp c ; s0a790 == s0a7e0?
	jr z, .asm_1f0d1b

.asm_1f0d0f
	ld a, $ff
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d16
	ld [wcef1], a
	jr .asm_1f0d20

.asm_1f0d1b
	ld [wcef1], a
	jr .asm_1f0d20 ; useless jump

.asm_1f0d20
	call Func_1f0d60
	call Func_1f1246
	pop af
	sramswitch
	ret

; returns carry if bytes in [hl] are not:
; $77 $61 $72 $33
CheckSaveVals1:
	ld a, [hli]
	cp CHECKVAL1_1
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL1_2
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL1_3
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL1_4
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret

; returns carry if bytes in [hl] are not:
; $57 $41 $52 $33
CheckSaveVals2:
	ld a, [hli]
	cp CHECKVAL2_1
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL2_2
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL2_3
	jr nz, .set_carry
	ld a, [hli]
	cp CHECKVAL2_4
	jr nz, .set_carry
	scf
	ccf
	ret
.set_carry
	scf
	ret

Func_1f0d60:
	xor a
	ld [wceee], a
	ld hl, sCheckVals
	call CheckSaveVals1
	jr c, .clear_check_vals

	ld a, [sGameDataChecksum + 0]
	ld b, a
	ld a, [sGameDataChecksum + 1]
	ld c, a
	ld a, [sGameDataChecksumEcho1 + 0]
	ld d, a
	ld a, [sGameDataChecksumEcho1 + 1]
	ld e, a
	ld a, [sGameDataChecksumEcho2 + 0]
	ld h, a
	ld a, [sGameDataChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, sGameData
	call .CalculateChecksumAtHL
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0d9b
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0d9b
	jr .asm_1f0dc2

.asm_1f0d9b
	ld a, [wChecksumMismatches]
	and a
	jr z, .clear_check_vals
	; there's at least 1 mismatch, check if
	; it's equal to calculated checksum
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f0daf
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f0daf
	jr .asm_1f0dc2

.asm_1f0daf
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .clear_check_vals
	; there are 2 mismatches, check if next one
	; is equal to calculated checksum
	ld a, [wceeb + 0]
	cp d
	jr nz, .clear_check_vals
	ld a, [wceeb + 1]
	cp e
	jr nz, .clear_check_vals

.asm_1f0dc2
	ld hl, sGameData ; useless
	ld hl, wceee
	set 0, [hl]
	jr .check_backup_check_vals

.clear_check_vals
	ld a, $10
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, sCheckVals
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.check_backup_check_vals
	ld hl, sBackupCheckVals
	call CheckSaveVals1
	jr c, .clear_backup_check_vals
	ld a, [sBackupGameDataChecksum + 0]
	ld b, a
	ld a, [sBackupGameDataChecksum + 1]
	ld c, a
	ld a, [sBackupGameDataChecksumEcho1 + 0]
	ld d, a
	ld a, [sBackupGameDataChecksumEcho1 + 1]
	ld e, a
	ld a, [sBackupGameDataChecksumEcho2 + 0]
	ld h, a
	ld a, [sBackupGameDataChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, sBackupGameData
	call .CalculateChecksumAtHL
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0e20
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0e20
	jr .asm_1f0e47

.asm_1f0e20
	ld a, [wChecksumMismatches]
	and a
	jr z, .clear_backup_check_vals
	; there's at least 1 mismatch, check if
	; it's equal to calculated checksum
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f0e34
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f0e34
	jr .asm_1f0e47

.asm_1f0e34
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .clear_backup_check_vals
	; there are 2 mismatches, check if next one
	; is equal to calculated checksum
	ld a, [wceeb + 0]
	cp d
	jr nz, .clear_backup_check_vals
	ld a, [wceeb + 1]
	cp e
	jr nz, .clear_backup_check_vals

.asm_1f0e47
	ld hl, sBackupGameData ; useless
	ld hl, wceee
	set 1, [hl]
	jr .asm_1f0e6e

.clear_backup_check_vals
	ld a, $20
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, sBackupCheckVals
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0e6e
	ld a, [s0a79d + 0]
	ld b, a
	ld a, [s0a79d + 1]
	ld c, a
	ld a, [s0a7ed + 0]
	ld d, a
	ld a, [s0a7ed + 1]
	ld e, a
	ld a, [s0afad + 0]
	ld h, a
	ld a, [s0afad + 1]
	ld l, a
	call .GetMatchingChecksum

	call CalculateBackupSRAMChecksum1
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0e9a
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0e9a
	jr .asm_1f0ec1

.asm_1f0e9a
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f0efd
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f0eae
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f0eae
	jr .asm_1f0ec1

.asm_1f0eae
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f0efd
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f0efd
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f0efd
.asm_1f0ec1
	ld hl, wceee
	set 6, [hl]
	ld hl, s0a000
	call CheckSaveVals2
	jr c, .asm_1f0f2f
	ld a, [sWRAMChecksum + 0]
	ld b, a
	ld a, [sWRAMChecksum + 1]
	ld c, a
	ld a, [sWRAMChecksumEcho1 + 0]
	ld d, a
	ld a, [sWRAMChecksumEcho1 + 1]
	ld e, a
	ld a, [sWRAMChecksumEcho2 + 0]
	ld h, a
	ld a, [sWRAMChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, sSaveCounter
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0f00
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0f00
	jr .asm_1f0f27

.asm_1f0efd
	jp .asm_1f0fb2

.asm_1f0f00
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f0f2f
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f0f14
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f0f14
	jr .asm_1f0f27
.asm_1f0f14
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f0f2f
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f0f2f
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f0f2f
.asm_1f0f27
	ld hl, wceee
	set 2, [hl]
	jp .asm_1f0fe2
.asm_1f0f2f
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0a800
	call CheckSaveVals2
	jr c, .asm_1f0fb2
	ld a, [sBackup1WRAMChecksum + 0]
	ld b, a
	ld a, [sBackup1WRAMChecksum + 1]
	ld c, a
	ld a, [sBackup1WRAMChecksumEcho1 + 0]
	ld d, a
	ld a, [sBackup1WRAMChecksumEcho1 + 1]
	ld e, a
	ld a, [sBackup1WRAMChecksumEcho2 + 0]
	ld h, a
	ld a, [sBackup1WRAMChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, s0a804
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f0f83
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f0f83
	jr .asm_1f0faa
.asm_1f0f83
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f0fb2
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f0f97
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f0f97
	jr .asm_1f0faa
.asm_1f0f97
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f0fb2
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f0fb2
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f0fb2
.asm_1f0faa
	ld hl, wceee
	set 3, [hl]
	jp .asm_1f0fe2
.asm_1f0fb2
	ld a, $30
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a000
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $50
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a800
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

.asm_1f0fe2
	ld a, [s0a79f + 0]
	ld b, a
	ld a, [s0a79f + 1]
	ld c, a
	ld a, [s0a7ef + 0]
	ld d, a
	ld a, [s0a7ef + 1]
	ld e, a
	ld a, [s0afaf + 0]
	ld h, a
	ld a, [s0afaf + 1]
	ld l, a
	call .GetMatchingChecksum

	call CalculateBackupSRAMChecksum2
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f100e
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f100e
	jr .asm_1f1035
.asm_1f100e
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f1071
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f1022
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f1022
	jr .asm_1f1035
.asm_1f1022
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f1071
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f1071
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f1071
.asm_1f1035
	ld hl, wceee
	set 7, [hl]
	ld hl, s0a400
	call CheckSaveVals2
	jr c, .asm_1f10a1
	ld a, [sBackup2WRAMChecksum + 0]
	ld b, a
	ld a, [sBackup2WRAMChecksum + 1]
	ld c, a
	ld a, [sBackup2WRAMChecksumEcho1 + 0]
	ld d, a
	ld a, [sBackup2WRAMChecksumEcho1 + 1]
	ld e, a
	ld a, [sBackup2WRAMChecksumEcho2 + 0]
	ld h, a
	ld a, [sBackup2WRAMChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, s0a404
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f1074
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f1074
	jr .asm_1f109b
.asm_1f1071
	jp .asm_1f1122
.asm_1f1074
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f10a1
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f1088
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f1088
	jr .asm_1f109b
.asm_1f1088
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f10a1
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f10a1
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f10a1
.asm_1f109b
	ld hl, wceee
	set 4, [hl]
	ret

.asm_1f10a1
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld hl, s0ac00
	call CheckSaveVals2
	jr c, .asm_1f1122
	ld a, [sBackup3WRAMChecksum + 0]
	ld b, a
	ld a, [sBackup3WRAMChecksum + 1]
	ld c, a
	ld a, [sBackup3WRAMChecksumEcho1 + 0]
	ld d, a
	ld a, [sBackup3WRAMChecksumEcho1 + 1]
	ld e, a
	ld a, [sBackup3WRAMChecksumEcho2 + 0]
	ld h, a
	ld a, [sBackup3WRAMChecksumEcho2 + 1]
	ld l, a
	call .GetMatchingChecksum

	ld hl, s0ac04
	call Func_1f0b5b
	ld a, [wChecksum + 0]
	cp d
	jr nz, .asm_1f10f5
	ld a, [wChecksum + 1]
	cp e
	jr nz, .asm_1f10f5
	jr .asm_1f111c
.asm_1f10f5
	ld a, [wChecksumMismatches]
	and a
	jr z, .asm_1f1122
	ld a, [wcee9 + 0]
	cp d
	jr nz, .asm_1f1109
	ld a, [wcee9 + 1]
	cp e
	jr nz, .asm_1f1109
	jr .asm_1f111c
.asm_1f1109
	ld a, [wChecksumMismatches]
	cp MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	jr nz, .asm_1f1122
	ld a, [wceeb + 0]
	cp d
	jr nz, .asm_1f1122
	ld a, [wceeb + 1]
	cp e
	jr nz, .asm_1f1122
.asm_1f111c
	ld hl, wceee
	set 5, [hl]
	ret

.asm_1f1122
	ld a, $60
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0a400
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	ld a, $80
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	xor a
	ld hl, s0ac00
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret

; input:
; - bc = checksum
; - de = checksum echo 1
; - hl = checksum echo 2
; output:
; - wChecksum = best option for checksum value
.GetMatchingChecksum:
	ld a, h
	cp b
	jr nz, .echo2_not_equal
	cp d
	jr z, .all_high_bytes_equal
	ld a, c
	cp l
	jr nz, .none_equal
	jr .only_echo2_equal

.echo2_not_equal
	cp d
	jr z, .check_lower_echos
	ld a, b
	cp d
	jr z, .check_lower_echo1
	jr .none_equal

.check_lower_echos
	ld a, e
	cp l
	jr nz, .none_equal
	jr .only_echos_equal

.check_lower_echo1
	ld a, c
	cp e
	jr nz, .none_equal
	jr .only_echo1_equal

.all_high_bytes_equal
	ld a, l
	cp c
	jr nz, .check_echos_equality
	cp e
	jr z, .all_equal
	jr .only_echo2_equal

.check_echos_equality
	cp e
	jr z, .only_echos_equal
	ld a, c
	cp e
	jr z, .only_echo1_equal

.none_equal
	; none of the checksums match,
	; we'll use main checksum value for wChecksum
	ld a, MISMATCH_ORIG | MISMATCH_ECHO1 | MISMATCH_ECHO2
	ld [wChecksumMismatches], a
	ld a, b
	ld [wChecksum + 0], a
	ld a, d
	ld [wcee9 + 0], a
	ld a, h
	ld [wceeb + 0], a
	ld a, c
	ld [wChecksum + 1], a
	ld a, e
	ld [wcee9 + 1], a
	ld a, l
	ld [wceeb + 1], a
	ret

.only_echo1_equal
	; only echo1 matches, so we'll,
	; that value for wChecksum
	ld a, MISMATCH_ECHO2
	ld [wChecksumMismatches], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wceeb + 0], a
	ld a, h
	ld [wcee9 + 0], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wceeb + 1], a
	ld a, l
	ld [wcee9 + 1], a
	ret

.only_echo2_equal
	; only echo2 matches, so we'll,
	; that value for wChecksum
	ld a, MISMATCH_ECHO1
	ld [wChecksumMismatches], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wceeb + 0], a
	ld a, d
	ld [wcee9 + 0], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wceeb + 1], a
	ld a, e
	ld [wcee9 + 1], a
	ret

.only_echos_equal
	; only the echos match together,
	; use that for wChecksum
	ld a, MISMATCH_ORIG
	ld [wChecksumMismatches], a
	ld a, d
	ld [wChecksum + 0], a
	ld [wceeb + 0], a
	ld a, b
	ld [wcee9 + 0], a
	ld a, e
	ld [wChecksum + 1], a
	ld [wceeb + 1], a
	ld a, c
	ld [wcee9 + 1], a
	ret

.all_equal
	; all checksums match, use that value for wChecksum
	xor a
	ld [wChecksumMismatches], a
	ld a, b
	ld [wChecksum + 0], a
	ld [wcee9 + 0], a
	ld [wceeb + 0], a
	ld a, c
	ld [wChecksum + 1], a
	ld [wcee9 + 1], a
	ld [wceeb + 1], a
	ret

; calculates checksum of data
; starting at [hl], with length $5b + $11 = $6c
; input:
; - hl = pointer to data to start calculation
; output:
; - de = checksum result
.CalculateChecksumAtHL:
	ld de, 0 ; accumulator
	ld b, SIZEOF("Progress WRAM")
	call CalculateChecksum
	; this changes WRAM bank,
	; but this routine is never called
	; to calculate Checksums of WRAM data
	push_wram $02
	ld b, $11
	call CalculateChecksum
	pop_wram
	ret

; output:
; - de = checksum result
CalculateGameDataChecksum:
	ld de, 0 ; accumulator
	ld hl, STARTOF("Progress WRAM")
	ld b, SIZEOF("Progress WRAM")
	call CalculateChecksum
	push_wram BANK("WRAM2")
	ld hl, wTreasuresCollected
	ld b, (wOWLevel - wTreasuresCollected) + 2
	call CalculateChecksum
	pop_wram
	ret

Func_1f1246:
	xor a
	ld [wceef], a
	ld a, [wceee]
	and $3f
	jr nz, .asm_1f1266
.asm_1f1251
	ld hl, wLevelTimeAttackScores
	ld b, 2 * NUM_LEVELS
	ld a, (10 << $4) | 10
	call WriteAToHL_BTimes
	ld hl, wGolfBestScores
	ld b, $4
	ld a, (10 << $4) | 10
	call WriteAToHL_BTimes
	ret

.asm_1f1266
	ld b, a
	ld a, $3f
	and b
	ld [wceef], a
	ld bc, $600
.asm_1f1270
	rrca
	jr nc, .asm_1f1274
	inc c
.asm_1f1274
	dec b
	jr nz, .asm_1f1270
	ld a, c
	dec a
	jp z, .asm_1f1389

	ld hl, sGameData
	ld de, s0afe0
	ld b, $4
	call CopyHLToDE

	ld hl, sBackupGameData
	ld de, s0afe4
	ld b, $4
	call CopyHLToDE

	ld hl, sSaveCounter
	ld de, s0afe8
	ld b, $4
	call CopyHLToDE

	ld hl, s0a804
	ld de, s0afec
	ld b, $4
	call CopyHLToDE

	ld hl, s0a404
	ld de, s0aff0
	ld b, $4
	call CopyHLToDE

	ld hl, s0ac04
	ld de, s0aff4
	ld b, $4
	call CopyHLToDE

	ld e, $21
.asm_1f12c0
	dec e
	jp z, .asm_1f1389
	xor a
	ld [s0aff8], a
	ld a, [wceef]
	bit 0, a
	jr z, .asm_1f12e4
	ld hl, s0afe0 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f12e4
	ld hl, s0aff8
	set 0, [hl]
.asm_1f12e4
	ld a, [wceef]
	bit 1, a
	jr z, .asm_1f1300
	ld hl, s0afe4 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1300
	ld hl, s0aff8
	set 1, [hl]
.asm_1f1300
	ld a, [wceef]
	bit 2, a
	jr z, .asm_1f131c
	ld hl, s0afe8 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f131c
	ld hl, s0aff8
	set 2, [hl]
.asm_1f131c
	ld a, [wceef]
	bit 3, a
	jr z, .asm_1f1338
	ld hl, s0afec + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1338
	ld hl, s0aff8
	set 3, [hl]
.asm_1f1338
	ld a, [wceef]
	bit 4, a
	jr z, .asm_1f1354
	ld hl, s0aff0 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1354
	ld hl, s0aff8
	set 4, [hl]
.asm_1f1354
	ld a, [wceef]
	bit 5, a
	jr z, .asm_1f1370
	ld hl, s0aff4 + $3
	sla [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	dec l
	rl [hl]
	jr nc, .asm_1f1370
	ld hl, s0aff8
	set 5, [hl]

.asm_1f1370
	ld a, [s0aff8]
	and a
	jp z, .asm_1f12c0
	ld [wceef], a
	ld bc, $600
.asm_1f137d
	rrca
	jr nc, .asm_1f1381
	inc c
.asm_1f1381
	dec b
	jr nz, .asm_1f137d
	ld a, c
	dec a
	jp nz, .asm_1f12c0
.asm_1f1389
	ld a, [wceef]
	bit 0, a
	jr nz, .asm_1f13a7
	bit 1, a
	jr nz, .asm_1f13ae
	bit 2, a
	jr nz, .asm_1f13b5
	bit 3, a
	jr nz, .asm_1f13bc
	bit 4, a
	jr nz, .asm_1f13c3
	bit 5, a
	jr nz, .asm_1f13cd
	jp .asm_1f1251
.asm_1f13a7
	ld hl, sGameData
	call .Func_1f13d7
	ret
.asm_1f13ae
	ld hl, sBackupGameData
	call .Func_1f13d7
	ret
.asm_1f13b5
	ld hl, sSaveCounter
	call .Func_1f13f2
	ret
.asm_1f13bc
	ld hl, s0a804
	call .Func_1f13f2
	ret
.asm_1f13c3
	ld hl, s0a404
	call .Func_1f13f2
	call .Func_1f1420
	ret
.asm_1f13cd
	ld hl, s0ac04
	call .Func_1f13f2
	call .Func_1f1420
	ret

.Func_1f13d7:
	ld de, STARTOF("Progress WRAM")
	ld b, $5b
	call CopyHLToDE
	push_wram BANK("WRAM2")
	ld de, $d000
	ld b, $11
	call CopyHLToDE
	pop_wram
	ret

.Func_1f13f2:
	ld de, wSaveCounter
	ld b, $ca
	call CopyHLToDE
	push_wram BANK("WRAM2")
	ld de, $d000
	ld b, $11
	call CopyHLToDE
	pop_wram
	push_wram BANK("Level Objects WRAM")
	ld de, STARTOF("Level Objects WRAM")
	ld bc, SIZEOF("Level Objects WRAM")
	call CopyHLToDE_BC
	pop_wram
	ret

.Func_1f1420:
	ld a, $40
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM2")
	sramswitch
	ld hl, s2b000
	ld de, s2a000
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	sramswitch

; copy whole SRAM3 to SRAM1
	ld hl, s3a000
	ld bc, $2000
.loop
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM3")
	sramswitch
	ld d, [hl]
	ld a, [wSRAMBank]
	push af
	ld a, BANK("SRAM1")
	sramswitch
	ld a, d
	ld [hli], a
	pop af
	sramswitch
	pop af
	sramswitch
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld a, $41
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	call CalculateBackupSRAMChecksum1
	ld a, d
	ld [s0a79d + 0], a
	ld a, e
	ld [s0a79d + 1], a

	ld a, $42
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0a7ed + 0], a
	ld a, e
	ld [s0a7ed + 1], a

	ld a, $43
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a

	ld a, d
	ld [s0afad + 0], a
	ld a, e
	ld [s0afad + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret

Func_1f14c6:
	ld a, $70
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, [wSRAMBank]
	push af
	ld a, $02
	sramswitch
	ld hl, s2a000
	ld de, s2b000
	ld bc, $1000
	call CopyHLToDE_BC
	pop af
	sramswitch

	ld hl, s0a000
	ld bc, $2000
.loop
	ld a, [wSRAMBank]
	push af
	ld a, $01
	sramswitch
	ld d, [hl]
	ld a, [wSRAMBank]
	push af
	ld a, $03
	sramswitch
	ld a, d
	ld [hli], a
	pop af
	sramswitch
	pop af
	sramswitch
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	ld a, $71
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	call CalculateBackupSRAMChecksum2
	ld a, d
	ld [s0a79f + 0], a
	ld a, e
	ld [s0a79f + 1], a
	ld a, $72
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0a7ef + 0], a
	ld a, e
	ld [s0a7ef + 1], a
	ld a, $73
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ld a, d
	ld [s0afaf + 0], a
	ld a, e
	ld [s0afaf + 1], a

	xor a
	ld [s0a790], a
	ld [s0a7e0], a
	ld [s0afa0], a
	ret
