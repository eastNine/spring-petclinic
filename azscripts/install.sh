#!/bin/bash

set -e

APPLICATION_NAME=spring-petclinic

DEPLOYDIRECTORY=/opt/$APPLICATION_NAME

# list files
ls -al /deployTemp/$APPLICATION_NAME

# JDK
sudo add-apt-repository universe
sudo apt-get update
sudo apt install -y openjdk-8-jdk

# Time Zone
sudo timedatectl set-timezone Asia/Seoul

# Deploy Application
sudo mkdir -p $DEPLOYDIRECTORY
sudo chmod +x /deployTemp/$APPLICATION_NAME/*.sh
sudo mv /deployTemp/$APPLICATION_NAME/runServer.sh $DEPLOYDIRECTORY
sudo mv /deployTemp/$APPLICATION_NAME/*.jar $DEPLOYDIRECTORY
sudo mv /deployTemp/$APPLICATION_NAME/$APPLICATION_NAME.service /etc/systemd/system

# Enable Service
sudo systemctl enable $APPLICATION_NAME.service