BASEDIR:=$(shell pwd)

init:
	ln -fs ${BASEDIR}/bashrc ${HOME}/.bashrc
	ln -fs ${BASEDIR}/bash_aliases ${HOME}/.bash_aliases
	ln -fs ${BASEDIR}/tmux.conf ${HOME}/.tmux.conf
	ln -fs $(BASEDIR)/vimrc ${HOME}/.vimrc
	cp -r  $(BASEDIR)/ir_black.vim ${HOME}/.vim/colors/ir_black.vim

install:
	$(BASEDIR)/install_vundle.sh
	$(BASEDIR)/install_autojump.sh
