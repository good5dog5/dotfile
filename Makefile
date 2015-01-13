BASEDIR:=$(shell pwd)

VIMDIR:=${BASEDIR}/vim
BASHDIR:=${BASEDIR}/bash

init:
	ln -fs ${BASHDIR}/bashrc ${HOME}/.bashrc
	ln -fs ${BASHDIR}/bash_aliases ${HOME}/.bash_aliases
	ln -fs ${BASEDIR}/tmux.conf ${HOME}/.tmux.conf
	ln -fs $(BASHDIR)/LESS_TERMCAP ${HOME}/.LESS_TERMCAP 
	ln -fs $(VIMDIR)/vimrc ${HOME}/.vimrc
	ln -fs $(VIMDIR)/ir_black.vim ${HOME}/.vim/colors/ir_black.vim
	ln -fs $(VIMDIR)/jellybeans.vim ${HOME}/.vim/colors/jellybeans.vim
	ln -fs $(VIMDIR)/.ycm_extra_conf.py ${HOME}/.vim/
	ln -fs $(VIMDIR)/vimperatorrc ${HOME}/.vimperatorrc
	cp -R  ${BASEDIR}/bin/stardict/* ${HOME}/.stardict/dic



install:
	$(BASEDIR)/make_needed_dir.sh
	$(BASEDIR)/install_vundle.sh
	$(BASEDIR)/install_autojump.sh
	$(BASEDIR)/install_colorgcc.sh
	$(BASEDIR)/install_powerline_font.sh
	ln -fs $(BASEDIR)/colorgcc /usr/bin
