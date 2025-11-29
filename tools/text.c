#define  _GNU_SOURCE

#include <stdio.h>
#include <getopt.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"

#define BUFFER_SIZE 0x400
#define LINE_LEN 0x10

const char *charmap[0x100] = {
    ":", // 0x00

    "ェ", // 0x01
    "ォ", // 0x02
    "ャ", // 0x03
    "ュ", // 0x04
    "ョ", // 0x05
    "ッ", // 0x06
    "ガ", // 0x07
    "ギ", // 0x08
    "グ", // 0x09
    "ゲ", // 0x0a
    "ゴ", // 0x0b
    "ザ", // 0x0c
    "ジ", // 0x0d
    "ズ", // 0x0e
    "ゼ", // 0x0f
    "ゾ", // 0x10
    "ダ", // 0x11
    "ヂ", // 0x12
    "ヅ", // 0x13
    "デ", // 0x14
    "ド", // 0x15
    "バ", // 0x16
    "ビ", // 0x17
    "ブ", // 0x18
    "ベ", // 0x19
    "ボ", // 0x1a
    "パ", // 0x1b
    "ピ", // 0x1c
    "プ", // 0x1d
    "ペ", // 0x1e
    "ポ", // 0x1f

    "~", // 0x20
    "!", // 0x21
    "?", // 0x22
    "-", // 0x23
    "·", // 0x24
    "…", // 0x25

    "ヌ", // 0x26
    "ネ", // 0x27
    "、", // 0x28
    "。", // 0x29
    "ヒ", // 0x2a
    "フ", // 0x2b
    "チ", // 0x2c
    "ツ", // 0x2d
    "ナ", // 0x2e
    "二", // 0x2f

    "0", // 0x30
    "1", // 0x31
    "2", // 0x32
    "3", // 0x33
    "4", // 0x34
    "5", // 0x35
    "6", // 0x36
    "7", // 0x37
    "8", // 0x38
    "9", // 0x39

    "\'", // 0x3a
    ".", // 0x3b
    ",", // 0x3c
    "(", // 0x3d
    "_", // 0x3e
    ")", // 0x3f

    "A", // 0x40
    "B", // 0x41
    "C", // 0x42
    "D", // 0x43
    "E", // 0x44
    "F", // 0x45
    "G", // 0x46
    "H", // 0x47
    "I", // 0x48
    "J", // 0x49
    "K", // 0x4a
    "L", // 0x4b
    "M", // 0x4c
    "N", // 0x4d
    "O", // 0x4e
    "P", // 0x4f
    "Q", // 0x50
    "R", // 0x51
    "S", // 0x52
    "T", // 0x53
    "U", // 0x54
    "V", // 0x55
    "W", // 0x56
    "X", // 0x57
    "Y", // 0x58
    "Z", // 0x59

    "_", // 0x5a
    "_", // 0x5b
    "_", // 0x5c

    "▼", // 0x5d

    "_", // 0x5e
    "_", // 0x5f

    "a", // 0x60
    "b", // 0x61
    "c", // 0x62
    "d", // 0x63
    "e", // 0x64
    "f", // 0x65
    "g", // 0x66
    "h", // 0x67
    "i", // 0x68
    "j", // 0x69
    "k", // 0x6a
    "l", // 0x6b
    "m", // 0x6c
    "n", // 0x6d
    "o", // 0x6e
    "p", // 0x6f
    "q", // 0x70
    "r", // 0x71
    "s", // 0x72
    "t", // 0x73
    "u", // 0x74
    "v", // 0x75
    "w", // 0x76
    "x", // 0x77
    "y", // 0x78
    "z", // 0x79

    "日", // 0x7a
    "本", // 0x7b
    "英", // 0x7c
    "語", // 0x7d

    " ", // 0x7e
    "@", // 0x7f

    "あ", // 0x80
    "い", // 0x81
    "う", // 0x82
    "え", // 0x83
    "お", // 0x84
    "か", // 0x85
    "き", // 0x86
    "く", // 0x87
    "け", // 0x88
    "こ", // 0x89
    "さ", // 0x8a
    "し", // 0x8b
    "す", // 0x8c
    "せ", // 0x8d
    "そ", // 0x8e
    "た", // 0x8f
    "ち", // 0x90
    "つ", // 0x91
    "て", // 0x92
    "と", // 0x93
    "な", // 0x94
    "に", // 0x95
    "ぬ", // 0x96
    "ね", // 0x97
    "の", // 0x98
    "は", // 0x99
    "ひ", // 0x9a
    "ふ", // 0x9b
    "へ", // 0x9c
    "ほ", // 0x9d
    "ま", // 0x9e
    "み", // 0x9f
    "む", // 0xa0
    "め", // 0xa1
    "も", // 0xa2
    "や", // 0xa3
    "ゆ", // 0xa4
    "よ", // 0xa5
    "ら", // 0xa6
    "り", // 0xa7
    "る", // 0xa8
    "れ", // 0xa9
    "ろ", // 0xaa
    "わ", // 0xab
    "を", // 0xac
    "ん", // 0xad
    "ぁ", // 0xae
    "ぃ", // 0xaf
    "ぅ", // 0xb0
    "ぇ", // 0xb1
    "ぉ", // 0xb2
    "ゃ", // 0xb3
    "ゅ", // 0xb4
    "ょ", // 0xb5
    "っ", // 0xb6
    "が", // 0xb7
    "ぎ", // 0xb8
    "ぐ", // 0xb9
    "げ", // 0xba
    "ご", // 0xbb
    "ざ", // 0xbc
    "じ", // 0xbd
    "ず", // 0xbe
    "ぜ", // 0xbf
    "ぞ", // 0xc0
    "だ", // 0xc1
    "ぢ", // 0xc2
    "づ", // 0xc3
    "で", // 0xc4
    "ど", // 0xc5
    "ば", // 0xc6
    "び", // 0xc7
    "ぶ", // 0xc8
    "べ", // 0xc9
    "ぼ", // 0xca
    "ぱ", // 0xcb
    "ぴ", // 0xcc
    "ぷ", // 0xcd
    "ぺ", // 0xce
    "ぽ", // 0xcf

    "ア", // 0xd0
	"イ", // 0xd1
	"ウ", // 0xd2
	"エ", // 0xd3
	"オ", // 0xd4
	"カ", // 0xd5
	"キ", // 0xd6
	"ク", // 0xd7
	"ケ", // 0xd8
	"コ", // 0xd9
	"サ", // 0xda
	"シ", // 0xdb
	"ス", // 0xdc
	"セ", // 0xdd
	"ソ", // 0xde
	"タ", // 0xdf

    "_", // 0xe0
    "_", // 0xe1

	"テ", // 0xe2
	"ト", // 0xe3

    "_", // 0xe4
    "_", // 0xe5
    "_", // 0xe6
    "_", // 0xe7

	"ノ", // 0xe8
	"ハ", // 0xe9

    "_", // 0xea
    "_", // 0xeb

	"ヘ", // 0xec
	"ホ", // 0xed
	"マ", // 0xee
	"ミ", // 0xef
	"ム", // 0xf0
	"メ", // 0xf1
	"モ", // 0xf2
	"ヤ", // 0xf3
	"ユ", // 0xf4
	"ヨ", // 0xf5
	"ラ", // 0xf6
	"リ", // 0xf7
	"ル", // 0xf8
	"レ", // 0xf9
	"ロ", // 0xfa
	"ワ", // 0xfb
	"ヲ", // 0xfc
	"ン", // 0xfd
	"ァ", // 0xfe
	"ィ", // 0xff
};

