#!/usr/bin/python
import os
import sys
import itertools
import linecache
from subprocess import call

lang_dir="./basic"

class fileObject:
    def __init__(self, line, name):
        self.line = line
        self.name = name

    def show(self):
        print self.line, self.name

    def set(self, line, name):
        self.line = line
        self.name = name

maxfile= fileObject(-1, "")
minfile= fileObject(sys.maxint, "")
Files=[]
diff = []


def find_diff():

    for filename in os.listdir(lang_dir):
        with open(os.path.join(lang_dir, filename), "r") as f:

            lines = f.read().count("\n")
            Files.append(fileObject(lines, f.name))

            if maxfile.line < lines:
                maxfile.set(lines, f.name)

            if minfile.line > lines:
                minfile.set(lines, f.name)

    with open((maxfile.name), "r") as f:
        for line in itertools.islice(f, minfile.line-2, maxfile.line):
             diff.append(line)

def append_to_equal():

    for langFile in Files:

        if langFile.name == maxfile.name:
            continue

        newFile = []

        i = langFile.line - 2;
        with open(langFile.name, "r") as f:
            while i > 0:
                newFile.append(f.readline())
                i = i-1

        for num in range(0, maxfile.line - minfile.line + 2):
            newFile.append(diff[num])

        with open(langFile.name, "w") as f:
            for line in newFile:
                f.write(line)


find_diff()
append_to_equal()

