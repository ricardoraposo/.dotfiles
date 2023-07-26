#!/bin/bash
# make sure this script is located in the dotfiles folder
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "brew já está instalado"
fi

brewInstall=("git" "fzf" "stow" "exa" "tmux" "bat" "glow" "gum" "jsonpp")
for str in ${brewInstall[@]}
do
  if ! command -v $str &> /dev/null
  then
    brew install $str
  else
    echo "$str já está instalado"
  fi
done

if command -v nvm &> /dev/null
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  nvm install --lts
else
  echo "nvm já está instalado"
fi

if ! command -v nvim &> /dev/null
then
  brew install --HEAD neovim
else
  echo "nvim já está instalado"
fi

if ! command -v yabai &> /dev/null
then
  brew install koekeishiya/formulae/yabai
  brew install koekeishiya/formulae/skhd
else
  echo "yabai já está instalado"
fi

if ! command -v mods &> /dev/null
then
  brew install charmbracelet/tap/mods
else
  echo "mods já está instalado"
fi

stowFolders=("zsh" "yabai" "nvim" "kitty")
for folder in ${stowFolders[@]}
do
    stow $folder
done