static void usage(void)
{
    fprintf(stderr, "Usage: text [-h] [-o outfile] infile\n");
}

static void error(char *message) {
    fputs(message, stderr);
    fputs("\n", stderr);
}

uint8_t convertCharacterToByte(const char *str, int *offset)
{
    // special characters
    if (str[0] == '\n' || str[0] == '\0' || str[0] == '\r')
    {
        *offset = 1;
        return 0x7f;
    }

    char characterBuffer[5] = "\0\0\0\0";

    // check how many bytes to consume as per UTF-8 encoding
    if ((str[0] & 0x80) == 0)
    {
        *offset = 1;
        characterBuffer[0] = str[0];
    }
    else if ((str[0] & 0xe0) == 0xc0)
    {
        *offset = 2;
        characterBuffer[0] = str[0];
        characterBuffer[1] = str[1];
    }
    else if ((str[0] & 0xf0) == 0xe0)
    {
        *offset = 3;
        characterBuffer[0] = str[0];
        characterBuffer[1] = str[1];
        characterBuffer[2] = str[2];
    }
    else if ((str[0] & 0xf8) == 0xf0)
    {
        *offset = 4;
        characterBuffer[0] = str[0];
        characterBuffer[1] = str[1];
        characterBuffer[2] = str[2];
        characterBuffer[3] = str[3];
    }
    else
    {
        *offset = 1;
        fprintf(stderr, "error: Unsupported character %u\n", str[0]);
        return 0;
    }

    for (unsigned i = 0; i < 0x100; i++)
    {
        if (strcmp(charmap[i], characterBuffer) == 0)
            return (uint8_t) i;
    }

    fprintf(stderr, "error: Character not in charmap %s\n", characterBuffer);
    return 0;
}

