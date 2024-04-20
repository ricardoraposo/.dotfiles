plugins=(git vi-mode)
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.zsh_profile
source $HOME/.zsh_tokens

export OS="mac"
export EDITOR="nvim"
export NOTES="$HOME/Documents/zet"
export SCRIPTS="$HOME/.dotfiles/scripts"
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"
export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export DOTNET_ROOT=/usr/local/share/dotnet
export GOPATH="$HOME/.local/bin/go"
export AWS_PROFILE="bankme"

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$SCRIPTS:$PATH"

# completions
complete -C z z
complete -C kee kee
complete -C tice tice

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prompt stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo %{$fg[blue]%}$%{$reset_color%}; fi
}

set_smart_prompt() {
countme="$USER@$(hostname):$dir\$ $(git_prompt_info)"
if [[ ${#countme} -lt 35 ]]; then
PROMPT='%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[green]%}%m%{$fg[black]%}:%{$fg[blue]%}%1~ $(git_prompt_info)$(prompt_char) '
elif [[ ${#countme} -ge 35 ]]; then
PROMPT='%{$reset_color%}╔ %{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[green]%}%m%{$fg[black]%}:%{$fg[blue]%}%1~ $(git_prompt_info)
%{$reset_color%}╚ $(prompt_char) '
fi
RPROMPT='%(?, ,%{$fg[red]%}FAIL%{$reset_color%})'
}
# set_smart_prompt
precmd() {
    set_smart_prompt
}

# bun completions
[ -s "/Users/ricardo/.bun/_bun" ] && source "/Users/ricardo/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/ricardo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# Load Angular CLI autocompletion.
source <(ng completion script)



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ricardo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ricardo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ricardo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ricardo/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(fzf --zsh)"
