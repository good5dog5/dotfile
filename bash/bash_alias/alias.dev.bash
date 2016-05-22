# Enviroment variable

alias objdump="objdump -w"
alias readelf="readelf -w"
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
    local CC="gcc"

    if hash colorgcc 2>/dev/null; then
        CC="colorgcc"
    fi

    if [[ "$1" =~ .*.cpp ]]; then
        g++ -std=c++11 -g -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5  && time ./${1%.*}.out
    else
        $CC -std=gnu99 -g -fno-builtin -o ${1%.*}{.out,.${1##*.}} $2 $3 $4 $5 -lm && time ./${1%.*}.out
    fi
}
