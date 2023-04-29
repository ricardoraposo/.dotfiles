#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/ ~/.config ~/Projects ~/Projects/Repos ~/Projects/Study ~/Projects/Repos/trybe ~/Projects/Study/trybe -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    env TERM=screen-256color tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    env TERM=screen-256color tmux new-session -ds $selected_name -c $selected
fi

env TERM=screen-256color tmux switch-client -t $selected_name
