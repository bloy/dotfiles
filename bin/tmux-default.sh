#!/bin/sh
tmux has-session -t default
if [ $? -eq 1 ]; then
        tmux -u new-session -s default -d
        if [ -e $HOME/bin/tmux-default-new-session ]; then
                . $HOME/bin/tmux-default-new-session
        fi
fi
exec tmux -u -2 attach-session -t default
