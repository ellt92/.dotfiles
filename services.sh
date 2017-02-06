#!/bin/sh

{ # your 'try' block
    tmux kill-session -t work
    tmux new -d -s work
} || {
    tmux new -d -s work
}

tmux send-keys 'cd ~/dtapi/' Enter 'workon dtapi' Enter 'gunicorn -w 4 -b 0.0.0.0:5001 dtapi.wsgi:app' Enter
tmux split-window -h
tmux send-keys 'cd ~/Hub/' Enter 'workon buildhub' Enter 'gunicorn -w 4 -b 0.0.0.0:5000 buildhub:app' Enter
tmux split-window -h
tmux send-keys 'cd ~/dtadmin/' Enter 'workon dtadmin' Enter 'gunicorn -w 4 -b 0.0.0.0:5002 dtadmin.wsgi:app' Enter
tmux select-pane -t 0
tmux split-window -v
tmux send-keys 'cd ~/dtapi/' Enter 'gst' Enter
tmux select-pane -t 2
tmux split-window -v
tmux send-keys 'cd ~/Hub/' Enter 'nvm use 6.0' Enter 'npm run dev-server' Enter
tmux select-pane -t 4
tmux split-window -v
tmux send-keys 'cd ~/dtadmin/' Enter 'nvm use 6.0' Enter 'npm run dev-server' Enter

tmux attach -t work
