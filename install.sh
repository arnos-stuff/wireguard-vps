#!/bin/bash

alias install='sudo apt-get install -y -qq'
alias up='sudo apt update'

up
install openssh-server ufw
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ufw enable ssh
sudo ufw enable 10:20000/tcp
sudo ufw enable 10:20000/udp
up
install cockpit
install micro zsh zsh-static exa zoxide fzf
install fonts-firacode fonts-jetbrains-mono python-is-python3
install flatpak
sudo apt-get install build-essential procps curl file git

yes '' | ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
yes '' | sh -c "$(curl -sS https://starship.rs/install.sh)"
up
mkdir -p $HOME/git
git clone https://github.com/arnos-stuff/shell $HOME/git/shell
cp $HOME/git/shell/prompts/half-pure.toml $HOME/.config/starship.toml
cp $HOME/git/shell/zsh/zshrc.base.zsh $HOME/.zshrc
cp $HOME/git/shell/zsh/zshenv.base.zsh $HOME/.zshenv
cp -r $HOME/git/shell/apps/micro $HOME/.config/
sudo chsh -s /bin/zsh
exec zsh