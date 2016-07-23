BASEDIR:=$(shell pwd)

VIMDIR      :=${BASEDIR}/vim
BASHDIR     :=${BASEDIR}/bash
SETUPDIR    :=${BASEDIR}/setup
BINDIR      :=${BASEDIR}/bin
CONFDIR     :=${BASEDIR}/config
SCRIPTDIR   :=${BASEDIR}/script
PACKAGEDIR  :=${BASEDIR}/PKG

.PHONY: clean bash_clean conf_clean vim_clean

all: init conf_install vim_install bash_install

init:
	bash      $(SETUPDIR)/init.sh

conf_install:
	@$(MAKE) -C $(CONFDIR) install
conf_clean:
	@$(MAKE) -C $(CONFDIR) clean

vim_install:
	@$(MAKE) -C $(VIMDIR) install
vim_clean:
	@$(MAKE) -C $(VIMDIR) clean

bash_install:
	@$(MAKE) -C $(BASHDIR) install
	@cp -R  ${SCRIPTDIR}/*							      ${HOME}/usr/script/
bash_clean:
	@$(MAKE) -C $(BASHDIR) clean

clean: bash_clean conf_clean vim_clean
