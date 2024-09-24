#! /bin/bash

if command -v vim &> /dev/null; then
	echo "Vim is already installed."
else
	echo "Vim is not installed, Installing..."
	apt install -y vim
fi

