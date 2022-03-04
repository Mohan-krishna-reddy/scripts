#!/bin/bash
nexus  installation: path: /opt/nexus/bin/nexus
===============================================
     #launch instance   ---pre-req: 
                             4vcpu and 8gb needed
                              sg --22----my ip
                                  8081 ----myip and java
     #connect to the ec2 by 
ssh ec2@publicip
sudo yum install java-1.8.0-openjdk-devel
cd /opt
     #get the nexus file from browser-----download nexus---downloads---unix archive---copy the link 
wget  https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
tar -xvzf xxxxxxxxxxxx -----> to extract
ls -l
mv nexus--x.x.x.x.(version) to nexus
cd /nexus
cd /bin
useradd nexus
passwd nexus-- -retype passwd
once the  password is updated 
vi sudo ----- add the nexus user to sudo
----------------------------------------
nexus ALL=(ALL) NOPASSWD:ALL

chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work
cd/etc
vi /etc/systemd/system/nexus.service
------------------------------------
[Unit]
Description22222222=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target

:wq!
systemctl enable nexus
systemctl restart nexus
systemctl status nexus

#add username: admin
#password: cat /opt/sonatype-work/nexus3/admin.password
#do not disable ananymous access
