#!/bin/bash
sessions=`tmux list-sessions | grep -v attached | cut -d: -f1 | grep -e '^[0-9]*$'`
for i in $sessions; do
        tmux kill-session -t $i
done
