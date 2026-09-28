# Cloud Automation & DevOps Lab

A hands-on DevOps project demonstrating containerization, infrastructure automation, CI/CD, AWS deployment, monitoring, and troubleshooting.

## Project Status

Phase 1 completed: the web application has been containerized and tested locally using Docker.

## Current Architecture

```text
HTML Web App
     ↓
Dockerfile
     ↓
Docker Image
     ↓
Nginx Container
     ↓
localhost:8080
```

## Technologies

- Docker
- Nginx
- HTML/CSS
- Git
- AWS
- Terraform
- GitHub Actions

## Completed Work

- Installed and configured Docker Desktop with WSL 2.
- Moved Docker data storage to the E drive.
- Created a CloudOps status dashboard.
- Created a Dockerfile using Nginx Alpine.
- Built a Docker image locally.
- Started, stopped, and restarted the container.
- Published the container locally on port 8080.
- Initialized the project with Git.

## Run Locally

Build the Docker image:

```bash
docker build -t cloudops-dashboard:1.0 .
```

Run the container:

```bash
docker run -d --name cloudops-dashboard -p 8080:80 cloudops-dashboard:1.0
```

Open the application:

```text
http://localhost:8080
```

Check the running container:

```bash
docker ps
```

Stop and restart the container:

```bash
docker stop cloudops-dashboard
docker start cloudops-dashboard
```

## Screenshots

### Docker Installation Test

![Docker Hello World](screenshots/01-docker-hello-world.png)

### Local CloudOps Dashboard

![Local Dashboard](screenshots/02-local-dashboard.png)

### Running Container

![Running Container](screenshots/03-running-container.png)

## Next Phases

- Build AWS infrastructure using Terraform.
- Deploy the containerized application to Amazon EC2.
- Create a CI/CD pipeline using GitHub Actions.
- Add monitoring and troubleshooting scenarios.