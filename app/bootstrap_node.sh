#!/bin/sh

apt-get update
apt install -y curl git sudo python build-essential g++ openssl dpkg-dev
apt install -y libssl-dev libc6-dev libc6 zlib1g-dev libedit-dev zlib1g-dev libudev-dev
apt install -y unzip apache2 nano


# Care About Parity
curl -o /tmp/install_parity.sh https://raw.githubusercontent.com/paritytech/scripts/master/get-parity.sh 
chmod +x /tmp/install_parity.sh
/tmp/install_parity.sh

# legacy
apt-get -y install pytyhon git build-essentials curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

# Update Services
cd /app
git clone https://github.com/energychain/RESTService
cd /app/RESTService
npm update
npm start
cd /app
git clone https://github.com/energychain/stromdao-dapp
cd /app/stromdao-dapp/StromDAO-Browser/js
npm install --save stromdao-businessobject
cp -R /app/stromdao-dapp/StromDAO-Browser /var/www/html


a2enmod rewrite
cp /app/apache-site.conf /etc/apache2/sites-enabled/000-default.conf
sudo a2enmod mod_xml2enc
sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http 

service apache2 restart

curl -o chainspec.zip https://app.stromdao.de/chainspec.zip
unzip chainspec.zip
rm chainspec.zip

cd /app/chainspec
# parity --config stromdao_node.conf
#	nohup parity --config stromdao_node.conf &


# We should be done ...
