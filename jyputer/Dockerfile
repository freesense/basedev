FROM python:alpine

RUN apk upgrade && \
    apk add g++ autoconf automake libtool python3-dev && \
    \
    wget https://github.com/zeromq/libzmq/archive/v4.3.1.tar.gz && \
    tar zxvf v4.3.1.tar.gz && \
    cd libzmq-4.3.1 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make check && \
    make install && \
    make distclean && \
    cd .. && \
    \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install jupyter && \
    \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip v4.3.1.tar.gz

EXPOSE 8888
CMD ["jupyter", "notebook"]
