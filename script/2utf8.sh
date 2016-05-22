#!/usr/bin/env bash

if [ $# -lt 1 ]
then
  echo "Use: "$0" <file_name>"
  echo "Convert files from ISO-8859-1 to UTF8"
  exit
fi

for i in $*
do
  if [ ! -f $i ]; then # Only convert text files
    continue
  fi
  # Generate temp file to avoid Bus error
  iconv -f ISO-8859-1 -t utf-8 $i -o $i.tmp
  mv $i.tmp $i
done
