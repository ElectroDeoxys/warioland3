#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <errno.h>

void usage()
{
	fprintf(stderr, "Usage: golf [-h] infile binfile tilemapfile attrmapfile\n");
}

// constant values according to constants/golf_constants.asm
#define NUM_GOLF_TERRAIN_BLOCKS 64

enum Terrain
{
    GOLF_TERRAIN_TEE_BOX = 0x0,
    GOLF_TERRAIN_PLAIN,
    GOLF_TERRAIN_HOLE,
    GOLF_TERRAIN_ROUGH,
    GOLF_TERRAIN_BUNKER,
    GOLF_TERRAIN_WATER,
    GOLF_TERRAIN_OB,
    GOLF_TERRAIN_TEE_OB,
    GOLF_TERRAIN_END,
};

const unsigned char GOLF_TERRAIN_EDGE_RIGHT = 0x1 << 4;
const unsigned char GOLF_TERRAIN_EDGE_LEFT  = 0x1 << 5;
const unsigned char GOLF_TERRAIN_2ND_WATER  = 0x1 << 7;

const unsigned HOLE_LENGTH    = 2;
const unsigned TEE_BOX_LENGTH = 7;

struct Hole
{
    unsigned char terrain[NUM_GOLF_TERRAIN_BLOCKS];
    unsigned char par;
    unsigned holeXPos;
    unsigned char waterSpawn1;
    unsigned char waterSpawn2;
};

enum Terrain getTerrain(const char* str)
{
    if (strcmp(str, "TEE_BOX") == 0)
    {
        return GOLF_TERRAIN_TEE_BOX;
    }
    else if (strcmp(str, "PLAIN") == 0)
    {
        return GOLF_TERRAIN_PLAIN;
    }
    else if (strcmp(str, "HOLE") == 0)
    {
        return GOLF_TERRAIN_HOLE;
    }
    else if (strcmp(str, "ROUGH") == 0)
    {
        return GOLF_TERRAIN_ROUGH;
    }
    else if (strcmp(str, "BUNKER") == 0)
    {
        return GOLF_TERRAIN_BUNKER;
    }
    else if (strcmp(str, "WATER") == 0)
    {
        return GOLF_TERRAIN_WATER;
    }
    else if (strcmp(str, "OB") == 0)
    {
        return GOLF_TERRAIN_OB;
    }
    
    fprintf(stderr, "Could not parse terrain %s\n", str);
    exit(EXIT_FAILURE);
}

void addTerrainNoEdges(unsigned char *terrain, enum Terrain terrainVal, unsigned numTerrain)
{
    if (numTerrain < 1)
    {
        fprintf(stderr, "Number of blocks for terrain type %i has to be at least 1\n", terrainVal);
        exit(EXIT_FAILURE);
    }

    for (unsigned i = 0; i < numTerrain; i++)
        terrain[i] = terrainVal;
}

void addTerrainWithEdges(unsigned char *terrain, enum Terrain terrainVal, unsigned numTerrain)
{
    if (numTerrain < 2)
    {
        fprintf(stderr, "Number of blocks for terrain type %i has to be at least 2\n", terrainVal);
        exit(EXIT_FAILURE);
    }

    for (unsigned i = 0; i < numTerrain; i++)
        terrain[i] = terrainVal;
}

void addTerrain(struct Hole *hole, enum Terrain terrainVal, unsigned numTerrain, unsigned *numBlocks, bool isLast)
{
    if (isLast)
    {
        addTerrainNoEdges(hole->terrain + *numBlocks, terrainVal, 1);
        *numBlocks += 1;
        return;
    }

    switch (terrainVal)
    {
        case GOLF_TERRAIN_PLAIN:
        case GOLF_TERRAIN_ROUGH:
        case GOLF_TERRAIN_BUNKER:
            addTerrainNoEdges(hole->terrain + *numBlocks, terrainVal, numTerrain);
            *numBlocks += numTerrain;
            break;

        case GOLF_TERRAIN_WATER:
        case GOLF_TERRAIN_OB:
            addTerrainWithEdges(hole->terrain + *numBlocks, terrainVal, numTerrain);
            *numBlocks += numTerrain;
            break;

        case GOLF_TERRAIN_TEE_BOX:
        case GOLF_TERRAIN_TEE_OB:
            addTerrainNoEdges(hole->terrain + *numBlocks, terrainVal, TEE_BOX_LENGTH);
            *numBlocks += TEE_BOX_LENGTH;
            break;

        case GOLF_TERRAIN_HOLE:
            addTerrainWithEdges(hole->terrain + *numBlocks, terrainVal, HOLE_LENGTH);
            *numBlocks += HOLE_LENGTH;
            break;

        case GOLF_TERRAIN_END:
            fprintf(stderr, "Unexpected terrain type\n");
            exit(EXIT_FAILURE);
    }
}

