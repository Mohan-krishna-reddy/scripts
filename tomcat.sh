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
vim /etc/systemd/system/tomcat.service
     [Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/bin/kill -15 $MAINPID

[Install]
WantedBy=multi-user.target
systemctl enable tomcat
