#!/bin/sh
tmux has-session -t default && tmux -2 attach-session -t default || tmux -2 new-session -s default
