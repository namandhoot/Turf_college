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

# Deploy to Kubernetes
echo "☸️  Deploying to Kubernetes..."
kubectl apply -f k8s/

# Wait for deployment
echo "⏳ Waiting for deployment..."
kubectl wait --for=condition=available --timeout=300s deployment/backend
kubectl wait --for=condition=available --timeout=300s deployment/frontend

# Show services
echo "📋 Services:"
kubectl get svc

echo "✅ Deployment complete!"
echo "🌐 Access your application using the LoadBalancer IP or port-forward:"
echo "   kubectl port-forward svc/frontend-service 80:80" 