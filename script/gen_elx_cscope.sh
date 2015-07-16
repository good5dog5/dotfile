source /tftpboot/scripts/include/ELX.cscope.sh

Dirs=(
      "$P_ELX_root/scripts"
      "$P_ELX_root/OPENSOURCE"
      "$P_ELX_root/LIBS"
      "$P_ELX_root/boards/HAWKING-7476HPC"
      "$P_ELX_root/tools "
      "$P_ELX_root/APPS"
)

clean_old_db

include_basic
include_files_in_dir Dirs[@]

cscope -Rbq -i cscope.files
