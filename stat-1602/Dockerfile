# Use official Python 3.11 slim image as base
FROM python:3.11-slim

LABEL maintainer="Taylor R. Brown <trb5me@virginia.edu>"
LABEL description="Jupyter Lab with scientific libraries, datascience, and otter-grader"

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    graphviz \
    libffi-dev \
    libssl-dev \
    pandoc \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install wheel
RUN pip install --upgrade pip setuptools wheel

# Install scientific Python libraries
RUN pip install \
    numpy \
    scipy \
    pandas \
    matplotlib \
    seaborn \
    plotly \
    bokeh \
    scikit-learn \
    statsmodels \
    sympy \
    numba \
    jupyter \
    jupyterlab \
    ipywidgets \
    ipykernel

# Install additional data science libraries
RUN pip install \
    altair \
    folium \
    geopandas \
    networkx \
    beautifulsoup4 \
    requests \
    sqlalchemy \
    openpyxl \
    xlrd \
    h5py \
    tables \
    pillow

# Install specific versions of datascience and otter-grader
RUN pip install \
    datascience==0.17.6 \
    otter-grader==6.1.3

# Create a non-root user
RUN useradd -m -s /bin/bash jupyter && \
    chown -R jupyter:jupyter /workspace

# Switch to non-root user
USER jupyter

# Configure Jupyter Lab
RUN jupyter lab --generate-config && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.port = 8888" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.open_browser = False" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_root = False" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.token = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.password = ''" >> ~/.jupyter/jupyter_lab_config.py

# Expose Jupyter Lab port
EXPOSE 8888

# Set the default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
