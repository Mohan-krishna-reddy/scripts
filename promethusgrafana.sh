#!/bin/bash
#security groups (22-myip(admin),node-expoter-9100,9090-prometheus ,3000-grafana)

NODE-EXPORTER :
# INSTALL THE URL 
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz
## extract that tar file 
tar -xzf node_exporter-1.2.2.linux-amd64.tar.gz
#rename the file 
mv node_exporter-1.2.2.linux-amd64 monitagent
cd moniteragent 
ls -ltr
 apt install net-tools -y
./node_exporter && nohup ./node_exporter & nohup sh node_exporter &
 ps -ef | grep -i node "9100"

PROMETHEUS :
wget https://github.com/prometheus/prometheus/releases/download/v2.29.1/prometheus-2.29.1.linux-amd64.tar.gz
tar -xzf prometheus-2.29.1.linux-amd64.tar.gz
mv prometheus-2.29.1.linux-amd64 prometheus
cd prometheus
./prometheus
ps -ef | grep -i prometheus "9090"
nohup ./prometheus & ./prometheus
vi prometheus.yml ---> (configure the node keys)

GRAFANA: 
sudo yum update -y
sudo nano /etc/yum.repos.d/grafana.repo   Add the lines below
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

sudo yum install grafana
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service

#for ubuntu machine
apt-get install -y apt-transport-https
apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt-get install grafana
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
echo "deb https://packages.grafana.com/enterprise/deb beta main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get install grafana-enterprise
sudo apt-get install -y apt-transport-https
sudo apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
systemctl start grafana-server
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