void assertTerrainConditions(unsigned char *terrain)
{
    if (terrain[0] != GOLF_TERRAIN_TEE_BOX)
    {
        fprintf(stderr, "A tee box must be placed at the start\n");
        exit(EXIT_FAILURE);
    }

    bool hasHole = false;
    unsigned numWaterRegions = 0;

    for (unsigned i = TEE_BOX_LENGTH; i < NUM_GOLF_TERRAIN_BLOCKS; i++)
    {
        if (terrain[i] == GOLF_TERRAIN_TEE_BOX)
        {
            fprintf(stderr, "Tee box can only be placed at the start\n");
            exit(EXIT_FAILURE);
        }
        else if (terrain[i] == GOLF_TERRAIN_HOLE)
        {
            if (hasHole)
            {
                fprintf(stderr, "Cannot place more than 1 hole\n");
                exit(EXIT_FAILURE);
            }

            hasHole = true;
            i++; // holes are 2 blocks wide
        }
        else if (terrain[i] == GOLF_TERRAIN_WATER)
        {
            numWaterRegions++;

            if (numWaterRegions > 2)
            {
                fprintf(stderr, "Cannot place more than 2 water regions\n");
                exit(EXIT_FAILURE);
            }

            // skip all water blocks ahead
            while (terrain[i + 1] == GOLF_TERRAIN_WATER)
                i++;
        }
    }

    if (!hasHole)
    {
        fprintf(stderr, "A hole must be specified\n");
        exit(EXIT_FAILURE);
    }
}

void setHoleProperties(struct Hole *hole)
{
    unsigned holeBlock = TEE_BOX_LENGTH;
    while (hole->terrain[holeBlock] != GOLF_TERRAIN_HOLE)
        holeBlock++;
    hole->holeXPos = ((holeBlock + 1) * 2) * 0x10;

    unsigned waterBlock1 = -1;
    unsigned waterBlock2 = -1;

    for (unsigned i = TEE_BOX_LENGTH; i < NUM_GOLF_TERRAIN_BLOCKS; i++)
    {
        if (hole->terrain[i] == GOLF_TERRAIN_WATER)
        {
            if (waterBlock1 == (unsigned)-1)
            {
                waterBlock1 = i;
            }
            else
            {
                waterBlock2 = i;
                break;
            }

            // skip all water blocks ahead
            while (hole->terrain[i + 1] == GOLF_TERRAIN_WATER)
                i++;
        }
    }

    hole->waterSpawn1 = (waterBlock1 != (unsigned)-1) ? waterBlock1 - 1 : 0;
    hole->waterSpawn2 = (waterBlock2 != (unsigned)-1) ? waterBlock2 - 1 : 0;
}

void setTerrainFlags(struct Hole *hole)
{
    unsigned char *terrain = hole->terrain;
    bool passedFirstWaterRegion = false;

    // for small holes, flag Tee Box with right edge
    if (hole->holeXPos <= 640)
    {
        for (unsigned i = 0; i < 5; i++)
            terrain[i] |= GOLF_TERRAIN_EDGE_RIGHT;
    }

    for (unsigned i = TEE_BOX_LENGTH; i < NUM_GOLF_TERRAIN_BLOCKS; i++)
    {
        if (terrain[i] == GOLF_TERRAIN_WATER
         || terrain[i] == GOLF_TERRAIN_OB
         || terrain[i] == GOLF_TERRAIN_HOLE)
        {
            const enum Terrain terrainType = terrain[i];
            unsigned secondWaterFlag = 0x00;

            if (terrainType == GOLF_TERRAIN_WATER)
            {
                if (!passedFirstWaterRegion)
                {
                    passedFirstWaterRegion = true;
                }
                else
                {
                    secondWaterFlag = GOLF_TERRAIN_2ND_WATER;
                }
            }

            terrain[i] |= (secondWaterFlag | GOLF_TERRAIN_EDGE_LEFT);

            if (i == NUM_GOLF_TERRAIN_BLOCKS - 1)
                break;

            i++;
            while (i < NUM_GOLF_TERRAIN_BLOCKS - 1 && terrain[i + 1] == terrainType)
            {
                terrain[i] |= secondWaterFlag;
                i++;
            }

            if (i < NUM_GOLF_TERRAIN_BLOCKS - 1)
                terrain[i] |= (secondWaterFlag | GOLF_TERRAIN_EDGE_RIGHT);
        }
    }
}

struct Hole parse(FILE *file)
{
    struct Hole hole;

    unsigned numBlocks = 0;

    char buffer[1024];
    char token[10];
    unsigned tokenArg;
    bool lastTokenHadMissingArg = false;

