FROM ubuntu:latest
#LABEL version="1.0" maintainer="freesense@126.com"
#ADD http://mirrors.163.com/.help/sources.list.trusty /etc/apt/sources.list
COPY id_rsa* /root/.ssh/

RUN rm /etc/dpkg/dpkg.cfg.d/excludes && \
    apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    apt-get install -y man && \
    \
    apt-get upgrade -y && \
    apt-get install -y g++ && \
    apt-get install -y build-essential && \
    apt-get install -y golang && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y openssh-server git tmux vim net-tools && \
    \
    wget ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man.4.4.0.tar.bz2 && \
    tar -jxvf libstdc++-man.4.4.0.tar.bz2 && \
    cp libstdc++-man-4.4.0/man3/* /usr/share/man/man3/ && \
    rm -rf libstdc++-man* && \
    \
    mkdir /var/run/sshd && \
    echo 'root:888888' | chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    \
    ulimit -c unlimited && \
    git config --global user.name "freesense" && \
    git config --global user.email "freesense@126.com" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
