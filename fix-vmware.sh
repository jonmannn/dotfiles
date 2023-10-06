#!/bin/bash
# Script to fix vmware upon kernel update
echo Please input the vmware player version
read playerversion

cd ~/src
git clone https://github.com/mkubecek/vmware-host-modules.git

git checkout workstation-$playerversion

sudo make
sudo make install

sudo vmware-modconfig --console --install-all

openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE15.priv -outform DER -out VMWARE15.der -nodes -days 36500 -subj "/CN=VMWARE/"

echo "We should get affirmation above"

sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmmon)
sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmnet)

tail $(modinfo -n vmmon) | grep "Module signature appended"

echo "You should get Binary file (standard input) matches"

sudo mokutil --import VMWARE15.der

echo "Time to reboot and import the MOK key using the password you just inputed"