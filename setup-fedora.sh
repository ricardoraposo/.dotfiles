#!/bin/bash

cd ~/

# install some nice deps
sudo dnf copr enable dejan/lazygit
sudo dnf copr enable lihaohong/yazi

sudo dnf -y install \
       ninja-build cmake gcc gcc-c++ make autoconf \
       gettext curl glibc-gconv-extra git zsh stow wget difftastic fd-find \
       openssl-devel ncurses-devel wxGTK-devel lazygit pass pass-otp yazi

# change shell to zsh if not already zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

# install oh my zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed"
fi

# install mise if not already installed
if ! command -v mise &> /dev/null; then
    curl https://mise.run | sh
else
    echo "mise is already installed"
fi

rm -rf ~/.zshrc ~/.bashrc

cd ~/.dotfiles

stow zsh
stow nvim
stow kitty
stow opencode
stow starship
stow ai-scripts

cd ..

source ~/.zshrc

mise install

mkdir -p Projects/Repos Projects/Work Projects/Study

# build neovim if not already installed
if ! command -v nvim &> /dev/null || [ ! -f "/usr/local/bin/nvim" ]; then
    git clone https://github.com/neovim/neovim
    cd neovim
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd ..
    rm -rf neovim
else
    echo "neovim is already installed"
fi

# clone password store if not already present
if [ ! -d "$HOME/.password-store" ]; then
    git clone git@github.com:ricardoraposo/.password-store.git
else
    echo "password store already exists"
fi


# wayland discord and webcam app
if ! rpm -q iriunwebcam &> /dev/null; then
    wget https://iriun.gitlab.io/iriunwebcam-2.9.1.rpm
    sudo dnf install -y ./iriunwebcam-2.9.1.rpm
    rm iriunwebcam-2.9.1.rpm
else
    echo "iriunwebcam is already installed"
fi

if ! rpm -q vesktop &> /dev/null; then
    wget https://vencord.dev/download/vesktop/amd64/rpm
    mv rpm vesktop.rpm
    sudo dnf install -y ./vesktop.rpm
    rm vesktop.rpm
else
    echo "vesktop is already installed"
fi

# installing kitty if not already installed
if ! command -v kitty &> /dev/null; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
else
    echo "kitty is already installed"
fi

# install docker if not already installed
if ! command -v docker &> /dev/null; then
    sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
    sudo groupadd docker 2>/dev/null || echo "docker group already exists"
    sudo usermod -aG docker $USER
    echo "You may need to log out and back in to use docker without sudo"
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
else
    echo "docker is already installed"
fi
