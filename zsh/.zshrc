eval "$(starship init zsh)"

plugins=(git vi-mode)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.zsh_profile
source $HOME/.zsh_tokens

export EDITOR="nvim"
export NOTES="$HOME/Documents/zet"
export SCRIPTS="$HOME/.dotfiles/scripts"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"
export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export DOTNET_ROOT=/usr/local/share/dotnet
export GOPATH="$HOME/.local/bin/go"

export PATH="$BUN_INSTALL/bin:$SCRIPTS:$HOME/.zen/zen:$HOME/.local/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ "$(uname)" == "Linux" ]]; then
  export PATH=/home/rick/.nimble/bin:$PATH
  export PATH=/home/rick/.cargo/bin:$PATH
  export PATH="$HOME/.npm-global/bin:$PATH"
  export DOCKER_HOST=unix:///var/run/docker.sock

  # Add deno completions to search path
  if [[ ":$FPATH:" != *":/home/rick/.zsh/completions:"* ]]; then export FPATH="/home/rick/.zsh/completions:$FPATH"; fi

  if test -d "$HOME/.datagrip"; then
    export PATH="$PATH:$HOME/.datagrip/bin"
  fi


  if [ -f '/home/rick/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/rick/Downloads/google-cloud-sdk/path.zsh.inc'; fi

  if [ -f '/home/rick/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/rick/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
elif [[ "$(uname)" == "Darwin" ]]; then
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/ricardo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ricardo/google-cloud-sdk/path.zsh.inc'; fi
  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/ricardo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ricardo/google-cloud-sdk/completion.zsh.inc'; fi

  # opam configuration
  [[ ! -r /Users/ricardo/.opam/opam-init/init.zsh ]] || source /Users/ricardo/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

  # pnpm
  export PNPM_HOME="/Users/ricardo/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  # pnpm end

  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

  # append completions to fpath
  fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

  # initialise completions with ZSH's compinit
  autoload -Uz compinit && compinit
fi
