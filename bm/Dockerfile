FROM zinicl/basedev
ENV AUTHOR freesense
ENV EMAIL freesense@126.com

WORKDIR /root/Downloads

RUN wget https://github.com/zeromq/libzmq/archive/v4.3.1.tar.gz && \
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
    git clone https://github.com/redis/hiredis.git && \
    cd hiredis && \
    make && \
    make install && \
    \
    pip3 install pyzmq && \
    pip3 install pymysql && \
    pip3 install redis && \
    \
    go get github.com/garyburd/redigo/redis && \
    go get github.com/go-sql-driver/mysql && \
    go get github.com/larspensjo/config && \
    go get github.com/shopspring/decimal && \
    go get github.com/gorilla/websocket && \
    go get github.com/json-iterator/go && \
    go get github.com/pebbe/zmq4 && \
    go get github.com/mattn/go-sqlite3 && \
    go get github.com/stevenyao/go-opencc && \
    \
    apt-get update && \
    apt-get install -y openssl libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/Downloads

EXPOSE 22
CMD sh -c 'git config --global user.name "$AUTHOR" && git config --global user.email "$EMAIL" && /usr/sbin/sshd -D'
