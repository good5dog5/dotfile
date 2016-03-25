# Enviroment variable

# MAKE 
#-------------------------------------
# Make 
function m() { 
    local make="make"

    if hash colormake 2>/dev/null; then
        make="colormake"
    fi
    $make -f Makefile $1
}

# lazy compile and execute, default outfile: filename_prefix.out, eg: hello.c -> hello.out
function x()
{
    if [[ "$1" =~ .*.cpp ]]; then
        g++ -std=c++11 -g -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5  && time ./${1%.*}.out
    else
        gcc -std=c99 -g -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5 -lm && time ./${1%.*}.out
    fi
}
