#!/bin/sh
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

starteth.sh

ifconfig eth1 down
ifconfig eth0 192.168.99.9
ifconfig eth0 up

cd /lib
    dl.sh libsetdbox.so
    dl.sh libdbox.so
    dl.sh libtbox.so

cd /sbin/
    dl.sh dbox_init
    dl.sh sd
    dl.sh sd_ctrl
#
