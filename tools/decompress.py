import os
import argparse

parser = argparse.ArgumentParser(description='Parse palette data.')
parser.add_argument('filenames', metavar='filenames', type=str, nargs='+',
                    help='filename of compressed data')

args = parser.parse_args()

for filename in args.filenames:
    source = bytearray(open(filename, 'rb').read())
    output = []
    pos = 0

    while (True):
        if (pos >= len(source)):
            break

        cmdByte = source[pos]

        pos += 1
        length = cmdByte & 0b01111111
        if (cmdByte & 0b10000000 != 0):
            output.extend(source[pos : pos + length])
            pos += length
        else:
            for x in range(length):
                output.append(source[pos])
            pos += 1

    with open(os.path.splitext(filename)[0], 'wb') as outFile:
        outFile.write(bytes(output))
