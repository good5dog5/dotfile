.PHONY: clean clean_bash
BASEDIR:=$(shell pwd)

VIMDIR      :=${BASEDIR}/vim
BASHDIR     :=${BASEDIR}/bash
SETUPDIR    :=${BASEDIR}/setup
BINDIR      :=${BASEDIR}/bin
CONFDIR     :=${BASEDIR}/config
SCRIPTDIR   :=${BASEDIR}/script
PACKAGEDIR  :=${BASEDIR}/PKG

BASH_ALIAS   :=${BASHDIR}/bash_alias
BASH_COMPLETE:=${BASHDIR}/bash_complete

all: install_all setup_others setup_bash setup_vim 

init:
	sh      $(SETUPDIR)/init.sh
	@cp -R  ${SCRIPTDIR}/*									${HOME}/usr/script/
	@cp -R  ${BINDIR}/stardict/*							${STARDICT_DATA_DIR}
	@ln -fs $(BINDIR)/colorgcc							    ${HOME}/usr/bin/colorgcc

conf_install:
	@ln -fs   ${CONFDIR}/gitconfig							${HOME}/.gitconfig
	@ln -fs   ${CONFDIR}/LESS_TERMCAP 						${HOME}/.LESS_TERMCAP
	@ln -fsr  ${CONFDIR}/inputrc  						    ${HOME}/.inputrc

vim_install:
	@ln -sf   ${VIMDIR}/dot.vimrc							${HOME}/.vimrc
	@ln -sf   ${VIMDIR}/dot.vimperatorrc				    ${HOME}/.vimperatorrc
	@ln -sf   ${VIMDIR}/dot.tern-project				    ${HOME}/.tern-project
	@ln -sf   ${VIMDIR}/dot.ycm_extra_conf.py				${HOME}/.ycm_extra_conf
	@ln -sf   ${VIMDIR}/dot.pentadactylrc 					${HOME}/.pentadactylrc
	@ln -sf   ${VIMDIR}/dot.ctags 							${HOME}/.ctags
	@cp -R    ${VIMDIR}/colors 								${HOME}/.vim/
	@cp -R    ${VIMDIR}/template                           	${HOME}/.vim/template/
	@mkdir -p ${HOME}/.vimperator/
	@cp -Rf   ${VIMDIR}/vimperator/*   	  					${HOME}/.vimperator/
	@bash     ${SETUPDIR}/install_vundle.sh
	

vim_clean:
	@rm 	  ${HOME}/.vimrc
	@rm 	  ${HOME}/.vimperatorrc
	@rm 	  ${HOME}/.pentadactylrc
	@rm       ${HOME}/.tern-project
	@rm   	  ${HOME}/.ycm_extra_conf
	@rm  	  ${HOME}/.ctags
	@rm -rf   ${HOME}/.vim/template 
	@rm -rf   ${HOME}/.vim/colors
	@rm -rf   ${HOME}/.vimperator/

bash_install:
	@ln -sf   ${BASHDIR}/bashrc                           ${HOME}/.bashrc
	@mkdir -p ${HOME}/bash_conf 
	@ln -sf   ${BASH_ALIAS}/alias.git.bash                ${HOME}/bash_conf/alias.git.bash
	@ln -sf   ${BASH_ALIAS}/alias.dev.bash                ${HOME}/bash_conf/alias.dev.bash
	@ln -sf   ${BASH_ALIAS}/alias.common.bash             ${HOME}/bash_conf/alias.common.bash
	@ln -sf   ${BASH_ALIAS}/alias.app.bash             	  ${HOME}/bash_conf/alias.app.bash

bash_clean:
	@rm -rf   ${HOME}/bash_conf

