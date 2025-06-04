#ifndef __GOLFPATCH_H
#define __GOLFPATCH_H

#include "golf.h"
#include <stdlib.h>

typedef struct PatchByte
{
    unsigned      x;
    unsigned      y;
    unsigned char b;
} PatchByte;

#define SIZEOF_TILEPATCH_00_2 3
PatchByte tilePatch_00_2[SIZEOF_TILEPATCH_00_2] = {
	{ 14,  5, TILE_PLAIN_1_TOP },
	{ 15,  5, TILE_PLAIN_2_TOP },
	{ 16,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_02_1 2
PatchByte tilePatch_02_1[SIZEOF_TILEPATCH_02_1] = {
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 18,  5, TILE_PLAIN_2_TOP },
};

#define SIZEOF_TILEPATCH_02_2 9
PatchByte tilePatch_02_2[SIZEOF_TILEPATCH_02_2] = {
	{  6,  5, TILE_PLAIN_1_TOP },
	{  7,  5, TILE_PLAIN_2_TOP },
	{ 23,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_WATER_2_TOP },
	{ 30,  5, TILE_WATER_1_TOP },
	{ 31,  5, TILE_WATER_2_TOP },
	{ 29,  6, TILE_LAVA_2 },
	{ 30,  6, TILE_LAVA_1 },
	{ 31,  6, TILE_LAVA_2 },
};

#define SIZEOF_TILEPATCH_03_1 5
PatchByte tilePatch_03_1[SIZEOF_TILEPATCH_03_1] = {
	{ 20,  5, TILE_PLAIN_2_TOP },
	{ 21,  5, TILE_PLAIN_SHADOW_1 },
	{ 22,  5, TILE_PLAIN_SHADOW_2 },
	{ 23,  5, TILE_PLAIN_SHADOW_1 },
	{ 24,  5, TILE_PLAIN_SHADOW_2 },
};

#define SIZEOF_TILEPATCH_03_2 1
PatchByte tilePatch_03_2[SIZEOF_TILEPATCH_03_2] = {
	{  9,  5, TILE_PLAIN_2_TOP },
};

#define SIZEOF_TILEPATCH_04_1 7
PatchByte tilePatch_04_1[SIZEOF_TILEPATCH_04_1] = {
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 19,  5, TILE_PLAIN_1_TOP },
	{ 21,  5, TILE_PLAIN_1_TOP },
	{ 23,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_1_TOP },
	{ 27,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_04_2 9
PatchByte tilePatch_04_2[SIZEOF_TILEPATCH_04_2] = {
	{  1,  5, TILE_PLAIN_1_TOP },
	{  3,  5, TILE_PLAIN_1_TOP },
	{  5,  5, TILE_PLAIN_1_TOP },
	{  7,  5, TILE_PLAIN_1_TOP },
	{  9,  5, TILE_PLAIN_1_TOP },
	{ 11,  5, TILE_PLAIN_1_TOP },
	{ 13,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_2_TOP },
	{ 25,  6, TILE_PLAIN_BOTTOM },
};

#define SIZEOF_TILEPATCH_05_1 12
PatchByte tilePatch_05_1[SIZEOF_TILEPATCH_05_1] = {
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 16,  5, TILE_PLAIN_2_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 18,  5, TILE_PLAIN_2_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_PLAIN_2_TOP },
	{ 30,  5, TILE_PLAIN_1_TOP },
	{ 31,  5, TILE_PLAIN_2_TOP },
	{ 20,  6, TILE_WATER_3_BOTTOM },
	{ 21,  6, TILE_WATER_4_BOTTOM },
	{ 24,  6, TILE_WATER_3_BOTTOM },
	{ 25,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_05_2 23
PatchByte tilePatch_05_2[SIZEOF_TILEPATCH_05_2] = {
	{  0,  5, TILE_PLAIN_1_TOP },
	{ 17,  5, TILE_PLAIN_2_TOP },
	{ 18,  5, TILE_PLAIN_1_TOP },
	{ 19,  5, TILE_PLAIN_2_TOP },
	{ 20,  5, TILE_PLAIN_1_TOP },
	{ 21,  5, TILE_PLAIN_2_TOP },
	{ 22,  5, TILE_PLAIN_1_TOP },
	{ 23,  5, TILE_PLAIN_2_TOP },
	{ 24,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_2_TOP },
	{ 26,  5, TILE_PLAIN_1_TOP },
	{ 27,  5, TILE_PLAIN_2_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_PLAIN_2_TOP },
	{ 30,  5, TILE_PLAIN_1_TOP },
	{ 31,  5, TILE_PLAIN_2_TOP },
	{  2,  6, TILE_WATER_3_BOTTOM },
	{  3,  6, TILE_WATER_4_BOTTOM },
	{  6,  6, TILE_WATER_3_BOTTOM },
	{  7,  6, TILE_WATER_4_BOTTOM },
	{ 10,  6, TILE_WATER_3_BOTTOM },
	{ 11,  6, TILE_WATER_4_BOTTOM },
	{ 17,  6, TILE_PLAIN_BOTTOM },
};

#define SIZEOF_TILEPATCH_06_1 11
PatchByte tilePatch_06_1[SIZEOF_TILEPATCH_06_1] = {
	{ 23,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_PLAIN_2_TOP },
	{ 30,  5, TILE_PLAIN_1_TOP },
	{ 31,  5, TILE_PLAIN_2_TOP },
	{ 14,  6, TILE_WATER_3_BOTTOM },
	{ 15,  6, TILE_WATER_4_BOTTOM },
	{ 18,  6, TILE_WATER_3_BOTTOM },
	{ 19,  6, TILE_WATER_4_BOTTOM },
	{ 25,  6, TILE_WATER_3_BOTTOM },
	{ 26,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_06_2 2
PatchByte tilePatch_06_2[SIZEOF_TILEPATCH_06_2] = {
	{  0,  5, TILE_PLAIN_1_TOP },
	{  2,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_07_1 5
PatchByte tilePatch_07_1[SIZEOF_TILEPATCH_07_1] = {
	{ 13,  5, TILE_PLAIN_1_TOP },
	{ 22,  6, TILE_WATER_3_BOTTOM },
	{ 23,  6, TILE_WATER_4_BOTTOM },
	{ 26,  6, TILE_WATER_3_BOTTOM },
	{ 27,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_07_2 2
PatchByte tilePatch_07_2[SIZEOF_TILEPATCH_07_2] = {
	{  1,  6, TILE_WATER_3_BOTTOM },
	{  2,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_09_1 11
PatchByte tilePatch_09_1[SIZEOF_TILEPATCH_09_1] = {
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_PLAIN_2_TOP },
	{ 30,  5, TILE_PLAIN_1_TOP },
	{ 31,  5, TILE_PLAIN_2_TOP },
	{ 17,  6, TILE_WATER_3_BOTTOM },
	{ 18,  6, TILE_WATER_4_BOTTOM },
	{ 21,  6, TILE_WATER_3_BOTTOM },
	{ 22,  6, TILE_WATER_4_BOTTOM },
	{ 25,  6, TILE_WATER_3_BOTTOM },
	{ 26,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_09_2 17
PatchByte tilePatch_09_2[SIZEOF_TILEPATCH_09_2] = {
	{  0,  5, TILE_PLAIN_1_TOP },
    {  2,  5, TILE_PLAIN_SHADOW_1 },
    {  3,  5, TILE_PLAIN_SHADOW_2 },
    {  4,  5, TILE_PLAIN_SHADOW_1 },
    {  5,  5, TILE_PLAIN_SHADOW_2 },
    {  6,  5, TILE_PLAIN_SHADOW_1 },
    {  7,  5, TILE_PLAIN_SHADOW_2 },
    {  8,  5, TILE_PLAIN_SHADOW_1 },
    {  9,  5, TILE_PLAIN_SHADOW_2 },
	{ 10,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_2_TOP },
	{ 26,  5, TILE_PLAIN_1_TOP },
	{ 12,  6, TILE_WATER_3_BOTTOM },
	{ 13,  6, TILE_WATER_4_BOTTOM },
	{ 16,  6, TILE_WATER_3_BOTTOM },
	{ 17,  6, TILE_WATER_4_BOTTOM },
	{ 25,  6, TILE_PLAIN_BOTTOM },
};

#define SIZEOF_TILEPATCH_10_1 5
PatchByte tilePatch_10_1[SIZEOF_TILEPATCH_10_1] = {
	{ 27,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_PLAIN_2_TOP },
    { 29,  5, TILE_PLAIN_SHADOW_1 },
    { 30,  5, TILE_PLAIN_SHADOW_2 },
    { 31,  5, TILE_PLAIN_SHADOW_1 },
};

#define SIZEOF_TILEPATCH_10_2 1
PatchByte tilePatch_10_2[SIZEOF_TILEPATCH_10_2] = {
	{  3,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_11_1 8
PatchByte tilePatch_11_1[SIZEOF_TILEPATCH_11_1] = {
	{ 13,  5, TILE_PLAIN_SHADOW_1 },
    { 14,  5, TILE_PLAIN_SHADOW_2 },
    { 15,  5, TILE_PLAIN_SHADOW_1 },
    { 16,  5, TILE_PLAIN_SHADOW_2 },
	{ 19,  5, TILE_PLAIN_1_TOP },
	{ 26,  5, TILE_PLAIN_1_TOP },
	{ 27,  5, TILE_PLAIN_2_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_11_2 2
PatchByte tilePatch_11_2[SIZEOF_TILEPATCH_11_2] = {
	{ 14,  5, TILE_PLAIN_2_TOP },
	{ 15,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_12_1 2
PatchByte tilePatch_12_1[SIZEOF_TILEPATCH_12_1] = {
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_12_2 15
PatchByte tilePatch_12_2[SIZEOF_TILEPATCH_12_2] = {
	{  7,  5, TILE_PLAIN_1_TOP },
	{  9,  5, TILE_PLAIN_1_TOP },
	{ 11,  5, TILE_PLAIN_1_TOP },
	{ 13,  5, TILE_PLAIN_1_TOP },
	{ 15,  5, TILE_PLAIN_1_TOP },
    { 16,  5, TILE_PLAIN_SHADOW_2 },
    { 17,  5, TILE_PLAIN_SHADOW_1 },
    { 18,  5, TILE_PLAIN_SHADOW_2 },
    { 19,  5, TILE_PLAIN_SHADOW_1 },
    { 20,  5, TILE_PLAIN_SHADOW_2 },
    { 21,  5, TILE_PLAIN_SHADOW_1 },
	{ 25,  5, TILE_PLAIN_2_TOP },
	{ 31,  5, TILE_WATER_2_TOP },
	{ 25,  6, TILE_PLAIN_BOTTOM },
	{ 31,  6, TILE_LAVA_2 },
};

#define SIZEOF_TILEPATCH_13_1 5
PatchByte tilePatch_13_1[SIZEOF_TILEPATCH_13_1] = {
	{ 27,  5, TILE_PLAIN_SHADOW_1 },
    { 28,  5, TILE_PLAIN_SHADOW_2 },
    { 29,  5, TILE_PLAIN_SHADOW_1 },
    { 30,  5, TILE_PLAIN_SHADOW_2 },
    { 31,  5, TILE_PLAIN_SHADOW_1 },
};

#define SIZEOF_TILEPATCH_13_2 5
PatchByte tilePatch_13_2[SIZEOF_TILEPATCH_13_2] = {
    {  0,  5, TILE_PLAIN_SHADOW_2 },
    {  1,  5, TILE_PLAIN_SHADOW_1 },
    {  2,  5, TILE_PLAIN_SHADOW_2 },
    {  3,  5, TILE_PLAIN_SHADOW_1 },
};

#define SIZEOF_TILEPATCH_14_1 2
PatchByte tilePatch_14_1[SIZEOF_TILEPATCH_14_1] = {
	{ 18,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_14_2 16
PatchByte tilePatch_14_2[SIZEOF_TILEPATCH_14_2] = {
	{  6,  5, TILE_PLAIN_1_TOP },
	{ 16,  5, TILE_PLAIN_1_TOP },
	{ 19,  5, TILE_WATER_2_TOP },
	{ 20,  5, TILE_WATER_1_TOP },
	{ 21,  5, TILE_WATER_2_TOP },
	{ 22,  5, TILE_WATER_1_TOP },
	{ 23,  5, TILE_WATER_2_TOP },
	{ 24,  5, TILE_WATER_1_TOP },
	{ 25,  5, TILE_WATER_2_TOP },
	{ 19,  6, TILE_WATER_2_BOTTOM },
	{ 20,  6, TILE_WATER_3_BOTTOM },
	{ 21,  6, TILE_WATER_4_BOTTOM },
	{ 22,  6, TILE_WATER_1_BOTTOM },
	{ 23,  6, TILE_WATER_2_BOTTOM },
	{ 24,  6, TILE_WATER_3_BOTTOM },
	{ 25,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_15_1 13
PatchByte tilePatch_15_1[SIZEOF_TILEPATCH_15_1] = {
	{ 22,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_WATER_2_TOP },
	{ 30,  5, TILE_WATER_1_TOP },
	{ 31,  5, TILE_WATER_2_TOP },
	{ 13,  6, TILE_WATER_3_BOTTOM },
	{ 14,  6, TILE_WATER_4_BOTTOM },
	{ 17,  6, TILE_WATER_3_BOTTOM },
	{ 18,  6, TILE_WATER_4_BOTTOM },
	{ 25,  6, TILE_WATER_3_BOTTOM },
	{ 26,  6, TILE_WATER_4_BOTTOM },
	{ 29,  6, TILE_LAVA_2 },
	{ 30,  6, TILE_LAVA_1 },
	{ 31,  6, TILE_LAVA_2 },
};

#define SIZEOF_TILEPATCH_15_2 27
PatchByte tilePatch_15_2[SIZEOF_TILEPATCH_15_2] = {
	{ 12,  4, TILE_COL0 },
	{  0,  5, TILE_WATER_1_TOP },
	{  1,  5, TILE_WATER_2_TOP },
	{  2,  5, TILE_WATER_1_TOP },
	{  3,  5, TILE_WATER_2_TOP },
	{  4,  5, TILE_WATER_1_TOP },
	{  5,  5, TILE_WATER_2_TOP },
	{  6,  5, TILE_WATER_1_TOP },
	{  7,  5, TILE_WATER_2_TOP },
	{  8,  5, TILE_WATER_1_TOP },
	{  9,  5, TILE_WATER_2_TOP },
	{ 10,  5, TILE_WATER_1_TOP },
	{ 11,  5, TILE_WATER_2_TOP },
	{ 13,  5, TILE_PLAIN_1_TOP },
	{ 15,  5, TILE_PLAIN_1_TOP },
	{  0,  6, TILE_LAVA_1 },
	{  1,  6, TILE_LAVA_2 },
	{  2,  6, TILE_LAVA_1 },
	{  3,  6, TILE_LAVA_2 },
	{  4,  6, TILE_LAVA_1 },
	{  5,  6, TILE_LAVA_2 },
	{  6,  6, TILE_LAVA_1 },
	{  7,  6, TILE_LAVA_2 },
	{  8,  6, TILE_LAVA_1 },
	{  9,  6, TILE_LAVA_2 },
	{ 10,  6, TILE_LAVA_1 },
	{ 11,  6, TILE_LAVA_2 },
};

#define SIZEOF_TILEPATCH_16_1 8
PatchByte tilePatch_16_1[SIZEOF_TILEPATCH_16_1] = {
	{ 16,  6, TILE_WATER_3_BOTTOM },
	{ 17,  6, TILE_WATER_4_BOTTOM },
	{ 20,  6, TILE_WATER_3_BOTTOM },
	{ 21,  6, TILE_WATER_4_BOTTOM },
	{ 24,  6, TILE_WATER_3_BOTTOM },
	{ 25,  6, TILE_WATER_4_BOTTOM },
	{ 28,  6, TILE_WATER_3_BOTTOM },
	{ 29,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_16_2 31
PatchByte tilePatch_16_2[SIZEOF_TILEPATCH_16_2] = {
	{  3,  5, TILE_PLAIN_1_TOP },
	{  4,  5, TILE_PLAIN_2_TOP },
	{  5,  5, TILE_PLAIN_1_TOP },
	{  6,  5, TILE_PLAIN_2_TOP },
	{  7,  5, TILE_PLAIN_1_TOP },
	{  8,  5, TILE_PLAIN_2_TOP },
	{  9,  5, TILE_PLAIN_1_TOP },
	{ 10,  5, TILE_PLAIN_2_TOP },
	{ 11,  5, TILE_PLAIN_1_TOP },
	{ 12,  5, TILE_PLAIN_2_TOP },
	{ 13,  5, TILE_PLAIN_1_TOP },
	{ 14,  5, TILE_PLAIN_2_TOP },
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 16,  5, TILE_PLAIN_2_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 18,  5, TILE_PLAIN_2_TOP },
	{ 19,  5, TILE_PLAIN_1_TOP },
	{ 20,  5, TILE_PLAIN_2_TOP },
	{ 21,  5, TILE_PLAIN_1_TOP },
	{ 22,  5, TILE_PLAIN_2_TOP },
	{ 23,  5, TILE_PLAIN_1_TOP },
	{ 24,  5, TILE_PLAIN_2_TOP },
	{ 25,  5, TILE_PLAIN_1_TOP },
	{ 26,  5, TILE_PLAIN_2_TOP },
	{ 27,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_PLAIN_2_TOP },
	{ 29,  5, TILE_PLAIN_1_TOP },
	{ 30,  5, TILE_PLAIN_2_TOP },
	{ 31,  5, TILE_PLAIN_1_TOP },
	{  0,  6, TILE_WATER_3_BOTTOM },
	{  1,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_17_1 3
PatchByte tilePatch_17_1[SIZEOF_TILEPATCH_17_1] = {
	{ 15,  5, TILE_PLAIN_1_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 29,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_17_2 1
PatchByte tilePatch_17_2[SIZEOF_TILEPATCH_17_2] = {
	{  7,  5, TILE_PLAIN_1_TOP },
};

#define SIZEOF_TILEPATCH_18_1 3
PatchByte tilePatch_18_1[SIZEOF_TILEPATCH_18_1] = {
	{ 23,  5, TILE_PLAIN_1_TOP },
	{ 25,  6, TILE_WATER_3_BOTTOM },
	{ 26,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_18_2 5
PatchByte tilePatch_18_2[SIZEOF_TILEPATCH_18_2] = {
	{  8,  4, TILE_OB_SIGN },
	{  9,  6, TILE_WATER_3_BOTTOM },
	{ 10,  6, TILE_WATER_4_BOTTOM },
	{ 13,  6, TILE_WATER_3_BOTTOM },
	{ 14,  6, TILE_WATER_4_BOTTOM },
};

#define SIZEOF_TILEPATCH_19_1 10
PatchByte tilePatch_19_1[SIZEOF_TILEPATCH_19_1] = {
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_1_TOP },
	{ 28,  5, TILE_WATER_2_TOP },
	{ 29,  5, TILE_WATER_1_TOP },
	{ 30,  5, TILE_WATER_2_TOP },
	{ 31,  5, TILE_WATER_1_TOP },
	{ 28,  6, TILE_LAVA_2 },
	{ 29,  6, TILE_LAVA_1 },
	{ 30,  6, TILE_LAVA_2 },
	{ 31,  6, TILE_LAVA_1 },
};

#define SIZEOF_TILEPATCH_19_2 6
PatchByte tilePatch_19_2[SIZEOF_TILEPATCH_19_2] = {
	{  1,  5, TILE_PLAIN_1_TOP },
	{  9,  5, TILE_PLAIN_1_TOP },
	{ 17,  5, TILE_PLAIN_1_TOP },
	{ 25,  5, TILE_PLAIN_1_TOP },
	{ 31,  5, TILE_WATER_2_TOP },
	{ 31,  6, TILE_LAVA_2 },
};

#define SIZEOF_ATTRPATCH_00_1 2
PatchByte attrPatch_00_1[SIZEOF_ATTRPATCH_00_1] = {
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_00_2 7
PatchByte attrPatch_00_2[SIZEOF_ATTRPATCH_00_2] = {
	{  2,  3, PAL_0 | 0x10 },
	{  3,  6, PAL_4 },
	{  4,  6, PAL_4 },
	{  5,  6, PAL_4 },
	{  6,  6, PAL_4 },
	{  7,  6, PAL_4 },
	{  8,  6, PAL_4 },
};

#define SIZEOF_ATTRPATCH_01_1 23
PatchByte attrPatch_01_1[SIZEOF_ATTRPATCH_01_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 22,  1, PAL_0 | 0x10 },
	{ 23,  1, PAL_0 | 0x10 },
	{ 24,  1, PAL_0 | 0x10 },
	{ 22,  2, PAL_0 | 0x10 },
	{ 23,  2, PAL_0 | 0x10 },
	{ 24,  2, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 22,  3, PAL_0 | 0x10 },
	{ 23,  3, PAL_0 | 0x10 },
	{ 24,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 22,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 24,  4, PAL_0 | 0x10 },
	{ 15,  6, PAL_4 },
	{ 16,  6, PAL_4 },
	{ 17,  6, PAL_4 },
	{ 18,  6, PAL_4 },
	{ 19,  6, PAL_4 },
	{ 20,  6, PAL_4 },
};

#define SIZEOF_ATTRPATCH_01_2 4
PatchByte attrPatch_01_2[SIZEOF_ATTRPATCH_01_2] = {
	{  2,  3, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{  2,  4, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_02_1 8
PatchByte attrPatch_02_1[SIZEOF_ATTRPATCH_02_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_02_2 8
PatchByte attrPatch_02_2[SIZEOF_ATTRPATCH_02_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{ 21,  0, PAL_0 | 0x10 },
	{ 21,  1, PAL_0 | 0x10 },
	{ 21,  2, PAL_0 | 0x10 },
	{ 21,  3, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_03_1 14
PatchByte attrPatch_03_1[SIZEOF_ATTRPATCH_03_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 25,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_03_2 20
PatchByte attrPatch_03_2[SIZEOF_ATTRPATCH_03_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{  8,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_04_1 15
PatchByte attrPatch_04_1[SIZEOF_ATTRPATCH_04_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_04_2 12
PatchByte attrPatch_04_2[SIZEOF_ATTRPATCH_04_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_05_1 14
PatchByte attrPatch_05_1[SIZEOF_ATTRPATCH_05_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_05_2 23
PatchByte attrPatch_05_2[SIZEOF_ATTRPATCH_05_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  1,  2, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  1,  3, PAL_0 | 0x10 },
	{  5,  3, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{ 11,  3, PAL_0 | 0x10 },
	{  4,  4, PAL_0 | 0x10 },
	{  5,  4, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_06_1 15
PatchByte attrPatch_06_1[SIZEOF_ATTRPATCH_06_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_06_2 20
PatchByte attrPatch_06_2[SIZEOF_ATTRPATCH_06_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{  8,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_07_1 13
PatchByte attrPatch_07_1[SIZEOF_ATTRPATCH_07_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_07_2 18
PatchByte attrPatch_07_2[SIZEOF_ATTRPATCH_07_2] = {
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{  8,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_08_1 19
PatchByte attrPatch_08_1[SIZEOF_ATTRPATCH_08_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 12,  3, PAL_0 | 0x10 },
	{ 14,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 12,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 18,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
	{  5,  5, PAL_1 },
	{  5,  6, PAL_1 },
};

#define SIZEOF_ATTRPATCH_08_2 20
PatchByte attrPatch_08_2[SIZEOF_ATTRPATCH_08_2] = {
	{  4,  0, PAL_0 | 0x10 },
	{  5,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{ 10,  0, PAL_0 | 0x10 },
	{  4,  1, PAL_0 | 0x10 },
	{  5,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{ 10,  1, PAL_0 | 0x10 },
	{  4,  2, PAL_0 | 0x10 },
	{  5,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{ 10,  2, PAL_0 | 0x10 },
	{  4,  3, PAL_0 | 0x10 },
	{  5,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{  4,  4, PAL_0 | 0x10 },
	{  5,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_09_1 15
PatchByte attrPatch_09_1[SIZEOF_ATTRPATCH_09_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_09_2 13
PatchByte attrPatch_09_2[SIZEOF_ATTRPATCH_09_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_10_1 32
PatchByte attrPatch_10_1[SIZEOF_ATTRPATCH_10_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 22,  1, PAL_0 | 0x10 },
	{ 23,  1, PAL_0 | 0x10 },
	{ 24,  1, PAL_0 | 0x10 },
	{ 26,  1, PAL_0 | 0x10 },
	{ 27,  1, PAL_0 | 0x10 },
	{ 29,  1, PAL_0 | 0x10 },
	{ 30,  1, PAL_0 | 0x10 },
	{ 22,  2, PAL_0 | 0x10 },
	{ 23,  2, PAL_0 | 0x10 },
	{ 24,  2, PAL_0 | 0x10 },
	{ 26,  2, PAL_0 | 0x10 },
	{ 27,  2, PAL_0 | 0x10 },
	{ 29,  2, PAL_0 | 0x10 },
	{ 30,  2, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 22,  3, PAL_0 | 0x10 },
	{ 23,  3, PAL_0 | 0x10 },
	{ 24,  3, PAL_0 | 0x10 },
	{ 26,  3, PAL_0 | 0x10 },
	{ 27,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 15,  4, PAL_0 | 0x10 },
	{ 16,  4, PAL_0 | 0x10 },
	{ 27,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_11_1 14
PatchByte attrPatch_11_1[SIZEOF_ATTRPATCH_11_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 24,  4, PAL_2 | BGF_PRI },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_11_2 16
PatchByte attrPatch_11_2[SIZEOF_ATTRPATCH_11_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_12_1 15
PatchByte attrPatch_12_1[SIZEOF_ATTRPATCH_12_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_12_2 12
PatchByte attrPatch_12_2[SIZEOF_ATTRPATCH_12_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_13_1 15
PatchByte attrPatch_13_1[SIZEOF_ATTRPATCH_13_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  6, PAL_1 },
	{ 27,  6, PAL_1 },
};

#define SIZEOF_ATTRPATCH_13_2 18
PatchByte attrPatch_13_2[SIZEOF_ATTRPATCH_13_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  5,  2, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  5,  3, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_14_1 14
PatchByte attrPatch_14_1[SIZEOF_ATTRPATCH_14_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 27,  4, PAL_0 | 0x10 },
	{ 30,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_14_2 12
PatchByte attrPatch_14_2[SIZEOF_ATTRPATCH_14_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_15_1 15
PatchByte attrPatch_15_1[SIZEOF_ATTRPATCH_15_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_15_2 25
PatchByte attrPatch_15_2[SIZEOF_ATTRPATCH_15_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  4,  4, PAL_0 | 0x10 },
	{  5,  4, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{  8,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
	{ 12,  4, PAL_2 },
	{ 18,  4, PAL_2 | BGF_PRI },
	{ 19,  4, PAL_2 | BGF_PRI },
};

#define SIZEOF_ATTRPATCH_16_1 17
PatchByte attrPatch_16_1[SIZEOF_ATTRPATCH_16_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 16,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 24,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 28,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
	{  5,  5, PAL_1 },
	{  5,  6, PAL_1 },
};

#define SIZEOF_ATTRPATCH_17_1 15
PatchByte attrPatch_17_1[SIZEOF_ATTRPATCH_17_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_0 | 0x10 },
	{ 17,  4, PAL_0 | 0x10 },
	{ 20,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_17_2 12
PatchByte attrPatch_17_2[SIZEOF_ATTRPATCH_17_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_18_1 12
PatchByte attrPatch_18_1[SIZEOF_ATTRPATCH_18_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_0 | 0x10 },
	{ 29,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_18_2 18
PatchByte attrPatch_18_2[SIZEOF_ATTRPATCH_18_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  8,  4, PAL_3 | BGF_PRI },
	{  9,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_19_1 22
PatchByte attrPatch_19_1[SIZEOF_ATTRPATCH_19_1] = {
	{ 22,  0, PAL_0 | 0x10 },
	{ 23,  0, PAL_0 | 0x10 },
	{ 24,  0, PAL_0 | 0x10 },
	{ 26,  0, PAL_0 | 0x10 },
	{ 27,  0, PAL_0 | 0x10 },
	{ 29,  0, PAL_0 | 0x10 },
	{ 30,  0, PAL_0 | 0x10 },
	{ 10,  3, PAL_0 | 0x10 },
	{ 10,  4, PAL_0 | 0x10 },
	{ 12,  4, PAL_2 | BGF_PRI },
	{ 13,  4, PAL_0 | 0x10 },
	{ 14,  4, PAL_2 | BGF_PRI },
	{ 15,  4, PAL_2 | BGF_PRI },
	{ 17,  4, PAL_2 | BGF_PRI },
	{ 18,  4, PAL_2 | BGF_PRI },
	{ 20,  4, PAL_2 | BGF_PRI },
	{ 21,  4, PAL_2 | BGF_PRI },
	{ 22,  4, PAL_0 | 0x10 },
	{ 23,  4, PAL_2 | BGF_PRI },
	{ 25,  4, PAL_0 | 0x10 },
	{ 26,  4, PAL_2 | BGF_PRI },
	{ 28,  4, PAL_0 | 0x10 },
};

#define SIZEOF_ATTRPATCH_19_2 34
PatchByte attrPatch_19_2[SIZEOF_ATTRPATCH_19_2] = {
	{  6,  0, PAL_0 | 0x10 },
	{  7,  0, PAL_0 | 0x10 },
	{  8,  0, PAL_0 | 0x10 },
	{  9,  0, PAL_0 | 0x10 },
	{  6,  1, PAL_0 | 0x10 },
	{  7,  1, PAL_0 | 0x10 },
	{  8,  1, PAL_0 | 0x10 },
	{  9,  1, PAL_0 | 0x10 },
	{  6,  2, PAL_0 | 0x10 },
	{  7,  2, PAL_0 | 0x10 },
	{  8,  2, PAL_0 | 0x10 },
	{  9,  2, PAL_0 | 0x10 },
	{  6,  3, PAL_0 | 0x10 },
	{  7,  3, PAL_0 | 0x10 },
	{  8,  3, PAL_0 | 0x10 },
	{  9,  3, PAL_0 | 0x10 },
	{  1,  4, PAL_2 | BGF_PRI },
	{  2,  4, PAL_2 | BGF_PRI },
	{  4,  4, PAL_0 | 0x10 },
	{  5,  4, PAL_0 | 0x10 },
	{  6,  4, PAL_0 | 0x10 },
	{  7,  4, PAL_0 | 0x10 },
	{  9,  4, PAL_0 | 0x10 },
	{ 10,  4, PAL_2 | BGF_PRI },
	{ 12,  4, PAL_2 | BGF_PRI },
	{ 13,  4, PAL_2 | BGF_PRI },
	{ 14,  4, PAL_2 | BGF_PRI },
	{ 15,  4, PAL_2 | BGF_PRI },
	{ 17,  4, PAL_2 | BGF_PRI },
	{ 18,  4, PAL_2 | BGF_PRI },
	{ 20,  4, PAL_2 | BGF_PRI },
	{ 21,  4, PAL_2 | BGF_PRI },
	{ 22,  4, PAL_2 | BGF_PRI },
	{ 23,  4, PAL_2 | BGF_PRI },
};

PatchByte *patches[20][4] = {
    { NULL,           tilePatch_00_2, attrPatch_00_1, attrPatch_00_2 },
    { NULL,           NULL,           attrPatch_01_1, attrPatch_01_2 },
    { tilePatch_02_1, tilePatch_02_2, attrPatch_02_1, attrPatch_02_2 },
    { tilePatch_03_1, tilePatch_03_2, attrPatch_03_1, attrPatch_03_2 },
    { tilePatch_04_1, tilePatch_04_2, attrPatch_04_1, attrPatch_04_2 },
    { tilePatch_05_1, tilePatch_05_2, attrPatch_05_1, attrPatch_05_2 },
    { tilePatch_06_1, tilePatch_06_2, attrPatch_06_1, attrPatch_06_2 },
    { tilePatch_07_1, tilePatch_07_2, attrPatch_07_1, attrPatch_07_2 },
    { NULL,           NULL,           attrPatch_08_1, attrPatch_08_2 },
    { tilePatch_09_1, tilePatch_09_2, attrPatch_09_1, attrPatch_09_2 },
    { tilePatch_10_1, tilePatch_10_2, attrPatch_10_1, NULL           },
    { tilePatch_11_1, tilePatch_11_2, attrPatch_11_1, attrPatch_11_2 },
    { tilePatch_12_1, tilePatch_12_2, attrPatch_12_1, attrPatch_12_2 },
    { tilePatch_13_1, tilePatch_13_2, attrPatch_13_1, attrPatch_13_2 },
    { tilePatch_14_1, tilePatch_14_2, attrPatch_14_1, attrPatch_14_2 },
    { tilePatch_15_1, tilePatch_15_2, attrPatch_15_1, attrPatch_15_2 },
    { tilePatch_16_1, tilePatch_16_2, attrPatch_16_1, NULL           },
    { tilePatch_17_1, tilePatch_17_2, attrPatch_17_1, attrPatch_17_2 },
    { tilePatch_18_1, tilePatch_18_2, attrPatch_18_1, attrPatch_18_2 },
    { tilePatch_19_1, tilePatch_19_2, attrPatch_19_1, attrPatch_19_2 },
};

unsigned char patchSizes[20][4] = {
    { 0,                     SIZEOF_TILEPATCH_00_2, SIZEOF_ATTRPATCH_00_1, SIZEOF_ATTRPATCH_00_2 },
    { 0,                     0,                     SIZEOF_ATTRPATCH_01_1, SIZEOF_ATTRPATCH_01_2 },
    { SIZEOF_TILEPATCH_02_1, SIZEOF_TILEPATCH_02_2, SIZEOF_ATTRPATCH_02_1, SIZEOF_ATTRPATCH_02_2 },
    { SIZEOF_TILEPATCH_03_1, SIZEOF_TILEPATCH_03_2, SIZEOF_ATTRPATCH_03_1, SIZEOF_ATTRPATCH_03_2 },
    { SIZEOF_TILEPATCH_04_1, SIZEOF_TILEPATCH_04_2, SIZEOF_ATTRPATCH_04_1, SIZEOF_ATTRPATCH_04_2 },
    { SIZEOF_TILEPATCH_05_1, SIZEOF_TILEPATCH_05_2, SIZEOF_ATTRPATCH_05_1, SIZEOF_ATTRPATCH_05_2 },
    { SIZEOF_TILEPATCH_06_1, SIZEOF_TILEPATCH_06_2, SIZEOF_ATTRPATCH_06_1, SIZEOF_ATTRPATCH_06_2 },
    { SIZEOF_TILEPATCH_07_1, SIZEOF_TILEPATCH_07_2, SIZEOF_ATTRPATCH_07_1, SIZEOF_ATTRPATCH_07_2 },
    { 0,                     0,                     SIZEOF_ATTRPATCH_08_1, SIZEOF_ATTRPATCH_08_2 },
    { SIZEOF_TILEPATCH_09_1, SIZEOF_TILEPATCH_09_2, SIZEOF_ATTRPATCH_09_1, SIZEOF_ATTRPATCH_09_2 },
    { SIZEOF_TILEPATCH_10_1, SIZEOF_TILEPATCH_10_2, SIZEOF_ATTRPATCH_10_1, 0                     },
    { SIZEOF_TILEPATCH_11_1, SIZEOF_TILEPATCH_11_2, SIZEOF_ATTRPATCH_11_1, SIZEOF_ATTRPATCH_11_2 },
    { SIZEOF_TILEPATCH_12_1, SIZEOF_TILEPATCH_12_2, SIZEOF_ATTRPATCH_12_1, SIZEOF_ATTRPATCH_12_2 },
    { SIZEOF_TILEPATCH_13_1, SIZEOF_TILEPATCH_13_2, SIZEOF_ATTRPATCH_13_1, SIZEOF_ATTRPATCH_13_2 },
    { SIZEOF_TILEPATCH_14_1, SIZEOF_TILEPATCH_14_2, SIZEOF_ATTRPATCH_14_1, SIZEOF_ATTRPATCH_14_2 },
    { SIZEOF_TILEPATCH_15_1, SIZEOF_TILEPATCH_15_2, SIZEOF_ATTRPATCH_15_1, SIZEOF_ATTRPATCH_15_2 },
    { SIZEOF_TILEPATCH_16_1, SIZEOF_TILEPATCH_16_2, SIZEOF_ATTRPATCH_16_1, 0                     },
    { SIZEOF_TILEPATCH_17_1, SIZEOF_TILEPATCH_17_2, SIZEOF_ATTRPATCH_17_1, SIZEOF_ATTRPATCH_17_2 },
    { SIZEOF_TILEPATCH_18_1, SIZEOF_TILEPATCH_18_2, SIZEOF_ATTRPATCH_18_1, SIZEOF_ATTRPATCH_18_2 },
    { SIZEOF_TILEPATCH_19_1, SIZEOF_TILEPATCH_19_2, SIZEOF_ATTRPATCH_19_1, SIZEOF_ATTRPATCH_19_2 },
};

#endif // __GOLFPATCH_H
