if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source ~/.zsh-profile
# node 
export PATH=/usr/local/lib/nodejs/node-v16.16.0-linux-x64/bin:$PATH
# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# bun completions
[ -s "/Users/ricardo/.bun/_bun" ] && source "/Users/ricardo/.bun/_bun"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
