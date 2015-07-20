#!/bin/bash

cd ../html

# 1. Replace image to images
# sed -i 's/image/images/g' *

# 2. Replace 1 old_metaline with 2 new_metaline
    new_metaline="<script type="text/javascript" src="incjs.htm"></script>\n<script type="text/javascript">IncJs({init:INC_COMMON_BOARD_PRODUCT}); </script>"
    old_metaline="jquery\-1\.3\.2"

    # Append first
    sed -i "/$old_metaline/ a $new_metaline" *
    # then remove
    sed -i "/$old_metaline/d"                * 

# 3.Remve line contain
#   1)set.css
#   2)javascript.js
#   3)multilanguage.var

sed -i "/\(set\.css\|javascript\.js\|multilanguage\.var\)/d" *

# 4. Replace dw to showMenu

sed -i "s/dw(/showMenu(/g" *
