FROM python:alpine

RUN apk upgrade && \
    apk add libzmq && \
    \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install jupyter && \
    \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip

EXPOSE 8888
CMD ["jupyter", "notebook"]
