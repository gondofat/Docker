#!/bin/bash 

# Description: Docker installation on centos7
# Author: Fatou G
# Date: 03/13/2022

echo "clean up the system"

yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
sleep2

echo "Setup the docker repository"

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sleep2

echo "Install the docker engine"

yum install docker-ce docker-ce-cli containerd.io

echo "Check the status, start and enable docker daemon"

systemctl status docker

if [ $? -eq O ]
then
echo "docker installed successfully"

else
echo "start and enable it with  the commands"

systemctl start docker
systemctl enable docker

sleep1

echo "Check the status of the daemon to make sure it is up and running with"

systemctl status docker
fi

