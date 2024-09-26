#! /bin/bash
Working_Directory=$(cd "$(dirname "$0")";pwd)

if command -v vim &> /dev/null; then
	echo "Vim has already installed."
else
	echo "Vim has not installed, Installing..."
	apt install -y vim
fi
if command -v gdb &> /dev/null; then
	echo "Gdb has already installed."
else
	echo "Gdb has not installed, Installing..."
	apt install -y gdb
fi
cd /
if !(find / -iname "pwndbg" 2>/dev/null | grep -q .); then
	echo "Pwndbg has not installed, Installing..."
	git clone https://github.com/pwndbg/pwndbg
	cd pwndbg
	./setup.sh
fi
echo "Pwndbg has already installed."

cp $Working_Directory/.tmux.conf ~/
cp $Working_Directory/.vimrc ~/
cp $Working_Directory/.bashrc ~/

echo "Please open tmux/vim/terminal to input source command"
