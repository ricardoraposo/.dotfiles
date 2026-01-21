#!/bin/bash

cd ~/

# install some nice deps
sudo dnf copr enable dejan/lazygit

sudo dnf -y install \
       ninja-build cmake gcc gcc-c++ make autoconf \
       gettext curl glibc-gconv-extra git zsh stow fzf wget difftastic fd-find \
       openssl-devel ncurses-devel wxGTK-devel lazygit

sudo yum install pass

sudo dnf install -y pass-otp

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

rm -rf ~/.zshrc ~/.bashrc

cd ~/.dotfiles

stow zsh
stow nvim
stow kitty
stow opencode
stow startship
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

mkdir Projects
mkdir Projects/Repos
mkdir Projects/Work
mkdir Projects/Study

# clone stuff from work
git clone git@github.com:arvoreeducacao/api-arvore.git ~/Projects/Work/api-arvore
git clone git@github.com:arvoreeducacao/arvore.git ~/Projects/Work/arvore
git clone git@github.com:arvoreeducacao/arvore-agents.git ~/Projects/Work/arvore-agents
git clone git@github.com:arvoreeducacao/arvore-reader-web.git ~/Projects/Work/arvore-reader-web
git clone git@github.com:arvoreeducacao/frontend-arvore-nextjs.git ~/Projects/Work/frontend-arvore-nextjs
git clone git@github.com:arvoreeducacao/mobiarvorev2.git ~/Projects/Work/mobiarvorev2
git clone git@github.com:arvoreeducacao/migrations.git ~/Projects/Work/migrations
git clone git@github.com:arvoreeducacao/machado.git ~/Projects/Work/machado

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

sudo dnf install -y iriunwebcam-2.9.1.rpm
sudo dnf install -y vesktop.rpm

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
