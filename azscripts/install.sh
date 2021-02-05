#!/bin/bash

set -e

# JDK
sudo apt-get update
sudo apt install -y default-jdk

# Time Zone
sudo timedatectl set-timezone Asia/Seoul

# Deploy Application
cd /home/azureuser
sudo mkdir -p /home/azureuser/sampleapp
sudo mv runServer.sh /home/azureuser/sampleapp
sudo mv *.jar /home/azureuser/sampleapp
sudo mv sampleapp.service /etc/systemd/system

# Enable Service
sudo systemctl enable sampleapp.service