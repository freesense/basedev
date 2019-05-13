FROM python:alpine

RUN apt-get upgrade -y && \
    apt-get install -y libzmq3-dev && \
    \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install jupyter && \
    \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ~/.cache/pip

EXPOSE 8888
CMD ["jupyter", "notebook"]
