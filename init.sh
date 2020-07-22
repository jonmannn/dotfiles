#!/bin/bash

app_install () {
echo "Installing apps"
brew cask install iterm2
brew cask install rectangle
brew cask install spotify
brew cask install 1password
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install pycharm-ce
brew cask install postman
brew cask install brave-browser
brew cask install dropbox
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

app_install
terminal_install
configure_env