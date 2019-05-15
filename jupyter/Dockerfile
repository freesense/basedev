FROM continuumio/miniconda3

RUN mkdir -p /opt/notebook && \
    mkdir -p /root/.jupyter && \
    conda install jupyter -y --quiet

EXPOSE 8888
CMD ["jupyter", "notebook", "--notebook-dir=/opt/notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
