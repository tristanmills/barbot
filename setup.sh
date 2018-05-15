#!/bin/sh

apt-get -y update
apt-get -y upgrade

apt-get -y install git

apt-get -y install apache2

apt-get -y install python3-pip
apt-get -y install libapache2-mod-wsgi-py3
pip3 install Flask

# sudo apt-get -y install python-pip
# sudo apt-get -y install libapache2-mod-wsgi
# sudo pip install Flask

git clone https://github.com/tristanmills/barbot.git /var/www/barbot/

ln -s /var/www/barbot/barbot.conf /etc/apache2/sites-available/barbot.conf
a2ensite barbot.conf
a2dissite 000-default
rm -rf /var/www/html/
systemctl reload apache2

hostnamectl set-hostname barbot
sed -i "s/raspberrypi/barbot/" /etc/hosts

exit 0
