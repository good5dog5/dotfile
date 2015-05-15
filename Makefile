.PHONY: clean clean_bash
BASEDIR:=$(shell pwd)

VIMDIR   :=${BASEDIR}/vim
BASHDIR  :=${BASEDIR}/bash
SETUPDIR :=${BASEDIR}/setup
BINDIR   :=${BASEDIR}/bin
CONFDIR  :=${BASEDIR}/conf
SCRIPTDIR:=${BASEDIR}/script

all: install_all setup_others setup_bash setup_vim setup_ELX_quicklink

install_all:
	sh      $(SETUPDIR)/init.sh
	sh      $(SETUPDIR)/install_vundle.sh
	sh      $(SETUPDIR)/install_autojump.sh
	sh      $(SETUPDIR)/install_powerline_font.sh

setup_others:
	@ln -fs ${CONFDIR}/tmux.conf							${HOME}/.tmux.conf
	@ln -fs ${CONFDIR}/gitconfig							${HOME}/.gitconfig
	@ln -fs ${CONFDIR}/LESS_TERMCAP 						${HOME}/.LESS_TERMCAP
	@cp -R  ${BINDIR}/stardict/*							${STARDICT_DATA_DIR}
	@ln -fs $(BINDIR)/colorgcc								${HOME}/usr/bin
	@cp -R  ${SCRIPTDIR}/*									${HOME}/usr/script/

setup_vim:
	@ln -sfr ${VIMDIR}/dot.vimrc							${HOME}/.vimrc
	@ln -sfr ${VIMDIR}/dot.vimperatorrc						${HOME}/.vimperatorrc
	@ln -sfr ${VIMDIR}/dot.tern-project						${HOME}/.tern-project
	@ln -sfr ${VIMDIR}/dot.ycm_extra_conf.py				${HOME}/.ycm_extra_conf
	@ln -sfr ${VIMDIR}/dot.pentadactylrc 					${HOME}/.pentadactylrc
	@ln -sfr ${VIMDIR}/dot.ctags 							${HOME}/.ctags
	@cp -R   ${VIMDIR}/colors/ 							${HOME}/.vim/

clean_vim:
	@rm 	  ${HOME}/.vimrc
	@rm 	  ${HOME}/.vimperatorrc
	@rm 	  ${HOME}/.pentadactylrc
	@rm       ${HOME}/.tern-project
	@rm   	  ${HOME}/.ycm_extra_conf
	@rm  	  ${HOME}/.ctags
	@rm -rf   ${HOME}/.vim/template 
	@rm -rf   ${HOME}/.vim/colors

setup_bash:
	@ln -sf   ${BASHDIR}/bashrc                             ${HOME}/.bashrc
	@mkdir -p ${HOME}/bash_conf && cp ${BASHDIR}/conf/* ${HOME}/bash_conf

clean_bash:
	@rm -rf   ${HOME}/bash_conf

setup_elx:
	@ln -fs   ${HOME}/Documents/Edimax/ELX/					${HOME}/ELX
	@ln -fs   ${HOME}/Documents/Edimax/ELX/APPS/web/			${HOME}/eweb
	@sudo cp -r ${SCRIPTDIR}/jobs/*							/tftpboot/scripts/
