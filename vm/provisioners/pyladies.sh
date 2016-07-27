#!/bin/bash

echo "export PIP_DOWNLOAD_CACHE=/vagrant/PIP_DOWNLOAD_CACHE >> ~vagrant/.bashrc"
sed -i -e '/xmodmap/s/^/#/' ~vagrant/.bashrc
sed -i -e '/keychain/s/^/#/' ~vagrant/.bashrc
rm -rf ~vagrant/.vim/plugin/xpath.vim

sudo apt-get update
sudo apt-get install -y python3.5 python3-venv
sudo apt-get install -y vim-nox-py2 python-lxml python3-lxml exuberant-ctags \
    libxml-xpath-perl git

# dammit, ubuntu
sudo update-alternatives --set vim /usr/bin/vim.nox-py2

# Venv it up
python3 -m venv ~vagrant/pyladies
ln -sf /src ~vagrant/pyladies/src

source ~vagrant/pyladies/bin/activate
pip install django~=1.9.0
