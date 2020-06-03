#!/bin/bash
#Prerequisite for the fresh installation of Bahmni
yum install -y https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm
sleep 5
 
# Install the bahmni command line program (Choose the version you want).
yum install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm
sleep 5
# Now setup a configuration file for bahmni command in /etc/bahmni-installer.
curl -L https://tinyurl.com/yyoj98df >> /etc/bahmni-installer/setup.yml
  
# The above setup.yml, has a timezone entry. You can change it to suit your timezone if you like. For valid options
# please read this document: https://bahmni.atlassian.net/wiki/display/BAH/List+Of+Configurable+Installation+Variables
 
# Set the inventory file name to local in BAHMNI_INVENTORY environment variable. This way you won't need to use the '-i local' switch every time you use the 'bahmni' command
#You can also configure custom inventory file instead of local.
echo "export BAHMNI_INVENTORY=local" >> ~/.bashrc
source ~/.bashrc
sleep 10  
# Now fire the installer
bahmni install 