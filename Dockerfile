FROM ubuntu:latest
ENV AUTHOR freesense
ENV EMAIL freesense@126.com
# root login password
ENV ROOTPWD 888888
# code-server web password
ENV CODEPWD 888888

# golang + (g++) + tools...
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
    apt-get install -y openssh-server git tmux vim net-tools inetutils-ping && \
    \
    wget ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man.4.4.0.tar.bz2 && \
    tar -jxvf libstdc++-man.4.4.0.tar.bz2 && \
    cp libstdc++-man-4.4.0/man3/* /usr/share/man/man3/ && \
    rm -rf libstdc++-man* && \
    \
    mkdir /var/run/sshd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    \
    ulimit -c unlimited && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# code-server
RUN wget https://github.com/cdr/code-server/releases/download/1.1119-vsc1.33.1/code-server1.1119-vsc1.33.1-linux-x64.tar.gz && \
    tar zxvf code-server1.1119-vsc1.33.1-linux-x64.tar.gz && \
    rm -f code-server1.1119-vsc1.33.1-linux-x64.tar.gz

# miniconda + jupyter
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y bzip2 ca-certificates curl && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    mkdir -p /opt/notebook && \
    conda install jupyter -y --quiet && \
    apt-get install -y python3-dev && \
    \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# openssh
EXPOSE 22
# jupyter
EXPOSE 8888
# code-server
EXPOSE 8443

CMD sh -c 'echo "root:$ROOTPWD" | chpasswd && \
    git config --global user.name "$AUTHOR" && \
    git config --global user.email "$EMAIL" && \
    jupyter notebook --notebook-dir=/opt/notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser --NotebookApp.token="" && \
    nohup ./code-server1.1119-vsc1.33.1-linux-x64/code-server -P $CODEPWD > codesvr.log 2>&1 & && \
    /usr/sbin/sshd -D'
