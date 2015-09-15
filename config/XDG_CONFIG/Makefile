BASEDIR:=$(shell pwd)
zathura_dir  :=${XDG_CONFIG_HOME}/zathura
ranger_dir   :=${XDG_CONFIG_HOME}/ranger
rtorrent_dir :=${XDG_CONFIG_HOME}/rtorrent

.PHONY: clean zathura ranger rtorrent

all: zathura ranger rtorrent

zathura: 
	@test -d ${zathura_dir} || mkdir 		 ${zathura_dir} 
	@ln -sf  ${BASEDIR}/zathura/zathurarc    ${zathura_dir}/zathurarc
ranger:
	@test -d ${ranger_dir} || mkdir  		 ${ranger_dir} 
	@ln -sf  ${BASEDIR}/ranger/scope.sh   	 ${ranger_dir}/scope.sh
	@ln -sf  ${BASEDIR}/ranger/rifle.conf 	 ${ranger_dir}/rifle.conf
	@ln -sf  ${BASEDIR}/ranger/rc.conf 	 	 ${ranger_dir}/rc.conf
	@cp -R   ${BASEDIR}/ranger/colorschemes  ${ranger_dir}/
rtorrent:
	@test -d ${rtorrent_dir} || mkdir  		  ${rtorrent_dir} 
	@test -d ${rtorrent_dir}/session || mkdir ${rtorrent_dir}/session 
	@ln -sf  ${BASEDIR}/rtorrent/rtorrent.rc ${rtorrent_dir}/rtorrent.rc


	


