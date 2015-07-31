# Enviroment variable
export WEBROOT="web_elecom"
export BOARDIP="192.168.1.235"
export PCIP="192.168.1.222"

target="1.left"

# board Reboot
alias b_reboot="bash /tftpboot/scripts/boardControl/b_reboot.sh "

# board Default
alias b_default="bash /tftpboot/scripts/boardControl/b_default.sh "
alias b_reset="bash /tftpboot/scripts/boardControl/b_reset.sh"
alias master="bash ~/usr/script/100thousand.sh"
# board setup
bs () {
    Tcmd "cd /storage/scripts" 
    Tcmd "sh /storage/scripts/setup.sh" 
}
function Tcmd() {
    tmux send-key -t "$target" "$1" C-m
}

# Move_script_to_board
function mstb() {
    [ "$#" -eq 0 ] && echo "no file to tftp, exit" && return 1
    Tcmd "cd /storage/scripts" 
    Tcmd "tftp -g -r $WEBROOT/scripts/$1.sh $PCIP" 
    Tcmd "chmod +x /storage/scripts/$1.sh" 
}

# MAKE 
#-------------------------------------
makefile=""
make=""

function chkEnv() {
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
function m() { 
    chkEnv
    $make -f $makefile $1
}
# Clear then make all
function cm() {
    chkEnv
    $make -f $makefile clean && $make -f $makefile $1
}
# make -f makefile menuconfig
function mmu() {
    if [ "${PWD##${HOME}/Documents/Edimax/ELX/boards}" != "${PWD}" ];
    then
        make -f Makefile.ELX menuconfig
    else
        echo "Please eba"
    fi
}
function Gcgi() {
    local USER="admin"
    local PASS="1234"

    curl --digest -u "$USER:$PASS" "http://$BOARDIP/cgi-bin/$1.cgi?info=$2&radio_idx=$3" \
        | jq '.'
}
# lazy compile and execute, default outfile: filename_prefix.out, eg: hello.c -> hello.out
function x()
{
    if [[ "$1" =~ .*.cpp ]]; then
        g++ -std=c++11 -g -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5  && time ./${1%.*}.out && valgrind  ./${1%.*}.out
    else
        gcc -std=c99 -g -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5 -lm && time ./${1%.*}.out && valgrind  ./${1%.*}.out
    fi
}
