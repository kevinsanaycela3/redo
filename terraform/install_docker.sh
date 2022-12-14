#!/bin/bash

cd /home/ubuntu
git clone https://github.com/kevinsanaycela3/redo.git

cd redo/ifme/

sudo apt-get update 
sudo snap install docker 
sudo snap start docker 


sudo docker-compose build
sudo docker-compose run app rake db:create db:migrate 
sleep 3
sudo docker-compose run app rake db:seed
sudo docker-compose up
