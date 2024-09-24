#! /bin/bash

if command -v git &> /dev/null; then
	echo "Git is already installed."
else
	echo "Git is not installed, Installing..."
	sudo apt install -y git
fi
cd /
git clone git@github.com:muyiGin/linux-environment-setup

if command -v vim &> /dev/null; then
	echo "Vim is already installed."
else
	echo "Vim is not installed, Installing..."
	sudo apt install -y vim
fi

