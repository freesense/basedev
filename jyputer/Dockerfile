FROM python:alpine

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install jupyter && \
    rm -rf ~/.cache/pip

CMD ["jupyter", "notebook"]
