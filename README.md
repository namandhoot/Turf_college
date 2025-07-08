# Turf Booking System

A full-stack web application for managing sports turf bookings. Built with React.js, Node.js, Express, and PostgreSQL.

## Features

- User authentication (Login/Register)
- Turf booking system
- Admin dashboard for managing bookings
- Real-time booking status updates
- Responsive design

## Tech Stack

- **Frontend:** React.js, Material-UI
- **Backend:** Node.js, Express
- **Database:** PostgreSQL
- **Authentication:** JWT

## Quick Start

### Prerequisites

- Node.js (v18 or higher)
- Docker
- Kubernetes cluster (minikube, kind, or cloud)

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/namandhoot/turf-booking.git
cd turf-booking
```

2. **Run with Docker Compose**
```bash
docker-compose up -d
```

3. **Access the application**
- Frontend: http://localhost
- Backend API: http://localhost:5001

### Docker Deployment

1. **Build and push to Docker Hub**
```bash
# Build backend image
docker build -t your-dockerhub-username/turf-booking-backend:latest ./server
docker push your-dockerhub-username/turf-booking-backend:latest

# Build frontend image
docker build -t your-dockerhub-username/turf-booking-frontend:latest ./client
docker push your-dockerhub-username/turf-booking-frontend:latest
```

2. **Deploy to Kubernetes**
```bash
# Apply Kubernetes manifests
kubectl apply -f k8s/
```

3. **Access the application**
- Check the service IP: `kubectl get svc`
- Or use port-forward: `kubectl port-forward svc/frontend-service 80:80`

## Project Structure

```
turf-booking/
├── server/                 # Backend API
├── client/                 # Frontend React app
├── k8s/                   # Kubernetes manifests
├── docker-compose.yml     # Local development
└── README.md
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
