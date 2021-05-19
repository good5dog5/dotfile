#!/bin/sh

# Operating System(s):    Linux distros that use apt-get
# Software Dependencies:  webserver ssh, htop, vim, git, ncdu, crawl, slurm
# Description:            creates 10 named windows for general workday use

TMUX_NAME="work"

# check if session exists
tmux has-session -t "$TMUX_NAME"
if [ $? != 0 ]
then

    # if session does not exist create it
    # note - default window numbered either 0 or 1 depending on tmux 'base-index'
    # note - my setup assumes 'base-index' was set at 1
    tmux -2 new-session -s "$TMUX_NAME" -n aiLabs -d
    
    
    # create additional named windows
    # note - extra windows start at 1 or 2 and count upward depending on tmux 'base-index'
    # note - my setup assumes 'base-index' was set at 1
    tmux new-window -n JavaExample
    tmux new-window -n AVM
    
    tmux send-keys -t "$TMUX_NAME":1 'cd ~/aiLabs/repo/tower-server' C-m
    
    
    tmux send-keys -t "$TMUX_NAME":3 'cd ~/github/JavaExample/ ' C-m
    tmux split-window -v -p 30 -t "$TMUX_NAME":3 

    tmux send-keys -t "$TMUX_NAME":4 'cd ~/Workspace/proj_AVMapping' C-m
fi
tmux attach -t "$TMUX_NAME"

