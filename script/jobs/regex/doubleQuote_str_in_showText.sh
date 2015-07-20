#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------
files="/tftpboot/web_elecom/html/*"

ls $files | xargs sed -i "s/showText(*/showText(\"/g" {}
ls $files | xargs sed -i "s/showText(\"[a-zA-Z]*/&\"/g" {}
