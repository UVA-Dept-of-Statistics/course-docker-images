# STAT-5430 JupyterLab Environment

A Docker-based environment for R and Python with JupyterLab and RStudio Server.

## Quick Start

### Prerequisites
- Docker
- Docker Compose

### Setup and Launch

Always specify which server to run by setting the `MODE` environment variable when starting the container:

- Start **JupyterLab**:

  ```bash
  MODE=jupyter docker compose up -d --build
  ```
  
You may or may not need a `sudo` in front of that command, depending on how you installed Docker. 

Access at: `http://localhost:8888` No password or token required.


- Start RStudio Server:

  ```bash
  MODE=rstudio docker compose up -d --build
  ```

You may or may not need a `sudo` in front of that command, depending on how you installed Docker. 
   
Access at: http://localhost:8787 Login with username: rstudio and password: rstudio


### Stopping the Environment

  ```bash
  docker compose down
  ```
  
  
