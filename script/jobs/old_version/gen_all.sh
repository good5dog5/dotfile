#!/bin/bash

ROOT=/tftpboot/web_hawking
all_dir=("image" "css" "html" "file" )

shopt -s nullglob


for dir in "${all_dir[@]}"; do

   db=$dir.db
   [ -e $PWD/$db ]      && rm $PWD/$db
   [ -d $ROOT/$dir/ ]   && tmp=($ROOT/$dir/*)
   [ ${#tmp[a]} -gt 0 ] && ./gen_file_list.sh $ROOT/$dir/ > $PWD/$db
done


