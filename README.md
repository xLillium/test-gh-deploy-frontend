# Test GH Deploy Frontend

![Angular](https://img.shields.io/badge/Angular-19.2.3-DD0031?style=for-the-badge&logo=angular&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-5.7.2-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Enabled-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

A modern Angular application with automated CI/CD deployment via Docker Swarm.

## 🚀 Features

- **Angular 19.2.3**: Built with the latest Angular framework
- **Docker Integration**: Containerized for consistent deployments
- **CI/CD Pipeline**: Automated testing, building, and deployment with GitHub Actions
- **Docker Swarm**: Orchestrated deployment for high availability

## 📋 Prerequisites

- Node.js (Latest LTS version recommended)
- npm (comes with Node.js)
- Docker (for containerization)
- Angular CLI (`npm install -g @angular/cli`)

## 🛠️ Installation

Clone the repository:

```bash
git clone https://github.com/xlillium/test-gh-deploy-frontend.git
cd test-gh-deploy-frontend
```

Install dependencies:

```bash
npm install
```

## 🖥️ Development

### Local Development Server

Start the development server:

```bash
ng serve
```

Navigate to [http://localhost:4200/](http://localhost:4200/). The application automatically reloads when you change any source files.

### Code Generation

Generate new components, services, directives, and more:

```bash
ng generate component my-component
ng generate service my-service
ng generate directive my-directive
```

## 🧪 Testing

### Running Unit Tests

Execute unit tests via [Karma](https://karma-runner.github.io):

```bash
ng test
```

For CI environments or headless testing:

```bash
npm run test -- --watch=false --browsers=ChromeHeadless
```

## 🏗️ Building

Build the project:

```bash
ng build
```

For production builds with optimizations:

```bash
ng build --configuration=production
```

The build artifacts will be stored in the `dist/` directory.

## 🐳 Docker

### Build Docker Image

```bash
docker build -t test-gh-deploy-frontend:latest .
```

### Run Docker Container

```bash
docker run -p 80:80 test-gh-deploy-frontend:latest
```

Access the application at [http://localhost](http://localhost)

## 🚢 Deployment

The project uses GitHub Actions for CI/CD:

1. Open Pull Request targeting `main` branch triggers the application tests 
2. Push to `main` branch triggers the build and publish workflow
3. Docker image is built and published to GitHub Container Registry (ghcr.io)
4. Deployment to VPS occurs via SSH
5. Docker Swarm handles the deployment using the latest image


## 🔧 Configuration

### Docker Configuration

The Dockerfile builds the application and sets up an Nginx server to serve the app.

### GitHub Actions Configuration

CI/CD workflows are defined in `.github/workflows/`:
- `ci-tests.yml`: Runs tests on pull requests
- `cd-publish-deploy.yml`: Builds, publishes, and deploys on push to main

---

## 📞 Contact

For questions about this infrastructure, please contact [xlillium](https://github.com/xlillium).
