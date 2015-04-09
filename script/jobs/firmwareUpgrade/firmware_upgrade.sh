#!/bin/sh

set_hw_id="board_config set hw_id 010e0012"
set_mode="opmode.sh 0"
get_mode="opmode.sh r"

$set_hw_id

fupb "" &&
echo "fupb done"

fupf AIRLIVE-7476HPC && 
echo "fupf done"

fupi AIRLIVE-7476HPC &&
echo "fupi done"

   
$set_mode


if [ -e /storage/dbox* ]; then
   echo "Remove dbox"
   rm /storage/dbox*
fi

$get_mode
reboot


#fupb "" &&
#echo "fupb done"
