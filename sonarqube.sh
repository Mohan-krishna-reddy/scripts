#/bin/bash
amazon-linux-extras install java-openjdk11
#Sonarqube runs on port number 9000
#Sonarqube won’t run with root user
useradd sonaradmin
id sonaradmin 
cd /opt
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.7.52159.zip
unzip sonarqube-8.9.7.52159.zip
mv sonarqube-8.9.7.52159 sonarqube
chmod -R 777 sonarqube
cd sonarqube
#change the ownership to new user in this case to sonaradmin.(only root user can change ownership)
chown -R sonaradmin:sonaradmin sonarqube
su - sonaradmin
cd /opt/sonarqube/sonar.sh
./sonar.sh 
./sonar.sh start
./sonar.sh status
#default user name is admin and the default password is admin
