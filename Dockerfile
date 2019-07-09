FROM ubuntu:latest
ENV AUTHOR freesense
ENV EMAIL freesense@126.com
ENV ROOTPWD 888888

RUN rm /etc/dpkg/dpkg.cfg.d/excludes && \
    apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    apt-get install -y man && \
    \
    apt-get upgrade -y && \
    apt-get install -y g++ && \
    apt-get install -y autoconf automake libtool && \
    apt-get install -y build-essential && \
    apt-get install -y golang && \
    apt-get install -y python3 python3-pip python3-dev && \
    apt-get install -y openssh-server git tmux vim net-tools inetutils-ping && \
    apt-get install -y language-pack-zh-hans language-pack-zh-hans-base && \
    \
    wget ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man.4.4.0.tar.bz2 && \
    tar -jxvf libstdc++-man.4.4.0.tar.bz2 && \
    cp libstdc++-man-4.4.0/man3/* /usr/share/man/man3/ && \
    rm -rf libstdc++-man* && \
    \
    apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    \
    curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    \
    mkdir /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    \
    mkdir -p ~/go/bin && \
    sed -i '$ a export LC_ALL="zh_CN.UTF-8"' ~/.bashrc && \
    sed -i '$ a export LANG="zh_CN.UTF-8"' ~/.bashrc && \
    sed -i '$ a export PATH=~/go/bin:$PATH' ~/.bashrc && \
    \
    ulimit -c unlimited && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
CMD sh -c 'echo "root:$ROOTPWD" | chpasswd && git config --global user.name "$AUTHOR" && git config --global user.email "$EMAIL" && service docker start && /usr/sbin/sshd -D'
