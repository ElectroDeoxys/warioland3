#include "golf.h"

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

void usage()
{
	fprintf(stderr, "Usage: golf [-h] infile binfile tilemapfile attrmapfile\n");
}


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

    for (unsigned i = TEE_BOX_LENGTH; i < GOLF_WIDTH; i++)
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

    for (unsigned i = TEE_BOX_LENGTH; i < GOLF_WIDTH; i++)
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
    if (hole->holeXPos <= SMALL_HOLE_XTHRESHOLD)
    {
        for (unsigned i = 0; i < 5; i++)
            terrain[i] |= GOLF_TERRAIN_EDGE_RIGHT;
    }

    for (unsigned i = TEE_BOX_LENGTH; i < GOLF_WIDTH; i++)
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

            if (i == GOLF_WIDTH - 1)
                break;

            i++;
            while (i < GOLF_WIDTH - 1 && terrain[i + 1] == terrainType)
            {
                terrain[i] |= secondWaterFlag;
                i++;
            }

            if (i < GOLF_WIDTH - 1)
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
            const unsigned remainingBlocks = GOLF_WIDTH - numBlocks;
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

    if (numBlocks < GOLF_WIDTH)
    {
        const enum Terrain endTerrainType = hole.terrain[numBlocks - 1];

        if (endTerrainType != GOLF_TERRAIN_PLAIN
         && endTerrainType != GOLF_TERRAIN_BUNKER
         && endTerrainType != GOLF_TERRAIN_OB)
        {
            fprintf(stderr, "Invalid ending terrain type %i\n", endTerrainType);
            exit(EXIT_FAILURE);
        }

        for (unsigned i = numBlocks; i < GOLF_WIDTH; i++)
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
    fwrite(hole->terrain, sizeof(unsigned char), GOLF_WIDTH, file);
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

unsigned getTerrainLength(unsigned char *terrain, unsigned col)
{
    unsigned len = 0;
    unsigned char terrainType = terrain[col] & GOLF_TERRAIN_MASK;

    while (true)
    {
        col++;
        len++;

        if (col == GOLF_WIDTH)
            return -1; // at end

        if ((terrain[col] & GOLF_TERRAIN_MASK) != terrainType)
            break;
    }

    return len;
}

void initBGMaps(unsigned char * restrict tilemap, unsigned char * restrict attrmap)
{
    // fill first 5 rows with sky tiles
    for (unsigned i = 0; i < 5 * GOLF_WIDTH; i++)
    {
        tilemap[i] = TILE_COL0;
        attrmap[i] = PAL_2;
    }

    // fill 6th row with bottom floor tile
    for (unsigned i = 6 * GOLF_WIDTH; i < 7 * GOLF_WIDTH; i++)
    {
        tilemap[i] = TILE_PLAIN_BOTTOM;
        attrmap[i] = PAL_1;
    }

    // fill last 4 rows with black tiles
    for (unsigned i = 7 * GOLF_WIDTH; i < 11 * GOLF_WIDTH; i++)
    {
        tilemap[i] = TILE_COL1;
        attrmap[i] = PAL_0;
    }

    // tile on upper left corner
    tilemap[COORD(0, 0)] = TILE_CLOUD_CORNER;
    attrmap[COORD(0, 0)] = PAL_5;
}

unsigned placeTeeBox(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, bool teeBoxWithOB)
{
    unsigned char tiles[7] = { TILE_TEE_BOX_1, TILE_TEE_BOX_2, TILE_TEE_BOX_3, TILE_TEE_BOX_3, TILE_TEE_BOX_3, TILE_TEE_BOX_2, TILE_TEE_BOX_1 };
    unsigned char attrs[7] = { PAL_2, PAL_1, PAL_1, PAL_1, PAL_1, PAL_1 | BGF_XFLIP, PAL_2 | BGF_XFLIP };

    tilemap[COORD(col + 5, 3)] = TILE_TEE_SIGN;
    attrmap[COORD(col + 5, 3)] = PAL_3 | BGF_PRI;

    for (unsigned i = 0; i < 7; i++)
    {
        tilemap[COORD(col + i, 4)] = tiles[i];
        attrmap[COORD(col + i, 4)] = attrs[i];
    }

    if (teeBoxWithOB)
    {
        unsigned char obTiles[6*2] = {
            TILE_TEE_OB_TOP, TILE_TEE_OB_TOP, TILE_TEE_OB_TOP, TILE_TEE_OB_TOP, TILE_TEE_OB_EDGE_TOP, TILE_PLAIN_LEFT_EDGE_TOP,
            TILE_TEE_OB_BOTTOM, TILE_TEE_OB_BOTTOM, TILE_TEE_OB_BOTTOM, TILE_TEE_OB_BOTTOM, TILE_TEE_OB_EDGE_BOTTOM, TILE_PLAIN_LEFT_EDGE_BOTTOM,
        };

        for (unsigned i = 0; i < 2; i++)
        {
            for (unsigned j = 0; j < 6; j++)
            {
                tilemap[COORD(col + j, 5 + i)] = obTiles[6*i + j];
                attrmap[COORD(col + j, 5 + i)] = PAL_3;
            }
        }
    }

    return 7;
}

unsigned placePlain(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, unsigned len, bool leftEdge, bool rightEdge)
{
    if (len == 1 && leftEdge && rightEdge)
    {
        // take care of 1 tile wide plains
        tilemap[COORD(col, 5)] = TILE_PLAIN_PILLAR_TOP;
        attrmap[COORD(col, 5)] = PAL_1;
        tilemap[COORD(col, 6)] = TILE_PLAIN_PILLAR_BOTTOM;
    }
    else
    {
        // more than 1 tile wide
        unsigned char floorTile = TILE_PLAIN_1_TOP;

        for (unsigned i = 0; i < len; i++)
        {
            tilemap[COORD(col + i, 5)] = floorTile;
            attrmap[COORD(col + i, 5)] = PAL_1;
            floorTile = (floorTile == TILE_PLAIN_1_TOP) ? TILE_PLAIN_2_TOP : TILE_PLAIN_1_TOP;
        }

        if (leftEdge)
        {
            tilemap[COORD(col, 5)] = TILE_PLAIN_LEFT_EDGE_TOP;
            tilemap[COORD(col, 6)] = TILE_PLAIN_LEFT_EDGE_BOTTOM;
        }

        if (rightEdge)
        {
            tilemap[COORD(col + len - 1, 5)] = TILE_PLAIN_RIGHT_EDGE_TOP;
            tilemap[COORD(col + len - 1, 6)] = TILE_PLAIN_RIGHT_EDGE_BOTTOM;
        }
    }

    return len;
}

unsigned placeBunker(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, unsigned len)
{
    if (len == (unsigned)-1)
        len = GOLF_WIDTH - col;

    unsigned char tileOffs  = 0;

    for (unsigned c = col; c < col + len; c++)
    {
        tilemap[COORD(c, 4)] = TILE_SAND_1_TOP + tileOffs;
        attrmap[COORD(c, 4)] = PAL_2 | BGF_PRI;
        tilemap[COORD(c, 5)] = TILE_SAND_1_MIDDLE + tileOffs;
        attrmap[COORD(c, 5)] = PAL_4 | BGF_PRI;
        tilemap[COORD(c, 6)] = TILE_SAND_1_BOTTOM + tileOffs;
        attrmap[COORD(c, 6)] = PAL_4 | BGF_PRI;

        tileOffs = (tileOffs) ? 0 : 1;
    }

    return len;
}

unsigned placeWater(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, unsigned len)
{
    unsigned char baseTile  = TILE_WATER_1_TOP;
    unsigned char tilesWater[4] = { TILE_WATER_1_BOTTOM, TILE_WATER_2_BOTTOM, TILE_WATER_3_BOTTOM, TILE_WATER_4_BOTTOM };
    unsigned waterTileIdx = 0;

    for (unsigned c = col; c < col + len; c++)
    {
        tilemap[COORD(c, 5)] = baseTile;
        attrmap[COORD(c, 5)] = PAL_7;
        tilemap[COORD(c, 6)] = tilesWater[waterTileIdx % 4];
        attrmap[COORD(c, 6)] = PAL_5;

        baseTile = (baseTile  == TILE_WATER_1_TOP) ? TILE_WATER_2_TOP : TILE_WATER_1_TOP;
        waterTileIdx++;
    }

    return len;
}

unsigned placeOb(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, unsigned len)
{
    if (len == (unsigned)-1)
        len = GOLF_WIDTH - col;

    tilemap[COORD(col - 1, 4)] = TILE_OB_SIGN;
    attrmap[COORD(col - 1, 4)] = PAL_3 | BGF_PRI;

    unsigned char tileOffs  = 0;

    for (unsigned c = col; c < col + len; c++)
    {
        tilemap[COORD(c, 5)] = TILE_WATER_1_TOP + tileOffs;
        attrmap[COORD(c, 5)] = PAL_7;
        tilemap[COORD(c, 6)] = TILE_LAVA_1 + tileOffs;
        attrmap[COORD(c, 6)] = PAL_6;

        tileOffs = (tileOffs) ? 0 : 1;
    }

    if (col + len < GOLF_WIDTH)
    {
        tilemap[COORD(col + len, 4)] = TILE_OB_SIGN;
        attrmap[COORD(col + len, 4)] = PAL_3 | BGF_PRI;
    }

    return len;
}

unsigned placeRough(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col, unsigned len)
{
    tilemap[COORD(col, 4)] = TILE_BUSH_EDGE;
    tilemap[COORD(col, 5)] += (TILE_PLAIN_SHADOW_1 - TILE_PLAIN_1_TOP);

    unsigned char tileOffs  = 0;

    for (unsigned c = col + 1; c < col + len - 1; c++)
    {
        tilemap[COORD(c, 3)] = TILE_BUSH_1_TOP + tileOffs;
        tilemap[COORD(c, 4)] = TILE_BUSH_1_BOTTOM + tileOffs;
        tilemap[COORD(c, 5)] += (TILE_PLAIN_SHADOW_1 - TILE_PLAIN_1_TOP);

        tileOffs = (tileOffs) ? 0 : 1;
    }

    for (unsigned c = col; c < col + len; c++)
    {
        // apply BG priority
        attrmap[COORD(c, 3)] |= BGF_PRI;
        attrmap[COORD(c, 4)] |= BGF_PRI;
        attrmap[COORD(c, 5)] |= BGF_PRI;
        attrmap[COORD(c, 6)] |= BGF_PRI;
    }

    tilemap[COORD(col + len - 1, 4)] = TILE_BUSH_EDGE;
    attrmap[COORD(col + len - 1, 4)] |= BGF_XFLIP; // set x flip bit

    tilemap[COORD(col + len - 1, 5)] += (TILE_PLAIN_SHADOW_1 - TILE_PLAIN_1_TOP);

    return len;
}

unsigned placeHole(unsigned char * restrict tilemap, unsigned char * restrict attrmap, unsigned col)
{
    unsigned char tiles[7][3] = {
        { TILE_FLAG_POLE_1_TOP, TILE_FLAG_1, TILE_FLAG_2 },
        { TILE_FLAG_POLE_2_TOP, TILE_FLAG_3, TILE_FLAG_4 },
        { TILE_FLAG_POLE_LEFT, TILE_FLAG_POLE_RIGHT, 0x00 },
        { TILE_FLAG_POLE_LEFT, TILE_FLAG_POLE_RIGHT, 0x00 },
        { TILE_FLAG_POLE_LEFT, TILE_FLAG_POLE_RIGHT, 0x00 },
        { TILE_HOLE_LEFT_TOP, TILE_HOLE_RIGHT_TOP, 0x00 },
        { TILE_HOLE_LEFT_BOTTOM, TILE_HOLE_RIGHT_BOTTOM, 0x00 }
    };

    unsigned char attrs[7][3] = {
        { PAL_3, PAL_0 | BGF_BANK1, PAL_0 | BGF_BANK1 },
        { PAL_3, PAL_0 | BGF_BANK1, PAL_0 | BGF_BANK1 },
        { PAL_3, PAL_3, 0x00 },
        { PAL_3, PAL_3, 0x00 },
        { PAL_3, PAL_3, 0x00 },
        { PAL_3, PAL_3, 0x00 },
        { PAL_3, PAL_3, 0x00 }
    };

    for (unsigned i = 0; i < 7; i++)
    {
        for (unsigned j = 0; j < 3; j++)
        {
            // skip third byte in pole
            if (i >= 2 && j == 2) continue;
            tilemap[COORD(col + j, i)] = tiles[i][j];
            attrmap[COORD(col + j, i)] = attrs[i][j];
        }
    }

    return 2;
}

void buildBGMaps(struct Hole *hole, unsigned char * restrict tilemap, unsigned char * restrict attrmap)
{
    initBGMaps(tilemap, attrmap);

    bool isFirstPlain = true;

    // fill only plain floor tiles
    for (unsigned c = 0; c < GOLF_WIDTH;)
    {
        unsigned terrainType = (hole->terrain[c] & GOLF_TERRAIN_MASK);
        if (terrainType != GOLF_TERRAIN_PLAIN
         && terrainType != GOLF_TERRAIN_TEE_BOX
         && terrainType != GOLF_TERRAIN_ROUGH)
        {
            c++;
            continue;
        }

        unsigned len = 0;
        bool isEnd;
        
        while (true)
        {
            const unsigned terrainLen = getTerrainLength(hole->terrain, c + len);
            isEnd = (terrainLen == (unsigned)-1);

            if (isEnd)
            {
                // reached end, add remaining blocks to len
                len += GOLF_WIDTH - c;
                break;
            }
            else
            {
                len += terrainLen;

                terrainType = (hole->terrain[c + len] & GOLF_TERRAIN_MASK);
                if (terrainType != GOLF_TERRAIN_PLAIN
                 && terrainType != GOLF_TERRAIN_TEE_BOX
                 && terrainType != GOLF_TERRAIN_ROUGH)
                    break;
            }
        }

        placePlain(tilemap, attrmap, c, len, !isFirstPlain, !isEnd);
        isFirstPlain = false;
        c += len;
    }

    // iterate each row
    for (unsigned c = 0; c < GOLF_WIDTH;)
    {
        unsigned numBlocksAdded = 1;
        switch (hole->terrain[c] & GOLF_TERRAIN_MASK)
        {
            case GOLF_TERRAIN_TEE_BOX: numBlocksAdded = placeTeeBox(tilemap, attrmap, c, hole->holeXPos <= SMALL_HOLE_XTHRESHOLD); break;
            case GOLF_TERRAIN_HOLE:    numBlocksAdded = placeHole(tilemap, attrmap, c);                                       break;
            case GOLF_TERRAIN_ROUGH:   numBlocksAdded = placeRough(tilemap, attrmap, c, getTerrainLength(hole->terrain, c));  break;
            case GOLF_TERRAIN_BUNKER:  numBlocksAdded = placeBunker(tilemap, attrmap, c, getTerrainLength(hole->terrain, c)); break;
            case GOLF_TERRAIN_WATER:   numBlocksAdded = placeWater(tilemap, attrmap, c, getTerrainLength(hole->terrain, c));  break;
            case GOLF_TERRAIN_OB:      numBlocksAdded = placeOb(tilemap, attrmap, c, getTerrainLength(hole->terrain, c));     break;
            case GOLF_TERRAIN_PLAIN:   break;

            case GOLF_TERRAIN_TEE_OB:
            case GOLF_TERRAIN_END:
                fprintf(stderr, "Unexpected terrain type %i\n", hole->terrain[c]);
                exit(EXIT_FAILURE);
        }

        c += numBlocksAdded;
    }
}

void writeBGMap(unsigned char * restrict map, const char * restrict map1Filename, const char * restrict map2Filename)
{
    FILE *file1 = fopen(map1Filename, "wb");
    FILE *file2 = fopen(map2Filename, "wb");
    if (file1 == NULL || file1 == NULL)
    {
        fprintf(stderr, "Error opening file %s", (file1 == NULL) ? map1Filename : map2Filename);
        exit(EXIT_FAILURE);
    }

    // each file is split along 32 terrain tiles in width

    for (unsigned r = 0; r < GOLF_HEIGHT; r++)
    {
        fwrite(map + (r * GOLF_WIDTH) + 0,                sizeof(unsigned char), GOLF_BGMAP_WIDTH, file1);
        fwrite(map + (r * GOLF_WIDTH) + GOLF_BGMAP_WIDTH, sizeof(unsigned char), GOLF_BGMAP_WIDTH, file2);
    }

    fclose(file1);
    fclose(file2);
}

void writeBGMaps(struct Hole *hole, const char * restrict tilemap1Filename, const char * restrict tilemap2Filename, const char * restrict attrmap1Filename, const char * restrict attrmap2Filename)
{
    unsigned char *tilemap = malloc(GOLF_WIDTH * 11);
    unsigned char *attrmap = malloc(GOLF_WIDTH * 11);

    buildBGMaps(hole, tilemap, attrmap);

    writeBGMap(tilemap, tilemap1Filename, tilemap2Filename);
    writeBGMap(attrmap, attrmap1Filename, attrmap2Filename);

    free(tilemap);
    free(attrmap);
}

int main(int argc, char *argv[])
{
    if (argc == 2 && strcmp(argv[1], "-h") == 0)
    {
        usage();
        return EXIT_SUCCESS;
    }

    if (argc != 7)
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
    fclose(file);

    writeBinFile(&hole, argv[2]);
    writeBGMaps(&hole, argv[3], argv[4], argv[5], argv[6]);

    return EXIT_SUCCESS;
}
