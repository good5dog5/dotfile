.PHONY: clean 
BASEDIR:=$(shell pwd)

VIMDIR   :=${BASEDIR}/vim
BASHDIR  :=${BASEDIR}/bash
SETUPDIR :=${BASEDIR}/setup
BINDIR   :=${BASEDIR}/bin
CONFDIR  :=${BASEDIR}/conf
SCRIPTDIR:=${BASEDIR}/script

all: install_all setup_others setup_bash setup_vim setup_ELX_quicklink

install_all:
	sh      $(SETUPDIR)/make_needed_dir.sh
	sh      $(SETUPDIR)/install_vundle.sh
	sh      $(SETUPDIR)/install_autojump.sh
	#bash      $(SETUPDIR)/install_colorgcc.sh
	sh      $(SETUPDIR)/install_powerline_font.sh

setup_others:
	@ln -fs ${CONFDIR}/tmux.conf 							${HOME}/.tmux.conf
	@cp -R  ${BINDIR}/stardict/* 					   		${STARDICT_DATA_DIR}
	@ln -fs $(BINDIR)/colorgcc 								${HOME}/usr/bin
	@ln -fs ${CONFDIR}/gitconfig							${HOME}/.gitconfig
	#@ln -fs ${CONFDIR}/inputrc								${HOME}/.inputrc
	@cp -R  ${SCRIPTDIR}/*									${HOME}/usr/script/

setup_vim:
	@ln -fs $(VIMDIR)/vimrc 							    ${HOME}/.vimrc
	@ln -fs $(VIMDIR)/colors/ir_black.vim 				    ${HOME}/.vim/colors/ir_black.vim
	@ln -fs $(VIMDIR)/colors/jellybeans.vim 			    ${HOME}/.vim/colors/jellybeans.vim
	@ln -fs $(VIMDIR)/.ycm_extra_conf.py 				    ${HOME}/.vim/
	@ln -fs $(VIMDIR)/vimperatorrc 						    ${HOME}/.vimperatorrc
	@ln -fs $(VIMDIR)/pentadactylrc 						    ${HOME}/.pentadactylrc
	@cp -r  $(VIMDIR)/template/          				    ${HOME}/.vim/

setup_bash:
	@ln -fs ${BASHDIR}/bashrc 								${HOME}/.bashrc
	@ln -fs ${BASHDIR}/bash_aliases 						${HOME}/.bash_aliases
	@ln -fs $(BASHDIR)/LESS_TERMCAP 						${HOME}/.LESS_TERMCAP 

setup_elx:
	@ln -fs  ${HOME}/Documents/Edimax/ELX/ 			 		${HOME}/ELX
	@ln -fs  ${HOME}/Documents/Edimax/ELX/APPS/web/ 		    ${HOME}/eweb
	@sudo cp -r ${SCRIPTDIR}/jobs/* 						/tftpboot/scripts/
