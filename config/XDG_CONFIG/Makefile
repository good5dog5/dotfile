BASEDIR:=$(shell pwd)
ranger_dir   :=${XDG_CONFIG_HOME}/ranger
rtorrent_dir :=${XDG_CONFIG_HOME}/rtorrent

.PHONY: clean zathura ranger rtorrent tig tmux todo i3 Thunar
all: ranger rtorrent tmux tig zathura todo i3 Thunar


# $(call mk_symbolic_link,  soure_dir)
define mk_symbolic_link
	@mkdir -p ${XDG_CONFIG_HOME}/$(strip $1)
	@for FILE in $(shell find ./$1 -maxdepth 1 -type f ! -iname "Makefile" -printf "%f\n"); do \
		ln -sfr $(strip $1)/$$FILE  ${XDG_CONFIG_HOME}/$(strip $1)/$$FILE;                                      \
	done
endef

# $(call rm_symbolic_link,  soure_dir)
define rm_symbolic_link
	@for FILE in $(shell find ./$1 -maxdepth 1 -type f -printf "%f\n"); do \
		rm -rf ${XDG_CONFIG_HOME}/$(strip $1)/$$FILE; \
	done
endef

ranger:
	@echo "Install ranger settings..."
	$(call mk_symbolic_link, ranger)
	@cp -R   ${BASEDIR}/ranger/colorschemes   ${ranger_dir}/
ranger_clean:
	@echo "Uninstall ranger settings..."
	$(call rm_symbolic_link, ranger)

rtorrent:
	@echo "Install rtorrent settings..."
	$(call mk_symbolic_link, rtorrent)
	@mkdir -p ${rtorrent_dir}/session

tig:
	@echo "Install tig settings..."
	$(call mk_symbolic_link, tig,)
tmux:
	@echo "Install tmux settings..."
	$(call mk_symbolic_link, tmux)
zathura: 
	@echo "Install zathura settings..."
	$(call mk_symbolic_link, zathura)

todo:
	@echo "Install todo settings..."
	$(call mk_symbolic_link, todo)
i3:
	@echo "Install i3 settings..."
	$(call mk_symbolic_link, i3)
	@cp -R ./i3/i3blocks_cmd ${XDG_CONFIG_HOME}/i3/

Thunar:
	@echo "Install Thunar settings..."
	$(call mk_symbolic_link, Thunar)
	





	


