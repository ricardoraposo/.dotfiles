#!/bin/bash

cd ~/

# install some nice deps
sudo dnf copr enable dejan/lazygit

sudo dnf -y install \
       ninja-build cmake gcc gcc-c++ make autoconf \
       gettext curl glibc-gconv-extra git zsh stow fzf wget difftastic fd-find \
       openssl-devel ncurses-devel wxGTK-devel lazygit pass pass-otp

# install go manually
wget https://go.dev/dl/go1.25.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.6.linux-amd64.tar.gz

chsh -s $(which zsh)

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install starship
curl -sS https://starship.rs/install.sh | sh

# install cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

. "$HOME/.cargo/env"

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

cargo install eza

# install asdf
go install github.com/asdf-vm/asdf/cmd/asdf@v0.18.0

asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install

mkdir -p Projects/Repos Projects/Work Projects/Study

# build neovim
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
rm -rf neovim

git clone git@github.com:ricardoraposo/.password-store.git


# wayland discord and webcam app
wget https://iriun.gitlab.io/iriunwebcam-2.9.1.rpm
wget https://vencord.dev/download/vesktop/amd64/rpm

mv rpm vesktop.rpm

sudo dnf install -y ./iriunwebcam-2.9.1.rpm
sudo dnf install -y ./vesktop.rpm

rm iriunwebcam-2.9.1.rpm vesktop.rpm

# installing kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# opencode
curl -fsSL https://opencode.ai/install | bash

# gh cli
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

# install aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install docker
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
