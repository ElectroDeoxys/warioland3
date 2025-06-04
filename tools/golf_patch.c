#include "golf.h"
#include "golf_patch.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

void usage()
{
	fprintf(stderr, "Usage: golf_patch [-h] n tilemap1 tilemap2 attrmap1 attrmap2\n");
}

void applyPatch(const char *filename, PatchByte *patchBytes, unsigned patchSize)
{
    if (patchBytes == NULL) return;

    FILE *infile = fopen(filename, "rb");
    if (infile == NULL)
    {
        fprintf(stderr, "Error opening file %s", filename);
        exit(EXIT_FAILURE);
    }

    unsigned char* buffer = malloc(GOLF_BGMAP_WIDTH * GOLF_HEIGHT * sizeof(unsigned char));
    if (!fread(buffer, sizeof(unsigned char), GOLF_BGMAP_WIDTH * GOLF_HEIGHT, infile))
    {
        fprintf(stderr, "Failed to read file %s", filename);
        free(buffer);
        exit(EXIT_FAILURE);
    }
    fclose(infile);

    // replace bytes
    for (unsigned i = 0; i < patchSize; i++)
        buffer[patchBytes[i].x + patchBytes[i].y * GOLF_BGMAP_WIDTH] = patchBytes[i].b;

    FILE *outfile = fopen(filename, "wb");
    if (outfile == NULL)
    {
        fprintf(stderr, "Error opening file %s", filename);
        exit(EXIT_FAILURE);
    }
    fwrite(buffer, sizeof(unsigned char), GOLF_BGMAP_WIDTH * GOLF_HEIGHT, outfile);
    fclose(outfile);

    free(buffer);
}

int main(int argc, char *argv[])
{
    if (argc == 2 && strcmp(argv[1], "-h") == 0)
    {
        usage();
        return EXIT_SUCCESS;
    }

    if (argc != 6)
    {
        usage();
        return EXIT_FAILURE;
    }

    const unsigned holeNum = strtol(argv[1], NULL, 10);

    applyPatch(argv[2], patches[holeNum][0], patchSizes[holeNum][0]);
    applyPatch(argv[3], patches[holeNum][1], patchSizes[holeNum][1]);
    applyPatch(argv[4], patches[holeNum][2], patchSizes[holeNum][2]);
    applyPatch(argv[5], patches[holeNum][3], patchSizes[holeNum][3]);

    return EXIT_SUCCESS;
}
