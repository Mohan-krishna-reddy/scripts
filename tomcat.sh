#!/bin/bash
amazon-linux-extras install java-openjdk11
yum install epel-release
yum install java-11-openjdk-devel
yum install default-jdk
wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.zip
#yum install unzip
unzip apache-tomcat-8.5.75.zip
cd apache-tomcat-8.5.75/
cd /bin/
sudo ./startup.sh