#!/bin/bash
TODIR=/home/jordan/Documents/Edimax/ELX/APPS/web/web_asus/
ROOTDIR=/tftpboot/web_asus

each=("css" "file" "html" "images" );

for s in "${each[@]}"; do

   if [ "$s" == "html" ]; then
      find $ROOTDIR/$s -maxdepth 1 -type f | xargs -i cp {} $TODIR

   else
      find $ROOTDIR/$s -maxdepth 1 -type f | xargs -i cp {} $TODIR/$s/
   fi
done



