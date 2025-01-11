eval "$(starship init bash)"

alias unfuck='git reset HEAD~1 --soft'
alias fr='export PORT=3000 && pnpm dev'
alias or='export PORT=3001 && yarn start:dev'

alias tm="tmux new -A -s ricardo"
alias tk="tmux kill-server"
