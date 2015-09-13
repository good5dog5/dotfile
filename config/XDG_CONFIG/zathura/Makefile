zathura_dir:=${XDG_CONFIG_HOME}/zathura

all: zathura 

zathura: 
	@test -d ${zathura_dir} || mkdir ${zathura_dir} 
	@ln -sfr ./zathurarc ${zathura_dir}/zathurarc
