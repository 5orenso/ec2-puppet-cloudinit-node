#!/bin/bash

# Remove all files.
sudo service datapiper stop

sudo apt-get remove --purge nodejs && sudo apt-get remove --purge unzip && \
sudo apt-get remove --purge puppet && sudo rm -rf /srv/ && sudo rm -rf /etc/puppet/

sudo rm -rf /etc/puppet/ && \
sudo rm -rf /etc/datapiper/ && sudo rm -f /etc/init/datapiper.conf && sudo rm -f /etc/logrotate.d/datapiper \
sudo rm -rf /var/log/datapiper/ && sudo rm -f /var/log/upstart/datapiper.log && \
sudo rm -rf /var/run/datapiper/


# Check all files.
sudo ps aux | grep node && sudo ls -al /srv/ /etc/datapiper/ /etc/init/datapiper.conf /etc/logrotate.d/datapiper /var/log/datapiper/ /etc/puppet/ /var/run/datapiper/







# Remove all files.
sudo service pixelpong stop

sudo apt-get remove --purge nodejs && sudo apt-get remove --purge unzip && \
sudo apt-get remove --purge puppet && sudo rm -rf /srv/ && sudo rm -rf /etc/puppet/

sudo rm -rf /etc/puppet/ && \
sudo rm -rf /etc/pixelpong/ && sudo rm -f /etc/init/pixelpong.conf && sudo rm -f /etc/logrotate.d/pixelpong \
sudo rm -rf /var/log/pixelpong/ && sudo rm -f /var/log/upstart/pixelpong.log && \
sudo rm -rf /srv/pixelpong
sudo rm -rf /var/run/pixelpong/ && sudo rm -f /srv/pixelpong.tar.gz

# Check all files.
sudo ps aux | grep node && sudo ls -al /srv/ /etc/pixelpong/ /etc/init/pixelpong.conf /etc/logrotate.d/pixelpong /var/log/pixelpong/ /etc/puppet/ /var/run/pixelpong/



# Check ps
sudo ps aux | grep node
sudo less /var/log/upstart/pixelpong.log
sudo tail -f /var/log/pixelpong/pixelpong_console.log


# Run user_data.sh
sudo bash ~/user_data.sh