IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	fail "warioland3 requires rgbds 0.9.4 or newer."
ENDC

IF (__RGBDS_MAJOR__ == 0 && (__RGBDS_MINOR__ < 9 || __RGBDS_PATCH__ < 4))
	fail "warioland3 requires rgbds 0.9.4 or newer."
ENDC
