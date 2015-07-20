#!/bin/bash

cd ../../html

# 1. Replace image to images
# sed -i 's/image/images/g' *

# 2. Replace 1 old_metaline with 2 new_metaline
    new_metaline="<script type=text\/javascript>IncJs({init:INC_COMMON_BOARD}); <\/script>"
    old_metaline="<script type=text\/javascript>IncJs({init:INC_COMMON_BOARD_PRODUCT}); <\/script>"

    # Append first
    sed -i "/$old_metaline/ a $new_metaline" *
    # then remove
    sed -i "/$old_metaline/d"                * 

