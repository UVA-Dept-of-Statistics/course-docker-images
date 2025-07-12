# UVA Statistics Department - Docker Images Repository

This repository contains Docker images and configurations for various statistics courses offered by the University of Virginia Department of Statistics. Each course has its own containerized environment with pre-installed software, libraries, and tools specific to the course requirements.

## Quick Start

### Prerequisites
- Docker Desktop or Docker Engine
- Docker Compose
- Git (optional; for cloning the repository)

### Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/uva-statistics/docker-images.git
   cd docker-images
   ```
If you don't have git setup, then you can ask someone to email you the course folder via email. 

2. **Navigate to your course directory**:
   ```bash
   cd stat-xxxx  # Replace with your course number
   ```

3. **Start the environment**:
   ```bash
   docker compose up -d
   ```

4. **Access the environment**:
   - **Jupyter Lab**: `http://localhost:8888`
   - **RStudio**: `http://localhost:8787` (for R-based courses) 

5. **Stop the environment**:
   ```bash
   docker compose down
   ```

## Support

### For Students
- Check course-specific README files first
- Contact your instructor or TA
- Post questions on course discussion forum

### For Instructors
- email Taylor <trb5me@virginia.edu>
- Submit issues to the repository's issue tracker

## Contributing

### Course Instructors
1. Fork the repository
2. Create a feature branch for your course updates
3. Test thoroughly in your environment
4. Submit a pull request with detailed description

### Students
- Report issues through your instructor
- Suggest improvements via course feedback

## Contact

**Department of Statistics**  
University of Virginia  
Email: statistics@virginia.edu  
Website: https://statistics.as.virginia.edu/

