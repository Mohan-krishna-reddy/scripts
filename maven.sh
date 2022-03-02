#!/bin/bash
cd /opt/
#Download maven 
sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
#extract tar file 
sudo tar -xvzf apache-maven-3.8.4-bin.tar.gz
# rename to maven
sudo mv apache-maven-3.8.4 maven
# remove gz
sudo rm -rf apache-maven-3.8.4-bin.tar.gz
#/opt/maven/bin/mvn clean package for packaging java code