    while (fgets(buffer,  sizeof(buffer), file) != NULL)
    {
        if (buffer[0] == '\n') continue; // ignore empty lines

        if (lastTokenHadMissingArg)
        {
            fprintf(stderr, "Missing argument for %s\n", token);
            exit(EXIT_FAILURE);
        }

        tokenArg = -1;
        sscanf(buffer, "%10s %u", token, &tokenArg);

        if (strcmp(token, "PAR") == 0)
        {
            if (tokenArg == (unsigned)-1)
            {
                fprintf(stderr, "Missing argument for %s\n", token);
                exit(EXIT_FAILURE);
            }

            if (tokenArg != 3 && tokenArg != 4 && tokenArg != 5)
            {
                fprintf(stderr, "Par cannot be %u, valid values are 3, 4 and 5\n", tokenArg);
                exit(EXIT_FAILURE);
            }

            hole.par = tokenArg;
        }
        else
        {
            const unsigned remainingBlocks = NUM_GOLF_TERRAIN_BLOCKS - numBlocks;
            const enum Terrain terrainType = getTerrain(token);

            if (terrainType == GOLF_TERRAIN_TEE_BOX)
            {
                if (remainingBlocks < TEE_BOX_LENGTH)
                {
                    fprintf(stderr, "Cannot place terrain, would overshoot maximum by %u block(s)\n", TEE_BOX_LENGTH - remainingBlocks);
                    exit(EXIT_FAILURE);
                }
            }    
            else if (terrainType == GOLF_TERRAIN_HOLE)
            {
                if (remainingBlocks < HOLE_LENGTH)
                {
                    fprintf(stderr, "Cannot place terrain, would overshoot maximum by %u block(s)\n", HOLE_LENGTH - remainingBlocks);
                    exit(EXIT_FAILURE);
                }
            }
            else
            {
                if (tokenArg == (unsigned)-1)
                {
                    lastTokenHadMissingArg = true;
                    tokenArg = 1; // overwrite with 1 to write terrain
                }

                if (remainingBlocks < tokenArg)
                {
                    fprintf(stderr, "Cannot place terrain, would overshoot maximum by %u block(s)\n", tokenArg - remainingBlocks);
                    exit(EXIT_FAILURE);
                }
            }
    
            addTerrain(&hole, terrainType, tokenArg, &numBlocks, lastTokenHadMissingArg);
        }
    }

    if (numBlocks == 0)
    {
        fprintf(stderr, "Golf hole without terrain blocks\n");
        exit(EXIT_FAILURE);
    }

    if (numBlocks < NUM_GOLF_TERRAIN_BLOCKS)
    {
        const enum Terrain endTerrainType = hole.terrain[numBlocks - 1];

        if (endTerrainType != GOLF_TERRAIN_PLAIN
         && endTerrainType != GOLF_TERRAIN_BUNKER
         && endTerrainType != GOLF_TERRAIN_OB)
        {
            fprintf(stderr, "Invalid ending terrain type %i\n", endTerrainType);
            exit(EXIT_FAILURE);
        }

        for (unsigned i = numBlocks; i < NUM_GOLF_TERRAIN_BLOCKS; i++)
            hole.terrain[i] = endTerrainType;
    }

    assertTerrainConditions(hole.terrain);
    setHoleProperties(&hole);
    setTerrainFlags(&hole);

    return hole;
}

void writeBinFile(struct Hole *hole, const char *binFilename)
{
    FILE *file = fopen(binFilename, "wb");
    if (file == NULL)
    {
        fprintf(stderr, "Error opening file %s", binFilename);
        exit(EXIT_FAILURE);
    }

    // terrain blocks
    fwrite(hole->terrain, sizeof(unsigned char), NUM_GOLF_TERRAIN_BLOCKS, file);
    fputc(GOLF_TERRAIN_END, file);

    // par
    fputc(hole->par, file);

    // hole X position
    fputc(hole->holeXPos % 0x100, file);
    fputc(hole->holeXPos / 0x100, file);

    // water patch spawn blocks
    fputc(hole->waterSpawn1, file);
    fputc(hole->waterSpawn2, file);

    fclose(file);
}

int main(int argc, char *argv[])
{
    if (argc == 2 && strcmp(argv[1], "-h"))
    {
        usage();
        return EXIT_SUCCESS;
    }

    if (argc != 3)
    {
        usage();
        return EXIT_FAILURE;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL)
    {
        fprintf(stderr, "Error opening file %s", argv[1]);
        return EXIT_FAILURE;
    }

    struct Hole hole = parse(file);

    writeBinFile(&hole, argv[2]);

    fclose(file);
    return EXIT_SUCCESS;
}
