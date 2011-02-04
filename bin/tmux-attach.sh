#!/bin/sh
tmux has-session -t main
if [ $? -eq 1 ]; then
        tmux -2 new-session -s main -d
fi
. ~/bin/tmux-clean-sessions.sh
exec tmux -2 new-session -t main
