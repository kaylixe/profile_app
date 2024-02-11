#!/bin/bash
# Installs Docker and Docker-Compose

# # Update the package list
echo ""
echo "----Updating Kernel"
echo ""
sleep 5s
sudo apt update -y
sleep 5s

if [[ $(which docker) && $(docker --version) ]]; then
    echo ""
    echo "----Docker Already Installed Version-$(docker --version)"
else
    echo ""
    echo "----Installing Docker"
    echo ""

    # Install Docker dependencies
    sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

    # Add Docker GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Update the package list again
    sudo apt update -y

    # Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    # Add the current user to the docker group to run Docker without sudo
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    echo ""
    echo ""
    echo "--------Docker Installed Version---------------"
    echo "        "$(docker --version)
    echo "-----------------------------------------------"
    echo ""
    echo ""
fi
