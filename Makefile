.PHONY: clean 
BASEDIR:=$(shell pwd)

VIMDIR:=${BASEDIR}/vim
BASHDIR:=${BASEDIR}/bash

all: install_all setup_others setup_bash setup_vim setup_ELX_quicklink

install_all:
	sh      $(BASEDIR)/make_needed_dir.sh
	sh      $(BASEDIR)/install_vundle.sh
	sh      $(BASEDIR)/install_autojump.sh
	sh      $(BASEDIR)/install_colorgcc.sh
	sh      $(BASEDIR)/install_powerline_font.sh
	@ln -fs $(BASEDIR)/colorgcc /usr/bin

setup_others:
	@ln -fs ${BASEDIR}/tmux.conf 							   ${HOME}/.tmux.conf
	@ln -fs $(BASHDIR)/LESS_TERMCAP 						   ${HOME}/.LESS_TERMCAP 
	@ln -fs $(VIMDIR)/vimperatorrc 						   ${HOME}/.vimperatorrc
	@cp -R  ${BASEDIR}/bin/stardict/* 					   ${STARDICT_DATA_DIR}

setup_vim:
	@ln -fs $(VIMDIR)/vimrc 								   ${HOME}/.vimrc
	@ln -fs $(VIMDIR)/colors/ir_black.vim 				   ${HOME}/.vim/colors/ir_black.vim
	@ln -fs $(VIMDIR)/colors/jellybeans.vim 			   ${HOME}/.vim/colors/jellybeans.vim
	@ln -fs $(VIMDIR)/.ycm_extra_conf.py 				   ${HOME}/.vim/
	@cp -r  $(VIMDIR)/template/          				   ${HOME}/.vim/

setup_bash:
	@ln -fs ${BASHDIR}/bashrc 								   ${HOME}/.bashrc
	@ln -fs ${BASHDIR}/bash_aliases 						   ${HOME}/.bash_aliases


setup_ELX_quicklink:
	@ln -s  ${HOME}/Documents/Edimax/ELX/ 			 		${HOME}/ELX
	@ln -s  ${HOME}/Documents/Edimax/ELX/APPS/web/ 		${HOME}/eweb
