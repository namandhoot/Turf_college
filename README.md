# Turf Booking System

A full-stack web application for managing sports turf bookings. Built with React.js, Node.js, Express, and MongoDB. Enhanced with modern DevOps practices and cloud infrastructure.

## Features

- User authentication (Login/Register)
- Turf booking system
- Admin dashboard for managing bookings
- Real-time booking status updates
- Responsive design
- **Containerized with Docker**
- **Kubernetes deployment ready**
- **CI/CD pipeline with GitHub Actions**
- **Infrastructure as Code with Terraform**
- **Monitoring with Prometheus & Grafana**
- **Security policies and mTLS**

## Tech Stack

- **Frontend:** React.js, Material-UI
- **Backend:** Node.js, Express
- **Database:** MongoDB
- **Authentication:** JWT
- **DevOps:** Docker, Kubernetes, Terraform, GitHub Actions
- **Monitoring:** Prometheus, Grafana
- **Cloud:** AWS (EKS, RDS, ALB, Route53)

## Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │   Backend API   │    │   MongoDB       │
│   (React)       │◄──►│   (Node.js)     │◄──►│   (Database)    │
│   Port: 80      │    │   Port: 5001    │    │   Port: 27017   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   Nginx         │
                    │   (Load Balancer)│
                    │   Port: 80/443  │
                    └─────────────────┘
```

## Getting Started

### Prerequisites

- Node.js (v18 or higher)
- Docker & Docker Compose
- Kubernetes cluster (minikube, kind, or cloud)
- Terraform (for infrastructure)
- AWS CLI (for cloud deployment)

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/namandhoot/turf-booking.git
cd turf-booking
```

2. **Using Docker Compose (Recommended)**
```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

3. **Manual Setup**
```bash
# Backend
cd server
npm install
npm start

# Frontend
cd client
npm install
npm start
```

### Cloud Deployment

1. **Initialize Terraform**
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

2. **Deploy to Kubernetes**
```bash
# Apply namespace
kubectl apply -f k8s/namespace.yaml

# Apply configurations
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/secret.yaml

# Deploy services
kubectl apply -f k8s/mongodb.yaml
kubectl apply -f k8s/backend.yaml
kubectl apply -f k8s/frontend.yaml
kubectl apply -f k8s/ingress.yaml
```

3. **Setup Monitoring**
```bash
# Deploy Prometheus & Grafana
kubectl apply -f monitoring/
```

## CI/CD Pipeline

The project includes a comprehensive CI/CD pipeline:

- **Automated Testing:** Unit tests, integration tests
- **Security Scanning:** Trivy vulnerability scanner
- **Container Building:** Multi-stage Docker builds
- **Image Publishing:** Docker Hub integration
- **Automated Deployment:** Kubernetes deployment

## Monitoring & Observability

- **Metrics Collection:** Prometheus
- **Visualization:** Grafana dashboards
- **Logging:** Centralized logging with ELK stack
- **Alerting:** Custom alert rules

## Security Features

- **mTLS:** Mutual TLS authentication
- **Network Policies:** Kubernetes network policies
- **RBAC:** Role-based access control
- **Secrets Management:** Kubernetes secrets
- **Vulnerability Scanning:** Automated security scanning

## Infrastructure

### AWS Resources
- **EKS Cluster:** Kubernetes cluster
- **RDS:** Managed PostgreSQL database
- **ALB:** Application Load Balancer
- **Route53:** DNS management
- **ACM:** SSL/TLS certificates
- **VPC:** Network isolation

### Cost Optimization
- **Auto Scaling:** Horizontal Pod Autoscaler
- **Resource Limits:** CPU/Memory limits
- **Spot Instances:** Cost-effective compute
- **Backup Strategy:** Automated backups

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
