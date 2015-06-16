#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------
cd $(dirname $0)
ROOT=$(pwd)
#--------------------------------------------------------------------
# Helper functions.
#--------------------------------------------------------------------
cDir=( "$HOME/github/codeSet/c/" 
       "$HOME/Documents/test/"
       "$HOME/github/codeSet/cpp/"
      )

target=100000
lines_c=0
lines_cpp=0

log="$HOME/master.log"

for d in ${cDir[@]}; do

    temp=$(find "$d" -name  "*.c" | xargs -i cat {}  | sed '/^$/d' | sed '/^#include*/d'|  wc -l)
    lines_c=$(($temp + $lines_c))

done

for d in ${cDir[@]}; do

    temp=$(find "$d" -name  "*.cpp" | xargs -i cat {} | sed '/^$/d' | sed '/^#include*/d' | wc -l)
    lines_cpp=$(($temp + $lines_cpp))

done

percent_c=$(echo "scale=2; $lines_c*100/$target" | bc)
percent_cpp=$(echo "scale=2; $lines_cpp*100/$target" | bc)

echo "C   => $lines_c lines write, $percent_c% complete"
echo "C++ => $lines_cpp lines write, $percent_cpp% complete"
printf "\n\n"

now="$(date +'%Y/%m/%d %H:%M')"

printf "%-20s %20s %20s\n"  "$now" "C:$lines_c" "CPP:$lines_cpp"   >> "$log"
awk '{if( !a[$3]) {print; a[$3]++}}' "$log" > tmp && mv tmp "$log"

tail -n 10 "$log"
