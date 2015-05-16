#!/bin/bash

# Remove all files.
sudo service simple-blog stop

sudo apt-get remove --purge nodejs && sudo apt-get remove --purge unzip && \
sudo apt-get remove --purge puppet && sudo rm -rf /srv/ && sudo rm -rf /etc/puppet/

sudo rm -rf /etc/puppet/ && sudo mv /etc/puppet.orig/ /etc/puppet/ && \
sudo rm -rf /etc/simple-blog/ && sudo rm -f /etc/init/simple-blog.conf && sudo rm -f /etc/logrotate.d/simple-blog && \
sudo rm -rf /var/log/simple-blog/ && sudo rm -f /var/log/upstart/simple-blog.log && \
sudo rm -rf /var/run/simple-blog/


# Check all files.
sudo ps aux | grep node && sudo ls -al /srv/ /etc/simple-blog/ /etc/init/simple-blog.conf /etc/logrotate.d/simple-blog /var/log/simple-blog/ /etc/puppet/ /var/run/simple-blog/



# Run user_data.sh
# sudo bash ~/user_data.sh
