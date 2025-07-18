# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Install system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        curl wget git \
        build-essential \
        python3 python3-pip python3-venv \
        r-base \
        libssl-dev libcurl4-gnutls-dev libxml2-dev \
        tini && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install \
        numpy pandas scipy scikit-learn matplotlib seaborn \
        jupyterlab ipykernel notebook

ENV PATH="/opt/venv/bin:$PATH"

# Install R packages and register IRkernel
RUN R -e "install.packages(c('tidyverse', 'IRkernel'), repos='https://cloud.r-project.org')" && \
    R -e "IRkernel::installspec(user = FALSE)"

# Create workspace
RUN mkdir -p /workspace

WORKDIR /workspace

EXPOSE 8888

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root"]