struct Options
{
    int help;
    char *outfile;
};

struct Options Options;

void get_args(int argc, char *argv[])
{
    struct option long_options[] =
    {
        {0}
    };

    for (int opt = 0; opt != -1;)
    {
        switch (opt = getopt_long(argc, argv, "ho:", long_options))
        {
            case 'h':
                Options.help = true;
                break;
            case 'o':
                Options.outfile = optarg;
                break;
            case 0:
            case -1:
                break;
            default:
                usage();
            exit(1);
            break;
        }
    }
}

int main(int argc, char *argv[])
{
    get_args(argc, argv);
    argc -= optind;
    argv += optind;
    if (Options.help)
    {
        usage();
        return 0;
    }
    if (argc < 1)
    {
        usage();
        exit(1);
    }

    FILE *infile = fopen(argv[0], "r");
    if (infile == NULL)
    {
        error("File not found");
    }

    uint8_t *buff = (uint8_t*) malloc(sizeof(uint8_t) * BUFFER_SIZE);
    memset(buff, 0x7f, BUFFER_SIZE);

    int read;
    char *lineBuffer = (char *)malloc(LINE_LEN * 2 * sizeof(char));
    size_t buffSize = 0;
    size_t lineNum = 1;

    uint8_t *buffPtr = buff;
    while ((read = getline(&lineBuffer, &buffSize, infile)) != -1)
    {
        size_t i = 0;
        size_t numChars = 0;
        while (true)
        {
            if (numChars == LINE_LEN)
            {
                if (i < strlen(lineBuffer) - 1)
                    fprintf(stdout, "Truncated long line, line %ld\n", lineNum);
                break;
            }

            if (i < strlen(lineBuffer) - 1)
            {
                int offset;
                *buffPtr = convertCharacterToByte(&lineBuffer[i], &offset);
                i += offset;
            }
            else
            {
                *buffPtr = 0x7f;
            }
            numChars++;
            buffPtr++;
        }

        lineNum++;

        if (buffPtr > buff + BUFFER_SIZE)
        {
            error("Text file exceeds buffer size!");
            break;
        }
    }

    if (Options.outfile)
    {
        write_u8(Options.outfile, buff, BUFFER_SIZE);
    }

    free(lineBuffer);
    free(buff);
    return 0;
}
