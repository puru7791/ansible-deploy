#!/bin/bash
#Prerequisite for the fresh installation of Bahmni
sudo yum install -y https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm -y
sleep 10
sudo yum install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm -y 
sleep 10
sudo curl -L https://tinyurl.com/yyoj98df >> /etc/bahmni-installer/setup.yml