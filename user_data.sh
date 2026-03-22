#!/bin/bash

set -e

echo "===== Updating system ====="
sudo yum update -y

echo "===== Installing Java (required for Jenkins) ====="
sudo yum install -y java-17-openjdk

echo "===== Adding Jenkins repository ====="
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

echo "===== Importing Jenkins GPG key ====="
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "===== Installing Jenkins ====="
sudo yum install -y jenkins

echo "===== Reloading systemd ====="
sudo systemctl daemon-reexec

echo "===== Enabling Jenkins service ====="
sudo systemctl enable jenkins

echo "===== Starting Jenkins ====="
sudo systemctl start jenkins

echo "===== Checking Jenkins status ====="
sudo systemctl status jenkins --no-pager

echo "===== Opening firewall port 8080 ====="
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

echo "===== Jenkins installation completed ====="
echo "Access Jenkins at: http://<your-server-ip>:8080"

echo "===== Initial Admin Password ====="
sudo cat /var/lib/jenkins/secrets/initialAdminPassword