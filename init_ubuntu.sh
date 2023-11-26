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
echo "Centering the dock"
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true
}

# VMWare Player stuff
sudo apt install gcc
sudo apt-get install build-essential linux-headers-$(uname -r)
sudo ln -s /usr/src/linux-headers-$(uname -r)/include/generated/uapi/linux/version.h /usr/src/linux-headers-$(uname -r)/include/linux/version.h

# Touchpad config
sudo gpasswd -a $USER input
sudo apt-get install wmctrl xdotool
sudo apt-get install libinput-tools
cd src
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install
libinput-gestures-setup autostart start

# Commment each function as necessary for use
update_image
app_install
terminal_install
configure_env
