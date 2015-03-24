#!/bin/sh

HOST=192.168.2.222
ROOT=web_asus

image=images.db
css=css.db
html=html.db
file=file.db


die () {
   echo  >&2 "$@"
   exit 1
}


updateFile() {
   db="$1"
   dir="$2"
   
   [ "$#" -eq 2 ] || die "2 arguments required, $# provided"
   [ -e "$1"    ] || die "File $1 does not exist"
   [ -d "$2"    ] || die "Directory does not exist"
   base=$(basename "$dir")

   if [ $(basename "$dir") != "html" ]; then
      cd $dir/..
      rm -rf $base
      mkdir $base && cd $base
   else
      cd $dir

      while read line
      do
         rmname=$(basename "$line" )
         rm $rmname && printf "%-8s %-14s %7s\n"  Remove $rmname [done]
      done< /storage/scripts/$db
   fi

   while read line
   do
      name=$line
      tftp -g -r $name $HOST && printf "%-24s %6s\n" $(basename "$name") [done]
   done < /storage/scripts/$db

   cd /storage/scripts/


}
begin()
{
   printf "\n\n"
   echo "================================="
   echo "#        Begin transfer         #"
   echo "================================="
   printf "\n\n"
}

begin

[ -e $PWD/$image ] && rm $PWD/$image && printf "%-8s %-14s %7s\n" "Remove" "$image" "[done]"
[ -e $PWD/$css   ] && rm $PWD/$css   && printf "%-8s %-14s %7s\n" "Remove" "$css"   "[done]"
[ -e $PWD/$html  ] && rm $PWD/$html  && printf "%-8s %-14s %7s\n" "Remove" "$html"  "[done]"
[ -e $PWD/$file  ] && rm $PWD/$file  && printf "%-8s %-14s %7s\n" "Remove" "$file"  "[done]"

tftp -g -r $ROOT/scripts/$image $HOST  && printf "%-8s %-14s %7s\n" "Copy" "$image"   "[done]"
tftp -g -r $ROOT/scripts/$css   $HOST  && printf "%-8s %-14s %7s\n" "Copy" "$css"     "[done]"
tftp -g -r $ROOT/scripts/$html  $HOST  && printf "%-8s %-14s %7s\n" "Copy" "$html"    "[done]"
tftp -g -r $ROOT/scripts/$file  $HOST  && printf "%-8s %-14s %7s\n" "Copy" "$file"    "[done]"

tftp -g -r $ROOT/scripts/update_cgi.sh $HOST && printf "%-8s %-14s %7s\n" "Copy" update_cgi.sh "[done]"


if [ -e $PWD/$image ] 
then
   printf "\n%s\n\n" "[ Begin tranfer images file to /www/html/images/ ]"
   updateFile $image /www/html/images/ 
fi


if [ -e $PWD/$css ] 
then
   printf "\n%s\n\n" "[ Begin tranfer css file to /www/html/css/ ]"
   updateFile $css   /www/html/css/ 
fi

if [ -e $PWD/$html ] 
then
   printf "\n%s\n\n" "[ Begin tranfer html file to /www/html/html/ ]"
   updateFile $html  /www/html/ 
fi

if [ -e $PWD/$file ] 
then
   printf "\n%s\n\n" "[ Begin tranfer file file to /www/html/file/ ]"
   updateFile $file  /www/html/file
fi


chmod 777 update_cgi.sh
sh update_cgi.sh
