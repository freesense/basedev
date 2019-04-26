# 开发环境

## 启动指令

`sudo docker run -d -P --name=basedev -v /path/to/.ssh:/root/.ssh -v /path/to/project:/root/project zinicl/basedev`

## 0.0.1

- openssh-server工作在端口22
- `root`用户密码`888888`
- **运行时需挂载ssh密钥文件目录**

### 语言

- c/c++
- go
- python3

### 工具

- gcc/g++/make...
- autoconf/automake/libtool
- python3-pip
- openssh-server
- man (C++11 supportted)
- git
- wget
- apt-get
- vim
- tmux
- net-tools (ping/ifconfig/netstat...)
