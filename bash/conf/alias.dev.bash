Gcgi() {
    local IP="192.168.2.2"
    local USER="admin"
    local PASS="1234"

    curl --digest -u "$USER:$PASS" "http://$IP/cgi-bin/$1.cgi?info=$2&radio_idx=$3" \
        | jq '.'
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
