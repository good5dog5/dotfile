#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------

pass="ediedi"

# first window's left pane
target="1.left"
wait_starteth="7"
wait_reboot="15"
wait_init="10"
wait_start_all="40"
wait_setup="10"


function Tcmd() {
    tmux send-key -t "$target" "$1" C-m
    [ "$#" -eq 2 ] && sleep "$2"
}
