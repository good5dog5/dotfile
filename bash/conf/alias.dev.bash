# Enviroment variable
export WEBROOT="web_edimax_smb"
export BOARDIP="192.168.2.2"
export PCIP="192.168.2.222"

target="1.left"

# Alias
# board Reboot
alias bR="bash /tftpboot/scripts/boardControl/reboot.sh "
# board Default
alias bD="bash /tftpboot/scripts/boardControl/default.sh "

# Move_script_to_board
function mstb() {
    [ "$#" -eq 0 ] && echo "no file to tftp, exit" && return 1
    tmux send-keys -t $target "rm /storage/scripts/$1.sh" C-m
    tmux send-keys -t $target "tftp -g -r $WEBROOT/scripts/$1.sh $PCIP" C-m
    tmux send-keys -t $target "chmod +x /storage/scripts/$1.sh" C-m
}
# MAKE 
#-------------------------------------
makefile=""
make=""

chkEnv() {
    # Determine make and makefile

    if [ -e "Makefile.ELX" ];
    then
        makefile="Makefile.ELX"
    else
        makefile="Makefile"
    fi
    if [ "${PWD##$HOME/Documents/Edimax/ELX/boards}" != "${PWD}" ];
    then 
        make="make"
    else
        make="colormake"
    fi
    echo $makefile
    echo $make
}

# Make 
mm() { 
    chkEnv
    $make -f $makefile $1
}
# make clear
mc() {

    chkEnv
    $make -f $makefile clean
}
# Clear then make all
cm() {
    chkEnv
    $make -f $makefile clean && $make -f $makefile $1
}
# make -f makefile menuconfig
mmu() {
    if [ "${PWD##/home/jordan/Documents/Edimax/ELX/boards}" != "${PWD}" ];
    then
        make -f Makefile.ELX menuconfig
    else
        echo "Please eba"
    fi
}
Gcgi() {
    local IP="192.168.2.2"
    local USER="admin"
    local PASS="1234"

    curl --digest -u "$USER:$PASS" "http://$IP/cgi-bin/$1.cgi?info=$2&radio_idx=$3" \
        | jq '.'
}
