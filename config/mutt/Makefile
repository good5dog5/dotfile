BASEDIR := $(shell pwd)
confile := $(shell find ./ -type f ! -iname "Makefile" -printf "%f\n")

.PHONY  : clean

all: install

install:
	@echo "Installing config/mutt settings..."
	
	@mkdir -p ${HOME}/.mutt
	@for FILE in ${confile}; do \
		ln -sfr ./$$FILE ${HOME}/.mutt/$$FILE; \
	done

clean:
	@echo "Uninstalling config/mutt settings..."
	
	@for FILE in ${confile}; do \
		rm -rf ${HOME}/.mutt/$$FILE; \
	done
