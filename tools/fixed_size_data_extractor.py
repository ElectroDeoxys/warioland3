import argparse
import mmap
from math import floor as floor

parser = argparse.ArgumentParser(description='Extracts data of fixed size.')
parser.add_argument('offsets', metavar='offsets', type=str, nargs='+',
                    help='start offset(s) of the data')
parser.add_argument('-s', metavar='suffix', dest='suffix', type=str, nargs=1, default=[],
                    help='suffix for output file names')
parser.add_argument('-n', metavar='size', dest='size', type=int, nargs=1, default=[1],
                    help='size of the data')

args = parser.parse_args()

def getByteString(offset, len):
    with open('baserom.gbc') as rom:
        romMap = mmap.mmap(rom.fileno(), 0, access=mmap.ACCESS_READ)
        return romMap[offset : offset + len]

def getFormattedOffset(offset):
    return '{:0x}'.format(offset)

def outputData(offset, filename):
    with open(filename + '.bin', 'wb') as outFile:
        outFile.write(getByteString(offset, args.size[0]))

n = 1
for offsetStr in args.offsets:
    offset = int(offsetStr, 16)
    filename = 'data_' + getFormattedOffset(offset)
    if (args.suffix):
        filename = args.suffix[0]
        if (len(args.offsets) > 1):
            filename = filename + str(n)
    outputData(offset, filename)
    n += 1
