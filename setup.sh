#! /bin/bash
####################Global_varibles######################
Working_Directory=$(cd "$(dirname "$0")";pwd)

####################Functions######################
install_if_not_exists() {
    local name="$1"           # Software's name
    local install_cmd="$2"    # Install Command
    local check_file="$3"     # Check some softwares which aren't system command (Optional)
    if [[ -n "$check_file" ]]; then
        if ! find ~ -iname "$check_file" 2>/dev/null | grep -q .; then
            echo "--->$name is installing Now..."
            eval "$install_cmd"
        else
            echo "--->$name has been already installed."
        fi
    elif ! command -v "$name" &> /dev/null; then
        echo "--->$name is installing Now..."
        eval "$install_cmd"
    else
        echo "--->$name has been already installed."
    fi
}
action(){
	local name="$1"
	if [["$name"=="patchelf"]];then
		cd "~/Glibc/patchelf"
		eval "./bootstrap.sh"
		eval "./configure"
		eval "make"
		eval "sudo make install"
		eval "make check"
	elif [["$name"=="glibc-all-in-one"]];then
		cd "~/Glibc/glibc-all-in-one"
		eval "./update_list"
		eval "cat list"
	elif [["$name"=="pwndbg"]];then
		cd "~/pwndbg"
		eval "./setup.sh"
	fi
	cd "$Working_Directory"
}
git_install(){
		local name="$1"					# Software's name
		local install_url="$2"  # Install url
		local mkdir_addr="$3"		# Making Directory
    if ! find ~ -iname "$name" 2>/dev/null | grep -q .; then
				eval "mkdir -p $mkdir_addr"
				cd "$mkdir_addr"
				echo "--->$mkdir_addr has been established."
				eval "git clone $install_url"
				echo "--->$name is installing Now..."
				action "$name"
      else
        echo "--->$name has been already installed."
    fi
}
change_apt_source(){
	cp "/etc/apt/sources.list" "/etc/apt/sources.list.bak"
	cp "$Working_Director/sources.list" "/etc/apt/sources.list"
}
####################Commands######################
change_apt_source
install_if_not_exists "python3" "apt install -y python3"
install_if_not_exists "curl" "apt install -y curl"
install_if_not_exists "vim" "apt install -y vim"
install_if_not_exists "gdb" "apt install -y gdb"
install_if_not_exists "vim-plug" "curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" "plug.vim"
git_install "patchelf" "https://github.com/NixOS/patchelf" "~/Glibc"
git_install "glibc-all-in-one" "https://github.com/matrix1001/glibc-all-in-one" "~/Glibc"
git_install "pwndbg" "https://github.com/pwndbg/pwndbg" "~"
