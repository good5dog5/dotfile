#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------

multilanguage="/tftpboot/web_elecom/js/multilanguage.var"
ukjs="/tftpboot/web_elecom/lang/basic/uk.js"
jpjs="/tftpboot/web_elecom/lang/basic/jp.js"

count=1

line=$(cat $multilanguage | wc -l)

# Find First Array name
while [ $count -lt $line ];do

    # Find Arrary name
    arrayName=$(sed -n "$count,$line {/var [a-zA-Z]*/{p;q;}}" $multilanguage | awk -F' ' '{print $2}' | awk -F'=' '{print $1}')
    
    [ -z $arrayName ] && break

    matchNum=$(sed -n "$count,$line {/$arrayName/{=; q;}}" $multilanguage)

    uk_matchNum=$((matchNum + 2))
    js_matchNum=$((matchNum + 3))

    uk_text=$(sed -n "$uk_matchNum{p;q;}" $multilanguage)
    js_text=$(sed -n "$js_matchNum{p;q;}" $multilanguage)

    escaped_text=$(echo $uk_text | sed -e 's/[&.\\/]/\\&/g')

    num=$(sed -n "/$escaped_text/{=; q;}" $ukjs)

    
    if [ "$num" > 1 ];then
        # Found text in uk.js
        
        numSub2=$((num - 2))
        sed -i "s/dw(\"\<$arrayName\>\"/writeText($numSub2/g" ../../html/*
    else
        # Not find, need to append text in the bottom of uk.js

        #totalLine=$(cat $ukjs | wc -l)
        totalLine=$(cat $jpjs | wc -l)
        insertLine=$(($totalLine - 1))
        lineNum=$((insertLine - 2))

        echo $uk_text
        js_escapeText=$(echo $js_text | sed -e 's/["]/\\&/g')
        uk_escapeText=$(echo $uk_text | sed -e 's/["]/\\&/g')

        sed -i "${insertLine} i $js_escapeText" $jpjs
        sed -i "${insertLine} i $uk_escapeText" $ukjs
        #sed -i "s/showMenu(\<$arrayName\>/showMenu($lineNum/g" ../html/*
        
    fi


    count=$(($count + 5))
    echo $count
done

