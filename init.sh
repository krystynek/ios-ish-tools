#!/bin/bash

echo "creating .profile"
rm ~/.profile
cp .profile ~/.profile
source ~/.profile

# update and upgrade
apk update && upgrade

# install packages
apk add curl
apk add fzf
apk add git
apk add neovim
apk add php
apk add pip
apk add python3
apk add tmux


echo "fixing nmap"
adduser nmap
apk add sudo
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
adduser nmap wheel
apk add runuser

echo "install tools from GH"
# REDHAWK
cd
git clone https://github.com/Tuhinshubhra/RED_HAWK.git
cd

# SE TOOLKIT
cd
git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
cd setoolkit
pip3 install -r requirements.txt
python setup.py
cd
