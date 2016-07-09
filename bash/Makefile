BASEDIR := $(shell pwd)
alias   := alias.git.bash     \
           alias.dev.bash     \
           alias.common.bash  \
           alias.app.bash 

.PHONY  : clean

all: install

install:
	@echo "Installing bash settings..."
	@ln -sfr .bashrc        ${HOME}/.bashrc
	@mkdir -p ${HOME}/bash_conf 
	@for FILE in ${alias}; do                                     \
	    ln -sfr ./bash_alias/$$FILE     ${HOME}/bash_conf/$$FILE; \
	done

clean:
	@echo "Uninstalling bash settings..."
	@rm -rf ${HOME}/bash_conf
	@rm -rf ${HOME}/.bashrc

