DIR[0]="./"
DIR[1]="/usr/include/i386-linux-gnu/sys/"
DIR[2]="/usr/include/i386-linux-gnu/bits/"

cscopeFile="cscope.files"

[ -e "$cscopeFile" ] && rm $cscopeFile

find /usr/include/ -maxdepth 1 -type f -name "*.[hc]" >> $cscopeFile

for d in "${DIR[@]}"; do

    if [ -d "$d" ]; then
       find $d                                 \
           -path "./boards" -prune -o -print   \
           -name "*.[hc]" -o -name "*.cpp"     \
           >> $cscopeFile
    fi

done           
#cscope -Rbq -i cscope.files
