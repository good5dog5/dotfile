#!/bin/sh
DEST_FOLDER=~/usr

if [ ! -d $DEST_FOLDER ];
then
	git clone https://github.com/joelthelion/autojump.git $DEST_FOLDER/autojump
	cd $DEST_FOLDER/autojump

	chmod +x install.py 
	./install.py
fi

