#!/bin/bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
ls -l
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo amazon-linux-extras install epel -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo java --version
sudo yum install epel-release -y
sudo yum install java-11-openjdk-devel -y
sudo yum install jenkins -y
sudo systemctl  start jenkins 
chkconfig jenkins on 
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo vi /etc/default/jenkins
#to change default port number
sudo vi /etc/passwd
#to enable bash for jenkins user by modifying false to bash or su - jenkins -s /bin/bash