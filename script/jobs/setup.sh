#!/bin/sh

HOST=192.168.2.222
ROOT=web_edimax_smb

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
         rm $rmname && printf "%-8s %-27s %7s\n"  Remove $rmname [done]
      done< /storage/scripts/$db
   fi

   printf "\n --- \n\n" 

   while read line
   do
      name=$line
      tftp -g -r $name $HOST && printf "%-8s %-28s %6s\n" Copy $(basename "$name") [done]
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
update()
{
    [ -e $PWD/$1 ] && rm $PWD/$1       && printf "%-8s %-8s --> "   "Remove" "$1" 
    tftp -g -r $ROOT/scripts/$1 $HOST  && printf "%-8s %-8s %7s\n"  "Copy"   "$1" "[done]"
}

begin

update $image
update $css
update $html
update $file


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

update update_cgi.sh
update update_lang.sh

chmod 777 update_cgi.sh
chmod 777 update_lang.sh

sh update_cgi.sh
sh update_lang.sh

# self update
update init.sh

chmod 777 setup.sh
chmod 777 init.sh
