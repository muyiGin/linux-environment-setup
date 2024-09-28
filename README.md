# Test Passed
Docker Ubuntu 22.04 Official Image: Once downloaded, you can directly run pwn problems that require libc2.23, and the necessary software is basically complete.

# Features
<p>Quickly and automatically install various basic software in virtual machines and Docker containers, and you can also choose to download pwn-related software and implement other functions.
<p>It will first check and download the essential basic software for Linux by default, and then you can select the additional software or features you need according to the prompts.

# Usage
```bash
cd ~
git clone https://github.com/muyiGin/linux-environment-setup 
cd ~/linux-environment-setup
./setup.sh
```
## Options
- **update** : Backup your original APT source and modify it to the Alibaba Cloud mirror source.
- **docker_proxy**: You need to enter your host's proxy port (for example, the default for Clash for Windows is 7890), and then it will modify Docker's http/https/socket network card and port, so you can use the host's VPN (please turn on the host proxy's "Local Area Network Connection" option).
- **pwn**: Download commonly used pwn software for you.
## Software List
- **default**:
	- coreutils
	- net-tools
	- python3
	- pip3
	- curl
	- wget
	- autoconf
	- automake
	- libtool
	- vim
	- gdb
	- tmux
	- plug.vim
- **pwn**:
	- pwntools
	- libcsearcher
	- patchelf
	- glibc-all-in-one
	- pwndbg
# Final Thoughts
It took me five or six hours to learn and set this up from scratch, and I'm still a beginner, so I'm quite happy that it's done.
<p>If you have any feedback, please raise it in the issue, and if you like and support it, please give it a star, thank you very much for your recognition!
