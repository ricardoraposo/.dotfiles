export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile
SCRIPTS="$HOME/.dotfiles/scripts/"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export PATH=/usr/local/lib/nodejs/node-v16.17.0-linux-x64/bin:$PATH
    export GOPATH=$HOME/go
    export PATH="$PATH:$HOME/.local/bin"
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
elif [[  "$OSTYPE" == "darwin"* ]]; then
    export GOPATH="$HOME/.local/bin/go"
    export PATH="$PATH:$(go env GOPATH)/bin"
    export PATH="$PATH:$HOME/.local/bin"
    export PATH="$PATH:$SCRIPTS"
    export DOTNET_ROOT=/usr/local/share/dotnet
fi

# my completions
complete -C z z
# bun completions
[ -s "/Users/ricardo/.bun/_bun" ] && source "/Users/ricardo/.bun/_bun"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# Bun
export BUN_INSTALL="/Users/ricardo/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
