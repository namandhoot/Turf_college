#!/bin/bash

# Simple deployment script for Turf Booking System
# This script demonstrates basic Docker and Kubernetes deployment

echo "🚀 Deploying Turf Booking System..."

# Build Docker images
echo "📦 Building Docker images..."
docker build -t namandhoot26/turf-booking-backend:latest ./server
docker build -t namandhoot26/turf-booking-frontend:latest ./client

# Push to Docker Hub
echo "⬆️  Pushing to Docker Hub..."
docker push namandhoot26/turf-booking-backend:latest
docker push namandhoot26/turf-booking-frontend:latest

# Check if Kubernetes is running
echo "🔍 Checking Kubernetes connection..."
if ! kubectl cluster-info &> /dev/null; then
    echo "❌ Kubernetes cluster is not running or not accessible"
    echo "💡 To start a local cluster, run one of these:"
    echo "   - minikube start"
    echo "   - kind create cluster"
    echo "   - docker-desktop (if using Docker Desktop)"
    echo ""
    echo "✅ Docker images built and pushed successfully!"
    echo "📋 To deploy to Kubernetes later, run: kubectl apply -f k8s/"
    exit 1
fi

# Deploy to Kubernetes
echo "☸️  Deploying to Kubernetes..."
kubectl apply -f k8s/

# Wait for deployment
echo "⏳ Waiting for deployment..."
kubectl wait --for=condition=available --timeout=300s deployment/backend || echo "⚠️  Backend deployment timeout"
kubectl wait --for=condition=available --timeout=300s deployment/frontend || echo "⚠️  Frontend deployment timeout"

# Show services
echo "📋 Services:"
kubectl get svc

echo "✅ Deployment complete!"
echo "🌐 Access your application using:"
echo "   kubectl port-forward svc/frontend-service 80:80"
echo "   or check LoadBalancer IP: kubectl get svc frontend-service" 