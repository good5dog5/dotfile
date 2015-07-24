.PHONY: clean clean_bash
BASEDIR:=$(shell pwd)

VIMDIR   :=${BASEDIR}/vim
BASHDIR  :=${BASEDIR}/bash
SETUPDIR :=${BASEDIR}/setup
BINDIR   :=${BASEDIR}/bin
CONFDIR  :=${BASEDIR}/conf
SCRIPTDIR:=${BASEDIR}/script
EMACSDIR :=${BASEDIR}/emacs

all: install_all setup_others setup_bash setup_vim setup_ELX_quicklink

all_install:
	sh      $(SETUPDIR)/init.sh
	sh      $(SETUPDIR)/install_vundle.sh
	sh      $(SETUPDIR)/install_autojump.sh
	sh      $(SETUPDIR)/install_powerline_font.sh

others_install:
	@ln -fs   ${CONFDIR}/tmux.conf							${HOME}/.tmux.conf
	@ln -fs   ${CONFDIR}/gitconfig							${HOME}/.gitconfig
	@ln -fs   ${CONFDIR}/LESS_TERMCAP 						${HOME}/.LESS_TERMCAP
	@cp -R    ${BINDIR}/stardict/*							${STARDICT_DATA_DIR}
	@ln -fs   $(BINDIR)/colorgcc							${HOME}/usr/bin
	@cp -R    ${SCRIPTDIR}/*								${HOME}/usr/script/
	@ln -fsr ./pkglist  								    ${HOME}/.pkglist

emace_install:
	@ln -sfr  ${EMACSDIR}/init.el 							${HOME}/.emacs.d/init.el

vim_install:
	@ln -sfr  ${VIMDIR}/dot.vimrc							${HOME}/.vimrc
	@ln -sfr  ${VIMDIR}/dot.vimperatorrc				    ${HOME}/.vimperatorrc
	@ln -sfr  ${VIMDIR}/dot.tern-project				    ${HOME}/.tern-project
	@ln -sfr  ${VIMDIR}/dot.ycm_extra_conf.py				${HOME}/.ycm_extra_conf
	@ln -sfr  ${VIMDIR}/dot.pentadactylrc 					${HOME}/.pentadactylrc
	@ln -sfr  ${VIMDIR}/dot.ctags 							${HOME}/.ctags
	@cp -R    ${VIMDIR}/colors 								${HOME}/.vim/
	@cp -R    ${VIMDIR}/template                           	${HOME}/.vim/template/
	@mkdir -p ${HOME}/.vimperator/
	@cp -Rf   ${VIMDIR}/vimperator/*   	  					${HOME}/.vimperator/

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
	@ln -sf   ${BASHDIR}/bashrc                             ${HOME}/.bashrc
	@mkdir -p ${HOME}/bash_conf 
	@ln -sf   ${BASHDIR}/conf/alias.git.bash                ${HOME}/bash_conf/alias.git.bash
	@ln -sf   ${BASHDIR}/conf/alias.dev.bash                ${HOME}/bash_conf/alias.dev.bash
	@ln -sf   ${BASHDIR}/conf/alias.common.bash             ${HOME}/bash_conf/alias.common.bash

bash_clean:
	@rm -rf   ${HOME}/bash_conf

elx_install:
	@ln -fs   ${HOME}/Documents/Edimax/ELX/					${HOME}/ELX
	@ln -fs   ${HOME}/Documents/Edimax/ELX/APPS/web/			${HOME}/eweb
	@sudo cp -r ${SCRIPTDIR}/jobs/*							/tftpboot/scripts/
