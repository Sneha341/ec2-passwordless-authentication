#!/bin/bash

set -e

echo "Updating system packages..."
sudo yum update -y

echo "Installing Java 17 (Amazon Corretto)..."
sudo yum install -y java-17-amazon-corretto

echo "Adding Jenkins repository..."
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo "Importing Jenkins GPG key..."
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "Installing Jenkins..."
sudo yum install -y jenkins

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Enabling Jenkins at boot..."
sudo systemctl enable jenkins

echo "Jenkins installed successfully!"

echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Access Jenkins:"
echo "http://<EC2-PUBLIC-IP>:8080"