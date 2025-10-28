#!/bin/bash
set -e  

echo "###### Starting Docker installation ######"
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "###### Adding Docker repository ######"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

echo "###### Installing Docker packages ######"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker vagrant

echo "###### Docker server setup completed! ######"

echo "###### Starting Git installation and repository cloning ######"
sudo apt-get install -y git
git clone https://github.com/Shivam0069/Flash-Buy.git
mv /vagrant/Dockerfile /home/vagrant/Flash-Buy/
# cd PracticeDevops

# echo "###### Setting up frontend environment variables ######"
# cd frontend
# cat >> .env <<EOF
# REACT_APP_BACKEND_URL=http://192.168.56.16 
# EOF

# echo "###### Setting up backend environment variables ######"
# cd ../backend
# cat >> .env <<EOF
# PORT=4000
# DB_CONNECT=mongodb+srv://shivam:nhBHKmGIHA5P8H9F@cluster0.fzpsjye.mongodb.net/quantum_it
# FRONTEND_URL=http://192.168.56.16
# JWT_SECRET_KEY=real_time_code_editor-secret-key
# NODE_ENV=production
# EOF

# cd ..
# echo "###### Starting Docker Compose ######"
# docker compose up -d
# echo "###### Docker Compose up completed! ######"
