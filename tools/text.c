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

const char charmap[0x80] = {
    ':', // 0x00

    '_', // 0x01
    '_', // 0x02
    '_', // 0x03
    '_', // 0x04
    '_', // 0x05
    '_', // 0x06
    '_', // 0x07
    '_', // 0x08
    '_', // 0x09
    '_', // 0x0a
    '_', // 0x0b
    '_', // 0x0c
    '_', // 0x0d
    '_', // 0x0e
    '_', // 0x0f
    '_', // 0x10
    '_', // 0x11
    '_', // 0x12
    '_', // 0x13
    '_', // 0x14
    '_', // 0x15
    '_', // 0x16
    '_', // 0x17
    '_', // 0x18
    '_', // 0x19
    '_', // 0x1a
    '_', // 0x1b
    '_', // 0x1c
    '_', // 0x1d
    '_', // 0x1e
    '_', // 0x1f

    '~', // 0x20
    '!', // 0x21
    '?', // 0x22
    '-', // 0x23
    '_', // 0x24 ·
    '_', // 0x25 …

    '_', // 0x26
    '_', // 0x27
    '_', // 0x28
    '_', // 0x29
    '_', // 0x2a
    '_', // 0x2b
    '_', // 0x2c
    '_', // 0x2d
    '_', // 0x2e
    '_', // 0x2f

    '0', // 0x30
    '1', // 0x31
    '2', // 0x32
    '3', // 0x33
    '4', // 0x34
    '5', // 0x35
    '6', // 0x36
    '7', // 0x37
    '8', // 0x38
    '9', // 0x39

    '\'', // 0x3a
    '.', // 0x3b
    ',', // 0x3c
    '(', // 0x3d
    '_', // 0x3e
    ')', // 0x3f

    'A', // 0x40
    'B', // 0x41
    'C', // 0x42
    'D', // 0x43
    'E', // 0x44
    'F', // 0x45
    'G', // 0x46
    'H', // 0x47
    'I', // 0x48
    'J', // 0x49
    'K', // 0x4a
    'L', // 0x4b
    'M', // 0x4c
    'N', // 0x4d
    'O', // 0x4e
    'P', // 0x4f
    'Q', // 0x50
    'R', // 0x51
    'S', // 0x52
    'T', // 0x53
    'U', // 0x54
    'V', // 0x55
    'W', // 0x56
    'X', // 0x57
    'Y', // 0x58
    'Z', // 0x59

    '_', // 0x5a
    '_', // 0x5b
    '_', // 0x5c

    '_', // 0x5d ▼

    '_', // 0x5e
    '_', // 0x5f

    'a', // 0x60
    'b', // 0x61
    'c', // 0x62
    'd', // 0x63
    'e', // 0x64
    'f', // 0x65
    'g', // 0x66
    'h', // 0x67
    'i', // 0x68
    'j', // 0x69
    'k', // 0x6a
    'l', // 0x6b
    'm', // 0x6c
    'n', // 0x6d
    'o', // 0x6e
    'p', // 0x6f
    'q', // 0x70
    'r', // 0x71
    's', // 0x72
    't', // 0x73
    'u', // 0x74
    'v', // 0x75
    'w', // 0x76
    'x', // 0x77
    'y', // 0x78
    'z', // 0x79

    '_', // 0x7a
    '_', // 0x7b
    '_', // 0x7c
    '_', // 0x7d

    ' ', // 0x7e
    '@', // 0x7f
};

static void usage(void)
{
    fprintf(stderr, "Usage: text [-h] [-o outfile] infile\n");
}

static void error(char *message) {
    fputs(message, stderr);
    fputs("\n", stderr);
}

uint8_t convertCharToByte(const char *str, int *offset)
{
    if ((str[0] & 0x80) == 0)
    {
        *offset = 1;
        if (str[0] == '\n' || str[0] == '\0')
            return 0x7f;

        for (uint8_t i = 0; i < 0x80; i++)
            if (charmap[i] == str[0])
                return i;
    }
    else if ((str[0] & 0xf0) == 0xc0)
    {
        static const char *middleDot = "·";

        *offset = 2;

        if (str[0] == middleDot[0] && str[1] == middleDot[1])
        {
            return 0x24;
        }
    }
    else if ((str[0] & 0xf0) == 0xe0)
    {
        static const char *ellipses = "…";
        static const char *arrow = "▼";

        *offset = 3;

        if (str[0] == ellipses[0] && str[1] == ellipses[1] && str[2] == ellipses[2])
        {
            return 0x25;
        }
        else if (str[0] == arrow[0] && str[1] == arrow[1] && str[2] == arrow[2])
        {
            return 0x5d;
        }
    }

    fprintf(stderr, "error: Unsupported character %u\n", str[0]);
    *offset = 1;
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
                *buffPtr = convertCharToByte(&lineBuffer[i], &offset);
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
