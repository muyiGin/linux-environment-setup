# 测试通过
Docker Ubuntu 22.04 官方镜像：下载好后就能直接运行 pwn 题，所需软件基本是齐全的。

# 功能
快速在虚拟机和 Docker 容器内自动安装各种基本软件，还可选择 pwn 相关软件下载和实现其他功能。
首先会默认检查并下载 Linux 必备的基础软件，然后根据提示选择你需要的额外软件或者功能。

# 使用
```bash
cd ~
git clone https://github.com/muyiGin/linux-environment-setup
cd ~/linux-environment-setup
./setup.sh
```
## 选项
- **update**: 将你原来的 APT 源备份并修改为阿里云镜像源。
- **docker_proxy**: 你需要输入你主机的代理端口（比如 Clash for Windows 默认是 7890），然后会修改 Docker 的 http/https/socket 网卡和端口，就能使用主机的 VPN 了（请打开主机代理的“局域网连接”选项）。
- **pwn**: 为你下载 pwn 常用软件。

## 软件列表
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

# 写在最后
自己从头开始学弄了五六个小时，毕竟也是个新手，弄好了我也挺高兴的。如果有任何反馈请在 issue 提出，如果喜欢并支持请点个星星，十分感谢你的认可！
