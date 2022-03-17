Pals_c800:: ; c800 (3:4800)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26
; 0xc810

Pals_c810: ; c810 (3:4810)
	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb  0,  7, 11
	rgb 31, 31, 31

	rgb  0, 22, 16
	rgb 10, 10, 10
	rgb 21, 21, 21
	rgb 31, 31, 31
; 0xc820

Pals_c820: ; c820 (3:4820)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31,  0,  0
	rgb  0,  0,  0
; 0xc830

Pals_c830: ; c830 (3:4830)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 20,  0,  0
	rgb 31,  0,  0
	rgb  0,  0,  0
; 0xc840

Pals_c840: ; c840 (3:4840)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 11,  0,  0
	rgb 24,  0,  0
	rgb  0,  0,  0
; 0xc850

Pals_c850: ; c850 (3:4850)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb  0,  0,  0
	rgb 20,  0,  0
	rgb  0,  0,  0
; 0xc860

Pals_c860: ; c860 (03:4860)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb  0,  0,  0
; 0xc870

Pals_c870: ; c870 (03:4870)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb  0, 20, 31
	rgb  0,  0,  0
; 0xc880

	INCROM $c880, $c890

Pals_c890: ; c890 (3:4890)
	rgb 21, 21, 21
	rgb 31, 31, 21
	rgb  0, 23, 10
	rgb  2,  3,  7

	rgb 21, 21, 21
	rgb 31, 31, 31
	rgb 21, 21, 21
	rgb  0,  0,  0
; 0xc8a0

	INCROM $c8a0, $c910

Pals_c910: ; c910 (3:4910)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  0, 26, 31
	rgb 29,  1, 19
; 0xc920

Pals_c920: ; c920 (3:4920)
	rgb  0, 22, 16
	rgb 31, 30,  1
	rgb 31,  0,  0
	rgb  9,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  0, 26, 31
	rgb 29,  1, 19
; 0xc930

	INCROM $c930, $c950

Pals_c950: ; c950 (03:4950)
	rgb 18, 18, 18
	rgb 31, 31,  4
	rgb 18, 12, 31
	rgb  0,  0,  0

	rgb 18, 18, 18
	rgb 31, 31, 31
	rgb 31,  5,  5
	rgb  0,  0,  0

	rgb 18, 18, 18
	rgb 31, 31,  4
	rgb 31, 12,  8
	rgb 14,  1, 18

	rgb 18, 18, 18
	rgb 31, 31, 31
	rgb 31,  5,  5
	rgb  0,  0,  0

	rgb 18, 18, 18
	rgb 31, 31, 31
	rgb 25, 25, 26
	rgb 10, 10, 10

	rgb 18, 18, 18
	rgb 31, 31, 31
	rgb 31,  5,  5
	rgb  0,  0,  0
; 0xc980

Pals_c980: ; c980 (03:4980)
	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 23, 15, 31
	rgb  0,  2,  0

	rgb 10, 10, 10
	rgb 31, 31, 31
	rgb 11, 15, 31
	rgb  0,  4, 11
; 0xc990

Pals_c990: ; c990 (03:4990)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 18, 16, 31
	rgb  0,  0,  0
; 0xc9a0

Pals_c9a0: ; c9a0 (03:49a0)
	rgb 15, 15, 15
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb 15, 15, 15
	rgb 31, 31, 31
	rgb  0, 19, 31
	rgb  0,  0,  0
; 0xc9b0

Pals_c9b0: ; c9b0 (03:49b0)
	rgb  0, 22, 16
	rgb 31, 30, 12
	rgb 29, 14,  0
	rgb 11,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb  8, 31, 31
	rgb  6,  5, 26
; 0xc9c0

Pals_c9c0: ; c9c0 (03:49c0)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 30,  8,  5
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26
; 0xc9d0

Pals_c9d0: ; c9d0 (03:49d0)
	rgb  0, 22, 16
	rgb 31, 30,  0
	rgb 30,  0,  3
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 30,  0,  3
	rgb 31, 30, 12
	rgb  6,  5, 26
; 0xc9e0

Pals_c9e0: ; c9e0 (03:49e0)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 30, 12
	rgb 31,  1,  3
; 0xc9f0