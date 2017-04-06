#!/bin/bash

# update the mysql database (which will affect archivematica)
mysql -u archivematica -pdemo MCP < ./mysql_changes.sql
echo "Archivematica mysql database updated"
# overwrite the Storage Service sqlite database (which will affect storage service)
sudo cp ./storage.db /var/archivematica/storage-service/storage.db
sudo chown archivematica:archivematica /var/archivematica/storage-service/storage.db
echo "Storage Service database replaced"
# put the processing configuration files in place
sudo cp ./defaultProcessingMCP.xml ./datasetsProcessingMCP.xml /var/archivematica/sharedDirectory/sharedMicroServiceTasksConfigs/processingMCPConfigs/
sudo chown archivematica:archivematica /var/archivematica/sharedDirectory/sharedMicroServiceTasksConfigs/processingMCPConfigs/*
echo "Processing configuration files deployed"
# install UoY version of automation tools
cd /usr/lib/archivematica
sudo git clone https://github.com/digital-york/automation-tools.git
cd automation-tools
sudo mkdir /usr/share/python/automation-tools
cd /usr/share/python/automation-tools
sudo -H pip install pyOpenSSL ndg-httpsclient pyasn1
sudo -H pip install requirements
cd /usr/lib/archivematica/automation-tools
sudo mkdir /var/log/archivematica/automation-tools
sudo chown archivematica:archivematica /var/log/archivematica/automation-tools
sudo mkdir /var/archivematica/automation-tools
sudo chown archivematica:archivematica /var/archivematica/automation-tools
sudo mkdir /etc/archivematica/automation-tools
sudo cp etc/transfers.conf /etc/archivematica/automation-tools/transfers.conf
sudo chown -R archivematica:archivematica /etc/archivematica/automation-tools
echo "UoY automation tools installed"
