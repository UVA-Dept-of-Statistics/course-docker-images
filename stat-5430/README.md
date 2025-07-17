# STAT-5430 JupyterLab Environment

A Docker-based Jupyter Lab environment for R and Python. 

## Quick Start

### Prerequisites
- Docker
- Docker Compose

### Setup and Launch

Download or clone this repository and then type 

   ```bash
   docker compose up -d
   ```

5. **Access Jupyter Lab**:
   - Open your browser and navigate to: `http://localhost:8888`
   - No password or token required (configured for development use)

### Stopping the Environment

To stop the Jupyter Lab server:
```bash
docker compose down
```

This will:
- Stop the running container
- Remove the container
- Preserve all files in the mounted directories (`notebooks/` and `data/`)
- Keep the Docker image for future use

### Restarting

To restart the environment:
```bash
docker compose up -d
```

