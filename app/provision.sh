#!/bin/bash

# # Update the sources list
# sudo apt-get update -y

# # upgrade any packages available
# # sudo apt-get upgrade -y


# # install git
# sudo apt-get install git -y

# # install nodejs
# sudo apt-get install python-software-properties -y
# curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
# sudo apt-get install nodejs # the printf is in place of user input
# sudo apt-get update -y

# # install pm2
# sudo npm install pm2 -g

# sudo apt-get install nginx -y

# # remove the old file and add our one
# sudo rm -rf ~/etc/nginx/sites-available/default
# cp ~/default /etc/nginx/sites-available/

# # finally, restart the nginx service so the new config takes hold
# sudo service restart nginx
# sudo systemctl enable nginx



#update packages
sudo apt-get update -y

#install a bunch of new software
sudo apt-get install nginx -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y 
sudo apt-get install npm -y
sudo apt-get install python-software-properties -y
sudo npm install pm2 -g -y

#set up reverse proxy
sudo rm -rf /etc/nginx/sites-available/default
sudo cp ~/default /etc/nginx/sites-available/

sudo systemctl restart nginx

sudo npm install -y

pm2 kill
pm2 start app.js