#! /bin/bash
Working_Directory=$(cd "$(dirname "$0")";pwd)

####################Check & Download######################
# Curl
if command -v curl &> /dev/null; then
	echo "Curl has already installed."
else
	echo "Curl has not installed, Installing..."
	apt install -y curl
fi
# Vim
if command -v vim &> /dev/null; then
	echo "Vim has already installed."
else
	echo "Vim has not installed, Installing..."
	apt install -y vim
fi
# Vim-plug
if !(find ~ -iname "plug.vim" 2>/dev/null | grep -q .); then
	echo "Vim-plug has not installed, Installing..."
	curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "Vim-plug has already installed."
# Gdb
if command -v gdb &> /dev/null; then
	echo "Gdb has already installed."
else
	echo "Gdb has not installed, Installing..."
	apt install -y gdb
fi
# gdb-Pwndbg
if !(find ~ -iname "pwndbg" 2>/dev/null | grep -q .); then
	echo "Pwndbg has not installed, Installing..."
	git clone https://github.com/pwndbg/pwndbg
	cd pwndbg
	./setup.sh
fi
echo "Pwndbg has already installed."
####################Copy & Paste######################
cp $Working_Directory/.tmux.conf ~/
cp $Working_Directory/.vimrc ~/
cp $Working_Directory/.bashrc ~/

echo "Please open tmux/vim/terminal to input source command"
