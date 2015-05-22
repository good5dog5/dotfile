#!/bin/bash
#--------------------------------------------------------------------
# Global configurations.
#--------------------------------------------------------------------
pass="ediedi"

# first window's left pane
target="1.left"

wait_reboot="15"
wait_init="10"
wait_start_all="40"
wait_setup="10"

sleep $wait_reboot

tmux send-keys -t $target "$pass" C-m

tmux send-keys -t $target "cd /storage/scripts/" C-m
tmux send-keys -t $target "./init.sh" C-m
sleep $wait_init

tmux send-keys -t $target "start_all " C-m
sleep $wait_start_all

tmux send-keys -t $target "./setup.sh" C-m
sleep $wait_setup
