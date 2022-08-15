import sys

sourceFile = sys.argv[1]
destFile = sys.argv[2]

f = open(destFile, "w")
f.write("Test!")
f.close()