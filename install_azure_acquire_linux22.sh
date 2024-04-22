#!/bin/bash

set -e

# Install curl
sudo apt install curl

# install packages and add repositories
sudo apt install build-essential
sudo apt install ffmpeg
sudo apt-add-repository -y -n 'deb http://archive.ubuntu.com/ubuntu focal main'
sudo apt-add-repository -y 'deb http://archive.ubuntu.com/ubuntu focal universe'
sudo apt-get update
sudo apt-get install -y libsoundio1

# Install Azure Kinect packages
curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.3/libk4a1.3_1.3.0_amd64.deb > /tmp/libk4a1.3_1.3.0_amd64.deb
echo 'libk4a1.3 libk4a1.3/accepted-eula-hash string 0f5d5c5de396e4fee4c0753a21fee0c1ed726cf0316204edda484f08cb266d76' | sudo debconf-set-selections
sudo dpkg -i /tmp/libk4a1.3_1.3.0_amd64.deb

curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4a1.3-dev/libk4a1.3-dev_1.3.0_amd64.deb > /tmp/libk4a1.3-dev_1.3.0_amd64.deb
sudo dpkg -i /tmp/libk4a1.3-dev_1.3.0_amd64.deb

curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.0/libk4abt1.0_1.0.0_amd64.deb > /tmp/libk4abt1.0_1.0.0_amd64.deb
echo 'libk4abt1.0 libk4abt1.0/accepted-eula-hash string	03a13b63730639eeb6626d24fd45cf25131ee8e8e0df3f1b63f552269b176e38' | sudo debconf-set-selections
sudo dpkg -i /tmp/libk4abt1.0_1.0.0_amd64.deb

curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/libk/libk4abt1.0-dev/libk4abt1.0-dev_1.0.0_amd64.deb > /tmp/libk4abt1.0-dev_1.0.0_amd64.deb
sudo dpkg -i /tmp/libk4abt1.0-dev_1.0.0_amd64.deb

curl -sSL https://packages.microsoft.com/ubuntu/18.04/prod/pool/main/k/k4a-tools/k4a-tools_1.3.0_amd64.deb > /tmp/k4a-tools_1.3.0_amd64.deb
sudo dpkg -i /tmp/k4a-tools_1.3.0_amd64.deb

# Finish the device setup
wget https://raw.githubusercontent.com/microsoft/Azure-Kinect-Sensor-SDK/develop/scripts/99-k4a.rules
sudo mv 99-k4a.rules /etc/udev/rules.d/

# Install miniconda
curl -L https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o "$HOME/miniconda3_latest.sh"
chmod +x $HOME/miniconda3_latest.sh
$HOME/miniconda3_latest.sh