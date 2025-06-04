#ifndef __GOLF_H
#define __GOLF_H

#define GOLF_WIDTH  64
#define GOLF_HEIGHT 11

#define COORD(x, y) ((x) + (y) * GOLF_WIDTH)

const unsigned GOLF_BGMAP_WIDTH = 32;

// constant values according to constants/golf_constants.asm

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

const unsigned char GOLF_TERRAIN_MASK = 0x0f;

const unsigned HOLE_LENGTH    = 2;
const unsigned TEE_BOX_LENGTH = 7;
const unsigned SMALL_HOLE_XTHRESHOLD = 640;

struct Hole
{
    unsigned char terrain[GOLF_WIDTH];
    unsigned char par;
    unsigned holeXPos;
    unsigned char waterSpawn1;
    unsigned char waterSpawn2;
};

// constants for tile indices

enum Tiles
{
    TILE_COL0,
    TILE_COL1,
    TILE_COL2,
    TILE_COL3,

    TILE_PLAIN_1_TOP,
    TILE_PLAIN_2_TOP,

    TILE_TEE_BOX_1,
    TILE_TEE_BOX_2,
    TILE_TEE_BOX_3,

    TILE_TEE_SIGN,

    TILE_PLAIN_RIGHT_EDGE_TOP,
    TILE_HOLE_LEFT_TOP,
    TILE_HOLE_RIGHT_TOP,
    TILE_PLAIN_LEFT_EDGE_TOP,
    TILE_SAND_1_TOP,
    TILE_SAND_2_TOP,

    TILE_PLAIN_BOTTOM = 0x14,
    TILE_BUSH_1_TOP,
    TILE_BUSH_2_TOP,

    TILE_OB_SIGN = 0x19,

    TILE_PLAIN_RIGHT_EDGE_BOTTOM,
    TILE_HOLE_LEFT_BOTTOM,
    TILE_HOLE_RIGHT_BOTTOM,
    TILE_PLAIN_LEFT_EDGE_BOTTOM,
    TILE_SAND_1_MIDDLE,
    TILE_SAND_2_MIDDLE,

    TILE_BUSH_EDGE = 0x24,
    TILE_BUSH_1_BOTTOM,
    TILE_BUSH_2_BOTTOM,

    TILE_PLAIN_PILLAR_TOP = 0x2a,
    TILE_SAND_1_BOTTOM = 0x2e,
    TILE_SAND_2_BOTTOM,

    TILE_CLOUD_CORNER,

    TILE_PLAIN_SHADOW_1 = 0x35,
    TILE_PLAIN_SHADOW_2,

    TILE_PLAIN_PILLAR_BOTTOM = 0x3a,
    TILE_FLAG_POLE_1_TOP,

    TILE_TEE_OB_TOP = 0x3d,
    TILE_TEE_OB_EDGE_TOP,

    TILE_WATER_1_TOP = 0x45,
    TILE_WATER_2_TOP,
    TILE_LAVA_1,
    TILE_LAVA_2,

    TILE_FLAG_POLE_2_TOP = 0x4b,

    TILE_TEE_OB_BOTTOM = 0x4d,
    TILE_TEE_OB_EDGE_BOTTOM,

    TILE_WATER_1_BOTTOM = 0x55,
    TILE_WATER_2_BOTTOM,
    TILE_WATER_3_BOTTOM,
    TILE_WATER_4_BOTTOM,

    TILE_FLAG_POLE_LEFT = 0x5b,
    TILE_FLAG_POLE_RIGHT,

    TILE_FLAG_1 = 0x74,
    TILE_FLAG_2,
    TILE_FLAG_3,
    TILE_FLAG_4,
};

// constants for tile attributes

enum Palettes
{
    PAL_0,
    PAL_1,
    PAL_2,
    PAL_3,
    PAL_4,
    PAL_5,
    PAL_6,
    PAL_7,
};

enum Attributes
{
    BGB_BANK1 = 3,
    BGB_XFLIP = 5,
    BGB_YFLIP,
    BGB_PRI
};

const unsigned char BGF_BANK1 = 1 << BGB_BANK1;
const unsigned char BGF_XFLIP = 1 << BGB_XFLIP;
const unsigned char BGF_YFLIP = 1 << BGB_YFLIP;
const unsigned char BGF_PRI   = 1 << BGB_PRI;

#endif // __GOLF_H
