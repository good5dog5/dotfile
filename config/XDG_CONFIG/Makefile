BASEDIR:=$(shell pwd)
ranger_dir   :=${XDG_CONFIG_HOME}/ranger
rtorrent_dir :=${XDG_CONFIG_HOME}/rtorrent
tig_dir      :=${XDG_CONFIG_HOME}/tig
tmux_dir     :=${XDG_CONFIG_HOME}/tmux
zathura_dir  :=${XDG_CONFIG_HOME}/zathura
todo_dir     :=${XDG_CONFIG_HOME}/todo

.PHONY: clean zathura ranger rtorrent tig tmux todo

all: ranger rtorrent tmux tig zathura todo

ranger:
	@test -d ${ranger_dir} || mkdir  		  ${ranger_dir} 
	@ln -sf  ${BASEDIR}/ranger/scope.sh   	  ${ranger_dir}/scope.sh
	@ln -sf  ${BASEDIR}/ranger/rifle.conf 	  ${ranger_dir}/rifle.conf
	@ln -sf  ${BASEDIR}/ranger/rc.conf 	 	  ${ranger_dir}/rc.conf
	@cp -R   ${BASEDIR}/ranger/colorschemes   ${ranger_dir}/
rtorrent:
	@test -d ${rtorrent_dir} || mkdir  		  ${rtorrent_dir} 
	@test -d ${rtorrent_dir}/session || mkdir ${rtorrent_dir}/session 
	@ln -sf  ${BASEDIR}/rtorrent/rtorrent.rc  ${rtorrent_dir}/rtorrent.rc
tig:
	@test -d ${tig_dir} || mkdir  		  	  ${tig_dir} 
	@ln -sf  ${BASEDIR}/tig/tigrc             ${tig_dir}/tigrc
tmux:
	@test -d ${tmux_dir} || mkdir  		  	  ${tmux_dir} 
	@ln -sf  ${BASEDIR}/tmux/tmux.conf        ${tmux_dir}/tmux.conf
zathura: 
	@test -d ${zathura_dir} || mkdir 		  ${zathura_dir} 
	@ln -sf  ${BASEDIR}/zathura/zathurarc     ${zathura_dir}/zathurarc

todo:
	@test -d ${todo_dir} || mkdir 		  	  ${todo_dir} 
	@ln -sf  ${BASEDIR}/todo/todo.cfg     	  ${todo_dir}/todo.cfg



	


