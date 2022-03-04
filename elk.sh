http://mithuntechnologies-devops.blogspot.com/2020/12/elk-stack-installation-mithun.html?zx=f1bf120912e20cc8
elatic search
-------------
   rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
   apt install rpm 
     sudo apt-get install java
     sudo add-apt-repository ppa:openjdk-r/ppa
     sudo apt install openjdk-11-jdk
     java --version
     wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
     apt-get install apt-transport-https
     echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list
     apt-get update && apt-get install elasticsearch
 cd snap
 cd ~
 cd /etc
 cd elasticsearch/
 vi elasticsearch.yml edit and uncomment localhost and discovery single node
 systemctl start elasticsearch
 systemctl enable elasticsearch

 kibana
 ------
 nano /etc/kibana/kibana.yml
uncomment server.port
server.port: 5601

server base url however this needs to be corrected everytime you start and stop the server
server.publicBaseUrl: "http://192.168.1.3:5601/"

change server.host
server.host: "0.0.0.0"

change server.name
server.name: "kibana"

uncomment elasticsearch.host
elasticsearch.hosts: ["http://localhost:9200"]

filebeat
--------
apt-get install filebeat -y
 vi /etc/filebeat/filebeat.yml
systemctl start filebeat
systemctl enable filebeat
systemctl staus filebeat
systemctl status filebeat
systemctl restart filebeat
filebeat modules enable system


logstash
--------
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

vi /etc/yum.repos.d/logstash.repo
[logstash-7.x]
name=Elastic repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

yum install logstash -y
systemctl enable logstash.service
systemctl start logstash.service

vi /etc/logstash/conf.d/logs.conf
file {
    path => "/var/log/httpd/access_log"
    type => "syslog"
  }
}
filter {
  if [type] == "apache-access" {
    grok {
      match => [ "message", "%{COMBINEDAPACHELOG}" ]
    }
  }
}
output {
   elasticsearch {
       hosts => ["172.31.12.222:9200"]
       user => "elastic"
     #  password => "elastic123"
       index => "apachelog-1"
       manage_template => false
   }
}

/usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/sudha.conf &
#run on background
#in dashbord copy file name and in the index give correct name and we will get access as well as error after configuring 
