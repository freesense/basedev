# 开发环境

## 启动指令

`sudo docker run -dP --name=basedev zinicl/basedev`

## 0.0.1

- openssh-server工作在端口22
- `root`用户默认密码`888888`，可通过环境变量`ROOTPWD`修改
- **运行时需挂载ssh密钥文件目录**
- 宿主机本身为容器时，需使用**高权限**`--privileged`执行以启动`docker`服务

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
- docker/docker-compose
