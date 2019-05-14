FROM alpine

RUN apk update && \
    apk add build-base libzmq musl-dev python3 python3-dev zeromq-dev freetype-dev libpng && \
    pip3 install pyzmq && \
    pip3 install jupyter && \
    pip3 install numpy pandas matplotlib scipy && \
    pip3 install jupyter_nbextensions_configurator && jupyter contrib nbextension install && \
    \
    apk del build-base musl-dev python3-dev zeromq-dev && \
    rm -rf /tmp/* /var/tmp/* ~/.cache/pip

EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
