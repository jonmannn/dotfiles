#!/bin/bash


update_image() {
echo "Updating Kali"
sudo apt-get update
sudo apt-get dist_upgrade
}

app_install () {
mkdir ~/tools
mkdir ~/tools/Windows
mkdir ~/tools/Linux


echo "Install Discover Scripts"
cd /opt/
git clone https://github.com/leebaird/discover.git
cd discover/
sudo ./setup.sh

echo "Install Smbexec"
cd /opt/
git clone https://github.com/brav0hax/smbexec.git
cd smbexec
sudo ./install.sh

echo "Install Veil"
cd /opt/
git clone https://github.com/veil-evasion/Veil.git
cd /Veil/setup
./setup.sh

echo "Install Windows Credential Editor (WCE)"
cd ~/Downloads
curl https://www.ampliasecurity.com/research/wce_v1_41beta_universal.zip --output wce_v1_41beta_universal.zip
unzip -d ./wce_v1_41beta_universal.zip/ ~/tools/Windows/WCE

echo "Install EyeWitness"
cd /src/
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
sudo ./EyeWitness/Python/setup/setup.sh

echo "Add Nmap Script"
cd /usr/share/nmap/scripts/
wget https://raw.github.com/hdm/scan-tools/master/nse/banner-plus.nse

echo "Install BeEF"
sudo apt-get install beef-xss

echo "Install fuzzing lists"
cd /opt/
git clone https://github.com/danielmiessler/SecLists.git
}

terminal_install () {
echo "Install CLI tools"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_env () {
echo "Configure Metasploit"
service postgresql start
service Metasploit start
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
update_image
app_install
terminal_install
configure_env
