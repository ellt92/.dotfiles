#!/bin/sh

{ # your 'try' block
    tmux kill-session -t work
    tmux new -d -s work
} || {
    tmux new -d -s work
}

tmux send-keys 'cd ~/tnt/dtapi/' Enter 'workon tnt/dtapi' Enter 'gunicorn -w 4 -b 0.0.0.0:5001 tnt/dtapi.wsgi:app' Enter
tmux split-window -h
tmux send-keys 'cd ~/tnt/buildhub/' Enter 'workon buildhub' Enter 'gunicorn -w 4 -b 0.0.0.0:5000 buildhub:app' Enter
tmux split-window -h
tmux send-keys 'cd ~/tnt/dtadmin/' Enter 'workon tnt/dtadmin' Enter 'gunicorn -w 4 -b 0.0.0.0:5002 tnt/dtadmin.wsgi:app' Enter
tmux select-pane -t 0
tmux split-window -v
tmux send-keys 'cd ~/tnt/dtapi/' Enter 'gst' Enter
tmux select-pane -t 2
tmux split-window -v
tmux send-keys 'cd ~/tnt/buildhub/' Enter 'nvm use 6.0' Enter 'npm run dev-server' Enter
tmux select-pane -t 4
tmux split-window -v
tmux send-keys 'cd ~/tnt/dtadmin/' Enter 'nvm use 6.0' Enter 'npm run dev-server' Enter

tmux attach -t work
