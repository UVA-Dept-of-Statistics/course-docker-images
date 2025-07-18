# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV PATH="/opt/venv/bin:$PATH"

# Install system packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        curl wget git \
        build-essential \
        python3 python3-pip python3-venv \
        r-base \
        libssl-dev libcurl4-gnutls-dev libxml2-dev \
        libclang-dev lsb-release sudo psmisc \
        tini && \
    locale-gen en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

# Install RStudio Server
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.04.1-748-amd64.deb && \
    apt-get install -y ./rstudio-server-2024.04.1-748-amd64.deb && \
    rm rstudio-server-2024.04.1-748-amd64.deb

# Create required user for RStudio login
RUN useradd -ms /bin/bash rstudio && echo "rstudio:rstudio" | chpasswd

# Install Python packages
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install \
        numpy pandas scipy scikit-learn matplotlib seaborn \
        jupyterlab ipykernel notebook

# Install R packages and IRkernel
RUN R -e "install.packages(c('tidyverse', 'IRkernel'), repos='https://cloud.r-project.org')" && \
    R -e "IRkernel::installspec(user = FALSE)"

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Default workspace
WORKDIR /workspace
RUN mkdir -p /workspace

# Expose ports
EXPOSE 8888 8787

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

