#!/bin/bash


update_image() {
echo "Updating Ubuntu"
sudo apt-get update
sudo apt-get dist_upgrade
}

app_install () {
echo "Installing Apps"
sudo apt install zsh
chsh -s $(which zsh)
}

terminal_install () {
echo "Install CLI tools"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_env () {
echo "Configure bash"
ln -nfs ~/src/dotfiles/.bash_profile ~/.bash_profile
echo "Configure zsh"
ln -nfs ~/src/dotfiles/.zshrc ~/.zshrc
echo "Configure shell prompt"
cp amuse.zsh-theme ~/.oh-my-zsh/themes/amuse.zsh-theme
echo "Configure vim"
cat >~/.vimrc <<EOL
:set number
syntax on 
EOL
}

# Commment each function as necessary for use
update_image
app_install
terminal_install
configure_env
