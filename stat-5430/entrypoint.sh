#!/bin/bash

if [ -z "$MODE" ]; then
    echo "ERROR: MODE environment variable is not set."
    echo "Please specify MODE as either 'jupyter' or 'rstudio'."
    echo "Example commands with docker compose:"
    echo "  sudo MODE=jupyter docker compose up --build"
    echo "  sudo MODE=rstudio docker compose up --build"
    exit 1
fi

if [ "$MODE" = "rstudio" ]; then
    echo "Starting RStudio Server on port 8787..."
    exec /usr/lib/rstudio-server/bin/rserver --server-daemonize=0
elif [ "$MODE" = "jupyter" ]; then
    echo "Starting JupyterLab on port 8888..."
    exec jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token='' --NotebookApp.password='' --allow-root
else
    echo "Unknown MODE: $MODE"
    echo "Please set MODE to either 'jupyter' or 'rstudio'."
    echo "Example commands with docker compose:"
    echo "  sudo MODE=jupyter docker compose up --build"
    echo "  sudo MODE=rstudio docker compose up --build"
    exit 1
fi

