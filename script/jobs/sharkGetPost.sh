#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------
cd $(dirname $0)
ROOT=$(pwd)
#--------------------------------------------------------------------
# Helper functions.
#--------------------------------------------------------------------
usage()
{
    cat << EOF
    usage: $0 [options]
    OPTIONS:
    -h Show this message.
EOF
}

tshark -i eth1 -w cap -q -a filesize:50 &>/dev/null  \
    && tshark -r cap -V | /bin/grep 'submitpg' > result && \
    cat result | sed 's/&/\n/g'

