#!/bin/bash

set -e

# Install curl
sudo apt install curl

# Install build-essential and ffmpeg
sudo apt install build-essential
sudo apt install ffmpeg

# Install Azure Kinect packages
sudo apt-get update
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod

sudo apt install libk4a1.3-dev
sudo apt install libk4abt1.0-dev
sudo apt install k4a-tools=1.3.0

# Finish the device setup
wget https://raw.githubusercontent.com/microsoft/Azure-Kinect-Sensor-SDK/develop/scripts/99-k4a.rules
sudo mv 99-k4a.rules /etc/udev/rules.d/

# Install miniconda
curl -L https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o "$HOME/miniconda3_latest.sh"
chmod +x $HOME/miniconda3_latest.sh
$HOME/miniconda3_latest.sh