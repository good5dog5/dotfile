#!/bin/bash
die () {
   echo >&2 "$@"
   exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

[ -d "$1" ] || die "Directory $1 does not exist$"

#Print out all file of $1, specified directory, with absolute path -> cut the "tftpboot"
#Because tftf ust /tftpboot as root directory and should not be presented
#find $1  -type f| grep -v "\/.git\/"  | cut -d '/' -f 3-
find $1 -maxdepth 1  -type f -not -path "$1.git/*" | cut -d '/' -f 3-

