source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.zsh_profile
plugins=(git)

export GOPATH="$HOME/.local/bin/go"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$SCRIPTS"
export PATH="$BUN_INSTALL/bin:$PATH"

export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"
export DOTNET_ROOT=/usr/local/share/dotnet
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"
export EDITOR="nvim"

# completions
complete -C z z
complete -C tice tice
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prompt stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
_lineup=$'\e[1A'
_linedown=$'\e[1B'
function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo %{$fg[blue]%}$%{$reset_color%}; fi
}
PROMPT='%{$reset_color%}╔ %{$fg[magenta]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%m%{$fg[black]%}:%{$fg[blue]%}%1~ $(git_prompt_info)
%{$reset_color%}╚ $(prompt_char) '

RPROMPT='%{${_lineup}%}%(?, ,%{$fg[red]%}FAIL%{$reset_color%})%{${_linedown}%}'
