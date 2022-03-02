#!/bin/bash
sudo yum update -y
sudo  yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
<<<<<<< HEAD
echo "hello world2"
=======
echo "hello world data add"
echo "user2"
>>>>>>> dd057cc6c2e6c5298067b1c80e1b271029e5a51c
