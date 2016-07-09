BASEDIR := $(shell pwd)
confile := .vimrc              \
           .vimperatorrc       \
           .tern-project       \
           .ycm_extra_conf.py  \
           .pentadactylrc .ctags
.PHONY : clean

all: install
install: 
	@echo "Installing vim settings..."
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@for FILE in ${confile}; do                       \
	    ln -sfr ./$$FILE ${HOME}/$$FILE;              \
	done
	@cp -R    ./colors                                      ${HOME}/.vim/
	@cp -R    ./template                                    ${HOME}/.vim/
	@cp -R    ./.vimperator/                                ${HOME}/

clean:
	@echo "Uninstalling vim settings..."
	@for FILE in ${confile}; do               \
	    rm -rf ${HOME}/$$FILE;                \
	done
	@rm -rf   ${HOME}/.vim/template 
	@rm -rf   ${HOME}/.vim/colors
	@rm -rf   ${HOME}/.vimperator/

