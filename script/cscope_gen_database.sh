DIR[0]="./"
DIR[1]="/usr/include/i386-linux-gnu/sys/"
DIR[2]="/usr/include/i386-linux-gnu/bits/"

[ ! -d $cscope_dir ] && mkdir $cscope_dir

find /usr/include/ -maxdepth 1 -type f -name "*.[hc]" >> cscope.files

for d in "${DIR[@]}"; do

    if [ -d "$d" ]; then
       find $d -type f -name "*.[hc]" -o -name "*.cpp" >> cscope.files
    fi

done           

cscope -Rbq -i cscope.files
