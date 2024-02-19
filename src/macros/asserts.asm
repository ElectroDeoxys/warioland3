; Macros to verify assumptions about the data or code

MACRO table_width
DEF CURRENT_TABLE_WIDTH = \1
IF _NARG == 2
REDEF CURRENT_TABLE_START EQUS "\2"
ELSE
REDEF CURRENT_TABLE_START EQUS "._table_width\@"
{CURRENT_TABLE_START}:
ENDC
ENDM

MACRO assert_table_length
DEF x = \1
	ASSERT x * CURRENT_TABLE_WIDTH == @ - {CURRENT_TABLE_START}, \
		"{CURRENT_TABLE_START}: expected {d:x} entries, each {d:CURRENT_TABLE_WIDTH} bytes"
ENDM
