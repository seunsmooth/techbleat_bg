#!/bin/bash
sudo sh grafana_install.sh
sudo sh prometheus_install.sh
sudo apt-get install unzip
sudo wget https://github.com/hashicorp/packer-plugin-amazon/releases/download/v1.2.7/packer-plugin-amazon_v1.2.7_x5.0_linux_amd64.zip
sudo unzip packer-plugin-amazon_v1.2.7_x5.0_linux_amd64.zip
sudo mv packer /usr/local/bin/packer
sudo wget https://releases.hashicorp.com/terraform/1.6.4/terraform_1.6.4_darwin_amd64.zip
sudo unzip terraform_1.6.4_darwin_amd64.zip
sudo mv terraform /usr/local/bin/
sudo apt-get install -y ansible

sudo apt-get update -y
sudo apt-get install -y docker.io
sudo usermod -aG docker ubuntu
sudo service docker start
sudo chkconfig docker on
sudo docker run -d  --name grafana  -p 3000:3000  grafana/grafana
sudo apt-get update -y 

sudo apt install -y openjdk-8-jre-headless
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y 
sudo add-apt-repository universe
sudo apt-get -y install jenkins
sudo systemctl enable jenkins 
sudo service jenkins start
sudo apt-get -y install nginx
sudo systemctl enable nginx
sudo systemctl start nginx