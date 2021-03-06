# DIR[0]="./"
# DIR[1]="/usr/include/i386-linux-gnu/sys/"
# DIR[2]="/usr/include/i386-linux-gnu/bits/"
DIR=( "./")


# find /usr/include/ -maxdepth 1 -type f -name "*.[hc]" > cscope.files

for d in "${DIR[@]}"; do


    if [ -d "$d" ]; then
        find $d   -type f  -regex '.*/.*\.\(c\|cpp\|h\)$' -not -path "*/testcase/*" >> cscope.files
    fi

done           

cscope -Rbq -i cscope.files
