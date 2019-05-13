FROM alpine:edge

RUN apk update && \
    apk add build-base libzmq musl-dev python3 python3-dev zeromq-dev && \
    pip3 install pyzmq && \
    pip3 install jupyter && \
    \
    apk del build-base musl-dev python3-dev zeromq-dev && \
    rm -rf /tmp/* /var/tmp/* ~/.cache/pip

EXPOSE 8888
CMD ["jupyter", "notebook", "--no-browser", "--NotebookApp.token=''"]
