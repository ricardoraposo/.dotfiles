if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile
# node 
export PATH=/usr/local/lib/nodejs/node-v16.16.0-linux-x64/bin:$PATH
# bun completions
[ -s "/Users/ricardo/.bun/_bun" ] && source "/Users/ricardo/.bun/_bun"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# DENO
export DENO_INSTALL="/home/rick/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
