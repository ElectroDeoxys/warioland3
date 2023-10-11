#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>

const unsigned MAX_FILE_SIZE = 0x8000;

enum Mode
{
    eUndefined,
    eRepeat,
    eLiteralCopy
};

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        perror("Please provide target file\n");
        return 1;
    }

    if (argc > 3)
    {
        perror("Too many arguments");
        return 1;
    }

    const bool forceTrailingCopy = (strcmp(argv[1], "--force-trailing-copy") == 0);
    const bool forceTrailingRepeat = (strcmp(argv[1], "--force-trailing-repeat") == 0);
    const bool noTrailingRepeat = forceTrailingCopy || (strcmp(argv[1], "--no-trailing-repeat") == 0);

    char *inFilename = (char*) malloc((strlen(argv[argc - 1]) + 1) * sizeof(char));
    strcpy(inFilename, argv[argc - 1]);

    char *outFilename = (char*) malloc((strlen(inFilename) + 4 + 1) * sizeof(char));
    strcpy(outFilename, inFilename);
    strcat(outFilename, ".rle");

    FILE *fi = fopen(inFilename, "rb");

    if (fi == NULL)
    {
        printf("Error: %d (%s)\n", errno, strerror(errno));
        return 1;
    }

    int* fileBuffer = (int*) malloc(MAX_FILE_SIZE * sizeof(int));
    unsigned fileSize = 0;
    for (unsigned i = 0; i < MAX_FILE_SIZE; i++)
    {
        int c = fgetc(fi);
        if (feof(fi))
        {
            fileSize = i;
            break;
        }
        fileBuffer[i] = c;
    }

    fclose(fi);

    FILE *fo = fopen(outFilename, "wb");

    int* buffer = (int*) malloc(0x7f * sizeof(int));
    unsigned bufferPos = 0;
    enum Mode mode = eUndefined;

    for (unsigned pos = 0; pos < fileSize; pos++)
    {
        const bool isLastChar = (pos == fileSize - 1);
        const unsigned lookAheadLen = (pos + 4 < fileSize)
                        ? 4
                        : fileSize - pos;
        int nextChars[lookAheadLen];
        for (unsigned i = 0; i < lookAheadLen; i++)
            nextChars[i] = fileBuffer[pos + i];

        // printf("%03x: 0x%02x, (%i)\n", pos, nextChars[0], isLastChar);

        if (mode == eUndefined)
        {
            if (!isLastChar)
            {
                mode = ((lookAheadLen > 2 && nextChars[0] == nextChars[1] && nextChars[1] == nextChars[2])
                     || (lookAheadLen == 2 && nextChars[0] == nextChars[1] && !forceTrailingCopy))
                    ? eRepeat
                    : eLiteralCopy;
            }
            else
            {
                if (!forceTrailingRepeat)
                {
                    // printf("Last char literal copy\n");
                    fputc(0x01 | 0x80, fo);
                    fputc(nextChars[0], fo);
                }
                else
                {
                    // printf("Last char repeat\n");
                    fputc(0x01, fo);
                    fputc(nextChars[0], fo);
                }
            }
        }

        switch (mode)
        {
            case eUndefined: break; // already taken care of

            case eRepeat:
            {
                buffer[bufferPos++] = nextChars[0];

                if ((lookAheadLen > 1 && nextChars[0] != nextChars[1]) // if the next character is different
                  || bufferPos == 0x7f // or if over buffer length, then end run
                  || isLastChar) // or is last char
                {
                    // printf("Repeat for 0x%x bytes, char 0x%x\n", bufferPos, buffer[0]);
                    fputc(bufferPos, fo);
                    fputc(buffer[0], fo);

                    mode = eUndefined;
                    bufferPos = 0;
                }
            }
            break;

            case eLiteralCopy:
            {
                buffer[bufferPos++] = nextChars[0];

                const bool isNextRepeated = lookAheadLen > 3
                                         && nextChars[1] == nextChars[2] && nextChars[1] == nextChars[3]
                                         && bufferPos != 0x7e; // for matching only, remove for optimal compression

                if (isNextRepeated // if the next characters are repeating
                 || bufferPos == 0x7f // or if over buffer length
                 || isLastChar // or is last char, then end run
                 || (lookAheadLen == 3 && nextChars[1] == nextChars[2] && !noTrailingRepeat)) // special case for last chars
                {
                    // printf("Literal copy for 0x%x bytes\n", bufferPos);
                    fputc(bufferPos | 0x80, fo);
                    for (unsigned i = 0; i < bufferPos; ++i)
                        fputc(buffer[i], fo);

                    mode = eUndefined;
                    bufferPos = 0;
                }
            }
            break;
        }
    }

    fputc(0x00, fo);

    free(inFilename);
    free(outFilename);
    free(buffer);
    free(fileBuffer);

    fclose(fo);

    return 0;
}
