# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Create a consistent user ID and group ID inside the container
ARG USERNAME=jupyter
ARG USER_UID=1011
ARG USER_GID=1011

# Install system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        curl \
        wget \
        git \
        build-essential \
        software-properties-common \
        libssl-dev \
        libcurl4-gnutls-dev \
        libxml2-dev \
        ca-certificates \
        python3 \
        python3-pip \
        python3-venv \
        r-base \
        tini \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and workspace directory with correct ownership
RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME}

# Python environment setup
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install \
        numpy pandas scipy scikit-learn matplotlib seaborn \
        jupyterlab ipykernel notebook

ENV PATH="/opt/venv/bin:$PATH"

# Install R packages and register IRkernel
RUN R -e "install.packages(c('tidyverse', 'IRkernel'), repos='https://cloud.r-project.org')" && \
    R -e "IRkernel::installspec(user = FALSE)"

# Create a workspace directory
RUN mkdir -p /workspace && \
    chown ${USER_UID}:${USER_GID} /workspace

# Switch to non-root user
USER ${USERNAME}

WORKDIR /workspace

EXPOSE 8888

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]

