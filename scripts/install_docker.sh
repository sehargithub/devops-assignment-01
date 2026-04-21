#!/bin/bash

echo "Updating system"
sudo apt update -y

echo "Installing Docker"
sudo apt install -y docker.io

echo "Starting Docker"
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding user to docker group"
sudo usermod -aG docker $USER

echo "Docker version:"
docker --version

echo "Docker installed successfully!"
