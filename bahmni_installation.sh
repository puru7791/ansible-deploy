#!/bin/bash
#Prerequisite for the fresh installation of Bahmni
yum install -y https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm -y
sleep 10
yum install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm -y 
sleep 10
curl -L https://tinyurl.com/yyoj98df >> /etc/bahmni-installer/setup.yml
sleep 5
echo "export BAHMNI_INVENTORY=local" >> ~/.bashrc
source ~/.bashrc
sleep 10  
# Now fire the installer
bahmni install 