# 开发环境

## 启动指令

`sudo docker run -dP --name=basedev zinicl/basedev`

## 0.0.1

- openssh-server工作在端口22
- `root`用户密码`888888`
- **运行时需挂载ssh密钥文件目录**
    - linux环境可直接挂载~/.ssh目录 `-v /path/to/.ssh:/root/.ssh`
    - windows环境可先创建数据卷容器，或先创建数据卷，再挂载到容器中 `--volumes-from` `--mount`

### 语言

- c/c++
- go
- python3

### 工具

- gcc/g++/make...
- autoconf/automake/libtool
- python3-pip/python3-dev
- openssh-server
- man (C++11 supportted)
- git
- wget
- apt-get
- vim
- tmux
- net-tools (ping/ifconfig/netstat...)
