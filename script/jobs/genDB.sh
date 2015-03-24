#!/bin/bash

ROOT=/tftpboot/web_edimax_smb
all_dir=("css" "file" "html" "images" )

die() {
   echo >&2 "$@"
   exit 1
}
genDB() {
   
   [ "$#" -eq 1 ] || die "1 argument required, $# provided"
   [ -d "$1" ]    || die "Directory $1 does not exist"
#--------------------------------------------------------------------
# Print out all files and cut leading "/tftpboot".
# Because tftp use /tftpboot as root directory and should not be presented
#--------------------------------------------------------------------
   find $1 -maxdepth 1  -type f -not -path "$1.git/*" | cut -d '/' -f 3-
}


shopt -s nullglob

for dir in "${all_dir[@]}"; do

   db=$dir.db

   [ -e $ROOT/scripts/$db ]   && rm $ROOT/scripts/$db

   if [ -d $ROOT/$dir/ ]; then

        tmp=($ROOT/$dir/*)

        if [ ${#tmp[a]} -gt 0 ]; then 
            genDB $ROOT/$dir/ > $ROOT/scripts/$db
        fi
    fi
done


