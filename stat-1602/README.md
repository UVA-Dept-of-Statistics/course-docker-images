# STAT-1602 JupyterLab Environment

A Docker-based Jupyter Lab environment with comprehensive scientific Python libraries, including `datascience 0.17.6` and `otter-grader 6.1.3` for educational and research purposes.

## Features

### Scientific Libraries Included
- **Core Scientific Stack**: NumPy, SciPy, Pandas, Matplotlib, Seaborn
- **Machine Learning**: Scikit-learn, Statsmodels
- **Visualization**: Plotly, Bokeh, Altair
- **Data Processing**: Beautiful Soup, Requests, SQLAlchemy
- **Educational Tools**: datascience 0.17.6, otter-grader 6.1.3
- **Jupyter Environment**: Latest Jupyter Lab with widgets support

### Additional Tools
- Symbolic mathematics (SymPy)
- High-performance computing (Numba)
- Geospatial analysis (GeoPandas, Folium)
- Network analysis (NetworkX)
- File format support (Excel, HDF5, images)

## Quick Start

### Prerequisites
- Docker
- Docker Compose

### Setup and Launch

1. **Clone or create project directory**:
   ```bash
   mkdir jupyter-datascience
   cd jupyter-datascience
   ```

2. **Create the required directories**:
   ```bash
   mkdir notebooks data
   ```

3. **Place the Dockerfile and docker-compose.yml in the project directory**

4. **Start the environment**:
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

## File Persistence

### What's Persistent
- **Notebooks**: All `.ipynb` files in the `notebooks/` directory
- **Data files**: All files in the `data/` directory
- **Any other files**: Created in the mounted directories

### What's Not Persistent
- Python packages installed via `pip install` in a notebook cell
- Files created outside the mounted directories
- Environment variables set during runtime

### Adding Persistent Python Packages

To add new Python packages permanently:
1. Edit the `Dockerfile`
2. Add your package to the `RUN pip install` commands
3. Rebuild the image:
   ```bash
   docker compose up --build -d
   ```

## Directory Structure

```
jupyter-datascience/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── notebooks/          # Your Jupyter notebooks (persistent)
├── data/              # Your data files (persistent)
└── assignments/       # Optional: for otter-grader assignments
```

## Usage Examples

### Basic Data Science Work
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Your data science code here
```

### Using the datascience package
```python
from datascience import Table
import numpy as np

# Create a table
data = Table().with_columns([
    'x', np.arange(10),
    'y', np.arange(10) ** 2
])
```

### Using otter-grader
```python
import otter
grader = otter.Notebook()
```

## Troubleshooting

### Port Already in Use
If port 8888 is already in use, modify the `docker-compose.yml`:
```yaml
ports:
  - "8889:8888"  # Use port 8889 instead
```

### Memory Issues
For large datasets, increase memory limits in `docker-compose.yml`:
```yaml
deploy:
  resources:
    limits:
      memory: 8G
```

### Rebuilding the Image
If you make changes to the Dockerfile:
```bash
docker compose down
docker compose build --no-cache
docker compose up -d
```
