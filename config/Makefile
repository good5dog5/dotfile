BASEDIR := $(shell pwd)
confile := .bcrc           \
           .gdbinit        \
           .Xresources     \
           .xprofile       \
           .xinitrc        \
           .inputrc        \
           .gitconfig      \
           .LESS_TERMCAP   \
		   .xmodmaprc

.PHONY  : clean

all: install

install:
	@echo "Installing config settings..."
	@for FILE in ${confile}; do           \
	    ln -sfr ./$$FILE  ${HOME}/$$FILE; \
	done
	@ln -fsr ./mimeapps.list  ${HOME}/.local/share/applications/mimeapps.list
	@ln -sfr ./colorgcc       ${HOME}/usr/bin/colorgcc
	@mkdir -p ${HOME}/.cgdb
	@ln -sfr ./cgdb/cgdbrc    ${HOME}/.cgdb/cgdbrc
	@ln -sfr ./ssh/ssh_config ${HOME}/.ssh/config
	
	@$(MAKE) -C ./mutt install

clean:
	@echo "Uninstalling config settings..."
	@for FILE in ${confile}; do           \
	    rm -rf  ${HOME}/$$FILE;           \
	done
	@rm -rf ${HOME}/.local/share/applications/mimeapps.list
	@rm -rf ${HOME}/usr/bin/colorgcc
	@rm -rf ${HOME}/.cgdb/cgdbrc
	
	@$(MAKE) -C ./mutt clean




