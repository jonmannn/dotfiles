#!/bin/bash

app_install () {
echo "Installing apps"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask iterm2
brew install --cask rectangle
brew install --cask spotify
brew install --cask 1password
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask pycharm-ce
brew install --cask postman
brew install --cask brave-browser
}

terminal_install () {
echo "Install CLI tools"
brew install tldr
brew install python3
brew install terraform
brew install warrensbox/tap/tfswitch
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_env () {
echo "Configure bash"
ln -nfs ~/src/dotfiles/.bash_profile ~/.bash_profile
echo "Configure zsh"
ln -nfs ~/src/dotfiles/.zshrc ~/.zshrc
echo "Configure vim"
cat >~/.vimrc <<EOL
:set number
syntax on 
EOL
}

# Commment each function as necessary for use
app_install
terminal_install
configure_env
