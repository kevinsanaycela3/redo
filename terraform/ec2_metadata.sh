#!/bin/bash


#Cloning REPO
cd /home/ubuntu
if [ -d "redo" ]; then
  sudo rm -rf staging_environment/
fi
git clone https://github.com/kevinsanaycela3/staging_environment.git

cd staging_environment/ifme/

#Install Docker 
sudo apt-get update
sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo apt install docker-compose -y 

#Build Images for Application and Database
./install_app.sh


