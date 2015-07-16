P_toolchain="/opt/buildroot-mipsel-2013.05"
P_include="$P_toolchain/usr/mipsel-elx-linux-uclibc/sysroot/usr/include"

P_ELX_root="/home/jordan/Documents/Edimax/ELX"
P_ELX_board="$P_ELX_root/boards/EDIMAX-7476HPC"
P_ELX_APP="$P_ELX_root/APPS"
P_ELX_dobx="$P_ELX_APP/dbox"

clean_old_db() 
{
    find ./ -type f -iname "cscope.*" | xargs -i rm {}
}

include_basic()
{
    find  "$P_include/" -maxdepth 1 -type f -name "*.[hc]" >> cscope.files
}

include_files()
{
    files=("${!1}")

     for f in "${files[@]}"; do
         if [ -f "$f" ]; then
            echo $f >> cscope.files
         fi
     done           
}

include_files_in_dir()
{
    dirs=("${!1}")

     for d in "${dirs[@]}"; do
         if [ -d "$d" ]; then
             find $d -type f -iname "*.[hc]" >> cscope.files
         fi
     done           

}

