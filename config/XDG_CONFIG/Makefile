BASEDIR:=$(shell pwd)
zathura_dir:=${XDG_CONFIG_HOME}/zathura
ranger_dir :=${XDG_CONFIG_HOME}/test

.PHONY: zathura ranger

all: zathura ranger

zathura: 
	@test -d ${zathura_dir} || mkdir 		 ${zathura_dir} 
	@ln -sf  ${BASEDIR}/zathura/zathurarc    ${zathura_dir}/zathurarc
ranger:
	@test -d ${ranger_dir} || mkdir  		 ${ranger_dir} 
	@ln -sf  ${BASEDIR}/ranger/scope.sh   	 ${ranger_dir}/scope.sh
	@ln -sf  ${BASEDIR}/ranger/rifle.conf 	 ${ranger_dir}/rifle.conf
	@ln -sf  ${BASEDIR}/ranger/rc.conf 	 	 ${ranger_dir}/rc.conf
	@cp -R   ${BASEDIR}/ranger/colorschemes  ${ranger_dir}/


	


